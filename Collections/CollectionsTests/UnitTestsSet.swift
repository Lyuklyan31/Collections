import XCTest
@testable import Collections

class UnitTestsSet: XCTestCase {
    var viewModel: SetViewModel!

    override func setUp() {
        super.setUp()
        viewModel = SetViewModel()
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }

    // MARK: - Matching Letters Tests
    func testMatchingLetters() {
        let firstText = "hello"
        let secondText = "world"

        let result = viewModel.findMatchingLetters(firstText: firstText, secondText: secondText)
        
        XCTAssertEqual(result, "llo")
    }

    // MARK: - Non-Matching Letters Tests
    func testNonMatchingLetters() {
        let firstText = "hello"
        let secondText = "world"
        
        let result = viewModel.findNonMatchingLetters(firstText: firstText, secondText: secondText)
        
        XCTAssertEqual(result, "he")
    }

    // MARK: - Unique Non-Matching Characters Tests
    func testUniqueNonMatchingCharacters() {
        let firstText = "hello"
        let secondText = "world"
        
        let result = viewModel.findUniqueNonMatchingChars(firstText: firstText, secondText: secondText)
        
        let expectedSet: Set<Character> = Set("he")
        let resultSet: Set<Character> = Set(result)
        
        XCTAssertEqual(resultSet, expectedSet, "Expected unique non-matching characters to be \(expectedSet) but got \(resultSet)")
    }

    // MARK: - Edge Case Tests
    func testEmptyFirstText() {
        let firstText = ""
        let secondText = "world"
        
        let result = viewModel.findMatchingLetters(firstText: firstText, secondText: secondText)
        
        XCTAssertEqual(result, "")
    }
    
    func testEmptySecondText() {
        let firstText = "hello"
        let secondText = ""
        
        let result = viewModel.findNonMatchingLetters(firstText: firstText, secondText: secondText)
        
        XCTAssertEqual(result, "hello")
    }
    
    func testEmptyBothTexts() {
        let firstText = ""
        let secondText = ""
        
        let result = viewModel.findUniqueNonMatchingChars(firstText: firstText, secondText: secondText)
        
        XCTAssertEqual(result, "")
    }
}
