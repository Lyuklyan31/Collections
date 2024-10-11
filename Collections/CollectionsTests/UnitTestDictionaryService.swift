import XCTest
@testable import Collections

class DictionaryUnitTests: XCTestCase {
    var viewModel: DictionaryViewModel!

    override func setUp() {
        super.setUp()
        viewModel = DictionaryViewModel()
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }

    // MARK: - Tests for Collection Creation

    func testLoadingCollectionsPerformance() {
        viewModel.loadCollections()
        XCTAssertEqual(viewModel.arraySnapshot.count, 9_999_999)
        XCTAssertEqual(viewModel.dictionarySnapshot.count, 9_999_999)
    }

    // MARK: - Tests for Contact Search

    func testFindFirstContactInArray() {
        viewModel.loadCollections()
        let result = viewModel.getFirstContactFromArrayWithTime()
        XCTAssertEqual(result.contact, 1)
    }

    func testFindFirstContactInDictionary() {
        viewModel.loadCollections()
        let result = viewModel.getFirstContactFromDictionaryWithTime()
        XCTAssertEqual(result.contact, 1)
    }

    func testFindLastContactInArray() {
        viewModel.loadCollections()
        let result = viewModel.getLastContactFromArrayWithTime()
        XCTAssertEqual(result.contact, 9_999_999)
    }

    func testFindLastContactInDictionary() {
        viewModel.loadCollections()
        let result = viewModel.getLastContactFromDictionaryWithTime()
        XCTAssertEqual(result.contact, 9_999_999)
    }

    func testFindNonExistingContactInArray() {
        viewModel.loadCollections()
        let result = viewModel.getNonExistingContactFromArrayWithTime()
        XCTAssertEqual(result.contact, 0)
    }

    func testFindNonExistingContactInDictionary() {
        viewModel.loadCollections()
        let result = viewModel.getNonExistingContactFromDictionaryWithTime()
        XCTAssertEqual(result.contact, 0)
    }
}
