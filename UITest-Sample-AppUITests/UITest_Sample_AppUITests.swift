//
//  UITest_Sample_AppUITests.swift
//  UITest-Sample-AppUITests
//
//  Created by Aidos Mukatayev on 2022/04/27.
//

import XCTest

// MARK: Format and naming
//func test_SystemUnderTest_ConditionOrChangeState_ExpectedResult() {
    //arrange (prepare): values needed are created.
    //act (execute): execute the code being tested
    //assert (check result): assert the result you expect with a message
//}

class drdiary_iosUITests: XCTestCase {
    
    var app: XCUIApplication!

    override func setUpWithError() throws {
        print("DEBUGGG: setUpWithError")
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchEnvironment = ["animations": "0"]
        app.launch()
    }

    override func tearDownWithError() throws {
        print("DEBUGGG: tearDownWithError")
    }
    
//    func test_Login_Status() {
//        //arrange
//        let startButton = app.buttons["시작하기"]
//        let otherButton = app.buttons["다른 방법으로 시작하기"]
//        let alreadyHaveEmail = app.buttons["이미 이메일로 가입하셨나요?"]
//
//        //act
//        guard !startButton.exists else { throw XCTSkip("User already logged in") }
//        startButton.tap()
//        otherButton.tap()
//        alreadyHaveEmail.tap()
//    }
    
    func testC() {
        print("DEBUGGG: testC")
    }
    
    func testA() {
        print("DEBUGGG: testA")
    }
    
    func testB() {
        print("DEBUGGG: testB")
    }
    
    // MARK: - Private
    
//    func testopenLoginScreen() throws {

//    }
    
//    private func logoutTestUser() {
//    }
}

// MARK: - Wait for existence
extension XCUIElement {

    @discardableResult
    func waitForExistence() -> Bool {
        self.waitForExistence(timeout: 10)
    }
}

// MARK: - Wait for existence + Tap
extension XCUIElement {

    func waitForExistenceThenTapOrFail(_ message: String? = nil, file: String = #file, line: Int = #line) {
        if self.waitForExistence() {
            self.tap()
        } else {
            let message = message ?? self.title
            XCTFail("\(file) \(line) \(message)")
        }
    }
}
