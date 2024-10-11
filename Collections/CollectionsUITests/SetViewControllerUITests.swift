import XCTest
@testable import Collections

// MARK: - SetViewControllerUITests
class SetViewControllerUITests: XCTestCase {

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
    }

    func testSetViewController() {
        let app = XCUIApplication()
        app.launch()
        
        // MARK: - Verify Navigation to Collections
        XCTAssertTrue(app.navigationBars["Collections"].exists)
        
        // MARK: - Navigate to Set View
        navigateToSetView(app: app)
        
        // MARK: - Setup Text Fields
        _ = setupTextFields(app: app)
        
        // MARK: - Test Matching Letters Functionality
        testMatchingLetters(app: app, firstText: "Qwerty", secondText: "Qazr")
        
        // MARK: - Test Non-Matching Letters Functionality
        testNonMatchingLetters(app: app)
        
        // MARK: - Test Unique Non-Matching Characters Functionality
        testUniqueNonMatchingCharacters(app: app)
    }

    // MARK: - Navigation Methods
    private func navigateToSetView(app: XCUIApplication) {
        let setCell = app.tables.cells.staticTexts["Set"]
        XCTAssertTrue(setCell.exists)
        setCell.tap()
        
        sleep(1) // Consider using a wait instead of sleep for better performance
        
        let noDigitsViews = app.otherElements.matching(identifier: "NoDigitsView").allElementsBoundByIndex
        XCTAssertEqual(noDigitsViews.count, 2)
    }

    // MARK: - Text Field Setup
    private func setupTextFields(app: XCUIApplication) -> [XCUIElement] {
        let noDigitsViews = app.otherElements.matching(identifier: "NoDigitsView").allElementsBoundByIndex
        
        let firstTextField = noDigitsViews[0].textFields.firstMatch
        let secondTextField = noDigitsViews[1].textFields.firstMatch
        
        XCTAssertTrue(firstTextField.exists)
        XCTAssertTrue(secondTextField.exists)
        
        firstTextField.tap()
        firstTextField.typeText("Qwerty")
        
        secondTextField.tap()
        secondTextField.typeText("Qazr")
        
        return [firstTextField, secondTextField]
    }

    // MARK: - Matching Letters Tests
    private func testMatchingLetters(app: XCUIApplication, firstText: String, secondText: String) {
        let matchingLettersButton = app.buttons["All matching letters"]
        XCTAssertTrue(matchingLettersButton.waitForExistence(timeout: 5), "Matching Letters button does not exist")
        matchingLettersButton.tap()
        
        let matchingResultLabel = app.staticTexts["ResultLabelMatching"]
        XCTAssertTrue(matchingResultLabel.waitForExistence(timeout: 5))
        XCTAssertEqual(matchingResultLabel.label, "Qr") // Update with the expected result
    }

    // MARK: - Non-Matching Letters Tests
    private func testNonMatchingLetters(app: XCUIApplication) {
        let nonMatchingLettersButton = app.buttons["All characters that do not match"]
        XCTAssertTrue(nonMatchingLettersButton.exists)
        nonMatchingLettersButton.tap()
        
        let nonMatchingResultLabel = app.staticTexts["ResultLabelNonMatching"]
        XCTAssertTrue(nonMatchingResultLabel.waitForExistence(timeout: 5))
        XCTAssertEqual(nonMatchingResultLabel.label, "wety") // Update with the expected result
    }

    // MARK: - Unique Non-Matching Characters Tests
    private func testUniqueNonMatchingCharacters(app: XCUIApplication) {
        let nonMatchingUniqueCharsButton = app.buttons["All unique characters from the first text field that do not match in text fields"]
        XCTAssertTrue(nonMatchingUniqueCharsButton.exists)
        nonMatchingUniqueCharsButton.tap()
        
        let uniqueResultLabel = app.staticTexts["ResultLabelUnique"]
        XCTAssertTrue(uniqueResultLabel.waitForExistence(timeout: 5))
        
        let expectedUniqueResults = Set("Qwerty".filter { !("Qazr".contains($0)) }.map { String($0) })
        let uniqueLabelCharacters = Set(uniqueResultLabel.label.map { String($0) })
        XCTAssertTrue(expectedUniqueResults.isSubset(of: uniqueLabelCharacters)
                      || expectedUniqueResults == uniqueLabelCharacters)
    }
}
