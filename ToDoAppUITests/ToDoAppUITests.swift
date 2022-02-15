//
//  ToDoAppUITests.swift
//  ToDoAppUITests
//
//  Created by Дмитрий Бабаев on 08.02.2022.
//

import XCTest

class ToDoAppUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        XCUIApplication().launch()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()

        app.navigationBars["ToDoApp.TaskListView"].buttons["Add"].tap()
        app.textFields["Title"].tap()
        app.textFields["Title"].typeText("Foo")
        
        app.textFields["Location"].tap()
        app.textFields["Location"].typeText("Bar")
        
        app.textFields["Description"].tap()
        app.textFields["Description"].typeText("Baz")
        
        app.textFields["Date"].tap()
        app.textFields["Date"].typeText("01.01.19")
        
        app.textFields["Address"].tap()
        app.textFields["Address"].typeText("Ufa")
        
        XCTAssertTrue(app.tables.staticTexts["Foo"].exists)
        XCTAssertTrue(app.tables.staticTexts["Bar"].exists)
        XCTAssertTrue(app.tables.staticTexts["Baz"].exists)
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
