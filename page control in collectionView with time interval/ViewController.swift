//
//  ViewController.swift
//  page control in collectionView with time interval
//
//  Created by Mohammed Abdullah on 19/07/23.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    var timer = Timer()
    var count = 0
    
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var page: UIPageControl!
    var name = ["pdf","mp3","mp4","ram","bat"]

    override func viewDidLoad() {
        super.viewDidLoad()
        page.currentPage = 0
        page.numberOfPages = name.count
        DispatchQueue.main.async {
            self.timer = Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(self.forTimeInterval), userInfo: nil, repeats: true)
        }
        // Do any additional setup after loading the view.
    }
    @objc func forTimeInterval(){
        if count < name.count-1 {
            count += 1
        }
        else{
            count = 0
        }
        page.currentPage = count
        let index = IndexPath(item: count, section: 0)
        collection.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
    }
    // used for paecontrol time interval
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        let size = collection.frame.size
        return CGSize(width: size.width, height: size.height)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      return  name.count
    }
    // for fixed page control only
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        page.currentPage = indexPath.row
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "one", for: indexPath) as! firstCollectionViewCell
        cell.imageView.image = UIImage(named: name[indexPath.row])
        cell.layer.cornerRadius = 30
        return cell
    }


}

