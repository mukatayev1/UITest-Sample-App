//
//  UITest_Sample_AppUITests.swift
//  UITest-Sample-AppUITests
//
//  Created by Aidos Mukatayev on 2022/04/27.
//

import XCTest

class UITest_Sample_AppUITests: XCTestCase {
    
    let app = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInitialState()  {
        let textField = app.textFields["loginTextField"]
        let loginButton = app.buttons["Login"]
        
        waitUntilElementAppear(element: textField)
        waitUntilElementAppear(element: loginButton)
        
        XCTAssertTrue(textField.exists)
        XCTAssertTrue(loginButton.exists)
    }
    
    func testTypeLoginText() {
        let username = "Aidos"
        let textField = app.textFields["loginTextField"]
        waitUntilElementAppear(element: textField)
        textField.tap()
        textField.typeText(username)
        let textFieldText = textField.value as? String
        app.tap()
        XCTAssertEqual(textFieldText, username)
    }
    
    func testLoginButtonEnabledAndTapIfEnabled() {
        let loginButton = app.buttons["Login"]
        waitUntilElementAppear(element: loginButton)
        loginButton.tap()
    }
}

extension UITest_Sample_AppUITests {
    func waitUntilElementAppear(element: XCUIElement, timeout: TimeInterval = 5) {
        let existsPredicate = NSPredicate(format: "exists == true")
        expectation(for: existsPredicate, evaluatedWith: element, handler: nil)
        waitForExpectations(timeout: timeout, handler: nil)
    }
}

