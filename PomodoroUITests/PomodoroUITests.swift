//
//  PomodoroUITests.swift
//  PomodoroUITests
//
//  Created by daniel.martinez on 19/9/15.
//  Copyright © 2015 com.igz. All rights reserved.
//

import XCTest

class PomodoroUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSetTimerButtonPressed() {
        
        let app = XCUIApplication()
        
        // "Set Timer" button:
        let button = app.navigationBars["Pomodoro"].buttons["Set Timer"]
        
        // Press button:
        button.tap()
        
        // Button is not accessible because we are on another screen:
        XCTAssertFalse( button.exists )
        
    }
    
    func testUpdateCountdown() {
        
        let app = XCUIApplication()
        
        // Press "Set Timer" button:
        app.navigationBars["Pomodoro"].buttons["Set Timer"].tap()
        
        // Remove all text in TextField:
        let minutesTextField = app.textFields.elementBoundByIndex(0)
        minutesTextField.tap()
        while (( minutesTextField.value as! String ).characters.count > 0) {
            minutesTextField.typeText(XCUIKeyboardKeyDelete)
        }
        
        // Set minutes to "0":
        minutesTextField.typeText("0")
        
        // Remove all text in TextField:
        let secondsTextField = app.textFields.elementBoundByIndex(1)
        secondsTextField.tap()
        while (( secondsTextField.value as! String ).characters.count > 0) {
            secondsTextField.typeText(XCUIKeyboardKeyDelete)
        }
        // Set seconds to "20":
        secondsTextField.typeText("20")
        
        // Press "Save" button:
        app.navigationBars["Edit"].buttons["Save"].tap()
        
        // We are on the first screen:
        XCTAssertNotNil( app.navigationBars["Pomodoro"] )
        
        // Exists a label with "00" text:
        XCTAssertNotNil( app.staticTexts["00"] )
        
        // Exists a label with "20" text:
        XCTAssertNotNil( app.staticTexts["20"] )
        
    }
    
    func testTapInsideCounter() {
        
        let app = XCUIApplication()
        
        let start = app.staticTexts["start"]
        let reset = app.staticTexts["reset"]
        
        // Exists a label with "start" text:
        XCTAssert( start.exists )
        
        // Not exists a label with "reset" text:
        XCTAssertFalse( reset.exists )
        
        // UIStackView is not an accessible element.
        // We must tap an element inside UIStackView to simulate tap on it.
        app.staticTexts["02"].tap()
        
        // Not exists a label with "start" text:
        XCTAssertFalse( start.exists )
        
        // Exists a label with "reset" text:
        XCTAssert( reset.exists )
        
    }
    
    
}
