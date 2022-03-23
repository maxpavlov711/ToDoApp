//
//  ToDoAppUITests.swift
//  ToDoAppUITests
//
//  Created by Max Pavlov on 3.03.22.
//

import XCTest

class ToDoAppUITests: XCTestCase {

    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        app = XCUIApplication()
        app.launchArguments.append("UITesting")
        app.launch()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        XCTAssertTrue(app.isOnMainView)

        app.navigationBars["ToDoApp.TaskListView"].buttons["Add"].tap()
        
        app.textFields["Title"].tap()
        app.textFields["Title"].typeText("Foo")
        
        app.textFields["Location"].tap()
        app.textFields["Location"].typeText("Bar")
        
        app.textFields["Description"].tap()
        app.textFields["Description"].typeText("Baz")
        
        app.textFields["Date"].tap()
        app.textFields["Date"].typeText("01.01.22")
        
        app.textFields["Address"].tap()
        app.textFields["Address"].typeText("Минск")
        
        XCTAssertFalse(app.isOnMainView)
        app.buttons["Save"].tap()
        
        XCTAssertTrue(app.tables.staticTexts["Foo"].exists)
        XCTAssertTrue(app.tables.staticTexts["Bar"].exists)
        XCTAssertTrue(app.tables.staticTexts["01.01.22"].exists)
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
    
    func testWhenCellIsSwipedLeftDoneButtonAppeared() {
        
        XCTAssertTrue(app.isOnMainView)

        app.navigationBars["ToDoApp.TaskListView"].buttons["Add"].tap()
        
        app.textFields["Title"].tap()
        app.textFields["Title"].typeText("Foo")
        
        app.textFields["Location"].tap()
        app.textFields["Location"].typeText("Bar")
        
        app.textFields["Description"].tap()
        app.textFields["Description"].typeText("Baz")
        
        app.textFields["Date"].tap()
        app.textFields["Date"].typeText("01.01.22")
        
        app.textFields["Address"].tap()
        app.textFields["Address"].typeText("Минск")
        
        XCTAssertFalse(app.isOnMainView)
        app.buttons["Save"].tap()
        
        XCTAssertTrue(app.isOnMainView)
        
        let tablesQuery = app.tables.cells
        tablesQuery.element(boundBy: 0).swipeLeft()
        tablesQuery.element(boundBy: 0).buttons["Done"].tap()
        
        XCTAssertEqual(app.staticTexts.element(matching: .any, identifier: "date").label, "")
    }
}

extension XCUIApplication {
    var isOnMainView: Bool {
        return otherElements["mainView"].exists
    }
}
