//
//  NewsAppUITests.swift
//  NewsAppUITests
//
//  Created by Shraddha Sutar on 27/07/24.
//

import XCTest

class NewsAppUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
        XCUIApplication().launch()
    }

    override func tearDownWithError() throws {
        // Tear down code
    }

    func testNewsListViewDisplaysArticles() throws {
        let app = XCUIApplication()
        
        // Verify that the navigation title is "News"
        XCTAssertTrue(app.navigationBars["News"].exists)
        
        // Wait for the articles to load and display
        let firstArticleCell = app.scrollViews.otherElements.containing(.staticText, identifier: "3 hrs ago").element
        XCTAssertTrue(firstArticleCell.waitForExistence(timeout: 5))
    }
    
    func testNewsTappedDetailsView() {
        let app = XCUIApplication()
        let button = app.scrollViews.otherElements.buttons.element(boundBy: 1)
        XCTAssertNotNil(button)
        button.tap()
        let backButton = app.navigationBars["Article Details"].buttons.element(boundBy: 0)
        XCTAssertNotNil(backButton)
        backButton.tap()
    }
}
