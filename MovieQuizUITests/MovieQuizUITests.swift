//
//  MovieQuizUITests.swift
//  MovieQuizUITests
//
//  Created by Федор Завьялов on 15.12.2023.
//

import XCTest

final class MovieQuizUITests: XCTestCase {
    
    var app:XCUIApplication!

    override func setUpWithError() throws {
        
        app = XCUIApplication()
        app.launch()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        
        app.terminate()
        app = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    
    func testYesButton() {
        sleep(3)
        let firstPoster = app.images["Poster"]
        let firstPosterData = firstPoster.screenshot().pngRepresentation
        app.buttons["Yes"].tap()
        sleep(3)
        let secondPoster = app.images["Poster"]
        let secondPosterData = secondPoster.screenshot().pngRepresentation
        XCTAssertNotEqual(firstPosterData, secondPosterData)
    }
    
    func testNoButtin() {
        
        sleep(3)
        let firstPoster = app.images["Poster"]
        let firstPosterData = firstPoster.screenshot().pngRepresentation
        app.buttons["No"].tap()
        sleep(3)
        let secondPoster = app.images["Poster"]
        let secondPosterData = secondPoster.screenshot().pngRepresentation
        XCTAssertFalse(firstPosterData == secondPosterData)
    }
    
    func testAlertNotification() {
        var index = 0
        repeat{
            index += 1
            let questionIndex = app.staticTexts["index"].label
            XCTAssertEqual(questionIndex, "\(index)/10")
            app.buttons["Yes"].tap()
            sleep(3)
        } while index < 10
        let alert = app.alerts["alertId"]
        XCTAssertTrue(alert.waitForExistence(timeout: 3))
        XCTAssertEqual(alert.label, "Этот раунд окончен!")
        XCTAssertEqual(alert.buttons.firstMatch.label, "Сыграть ещё раз")
    }
    
    func testAlertButtonTest() {
        var index = 0
        repeat{
            index += 1
            let questionIndex = app.staticTexts["index"].label
            XCTAssertEqual(questionIndex, "\(index)/10")
            app.buttons["Yes"].tap()
            sleep(2)
        } while index < 10
        let alert = app.alerts["alertId"]
        XCTAssertTrue(alert.waitForExistence(timeout: 3))
        alert.buttons["Сыграть ещё раз"].tap()
        sleep(3)
        let questionIndex = app.staticTexts["index"].label
        XCTAssertEqual(questionIndex, "1/10")
    }
    
}
