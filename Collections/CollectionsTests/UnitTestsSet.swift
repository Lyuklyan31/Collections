import XCTest
@testable import Collections

class ButtonsTests: XCTestCase {
    
    // MARK: - Matching Letters Tests
    func testMatchingLetters() {
        let button = Buttons.matchingLetters
        
        let firstText = "hello"
        let secondText = "world"
        
        let result = button.perform(using: ButtonView("Test"), firstText: firstText, secondText: secondText)
        
        XCTAssertEqual(result, "llo")
    }

    // MARK: - Non-Matching Letters Tests
    func testNonMatchingLetters() {
        let button = Buttons.nonMatchingLetters
        
        let firstText = "hello"
        let secondText = "world"
        
        let result = button.perform(using: ButtonView("Test"), firstText: firstText, secondText: secondText)
        
        XCTAssertEqual(result, "he")
    }

    // MARK: - Unique Non-Matching Characters Tests
    func testUniqueNonMatchingCharacters() {
        let button = Buttons.nonMatchingUniqueChars
        
        let firstText = "hello"
        let secondText = "world"
        
        let result = button.perform(using: ButtonView("Test"), firstText: firstText, secondText: secondText)
        
        let expectedSet: Set<Character> = Set("he")
        let resultSet: Set<Character> = Set(result)
        
        XCTAssertEqual(resultSet, expectedSet, "Expected unique non-matching characters to be \(expectedSet) but got \(resultSet)")
    }

    // MARK: - Edge Case Tests
    func testEmptyFirstText() {
        let button = Buttons.matchingLetters
        
        let firstText = ""
        let secondText = "world"
        
        let result = button.perform(using: ButtonView("Test"), firstText: firstText, secondText: secondText)
        
        XCTAssertEqual(result, "")
    }
    
    func testEmptySecondText() {
        let button = Buttons.nonMatchingLetters
        
        let firstText = "hello"
        let secondText = ""
        
        let result = button.perform(using: ButtonView("Test"), firstText: firstText, secondText: secondText)
        
        XCTAssertEqual(result, "hello")
    }
    
    func testEmptyBothTexts() {
        let button = Buttons.nonMatchingUniqueChars
        
        let firstText = ""
        let secondText = ""
        
        let result = button.perform(using: ButtonView("Test"), firstText: firstText, secondText: secondText)
        
        XCTAssertEqual(result, "")
    }
}
