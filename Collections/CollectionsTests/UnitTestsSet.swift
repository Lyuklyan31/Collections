import XCTest
@testable import Collections

class ButtonsTests: XCTestCase {

    func testMatchingLetters() {
        let button = Buttons.matchingLetters
        
        let firstText = "hello"
        let secondText = "world"
        
        let result = button.perform(using: ButtonView("Test"), firstText: firstText, secondText: secondText)
        
        XCTAssertEqual(result, "llo")
    }
    
    func testNonMatchingLetters() {
        let button = Buttons.nonMatchingLetters
        
        let firstText = "hello"
        let secondText = "world"
        
        let result = button.perform(using: ButtonView("Test"), firstText: firstText, secondText: secondText)
        
        XCTAssertEqual(result, "he")
    }
    
    func testUniqueNonMatchingCharacters() {
        let button = Buttons.nonMatchingUniqueChars
        
        let firstText = "hello"
        let secondText = "world"
        
        let result = button.perform(using: ButtonView("Test"), firstText: firstText, secondText: secondText)
        
        let expectedSet: Set<Character> = Set("he") 
        let resultSet: Set<Character> = Set(result)
        
        XCTAssertEqual(resultSet, expectedSet, "Expected unique non-matching characters to be \(expectedSet) but got \(resultSet)")
    }

    
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
