//
//  page_control_in_collectionView_with_time_intervalUITestsLaunchTests.swift
//  page control in collectionView with time intervalUITests
//
//  Created by Mohammed Abdullah on 19/07/23.
//

import XCTest

final class page_control_in_collectionView_with_time_intervalUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
