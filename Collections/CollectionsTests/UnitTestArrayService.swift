import XCTest
@testable import Collections

class ArrayServiceTests: XCTestCase {
    var arrayService: ArrayService!

    override func setUp() {
        super.setUp()
        arrayService = ArrayService()
    }

    override func tearDown() {
        arrayService = nil
        super.tearDown()
    }

    // MARK: - Test Array Creation
    func testCreateArray() async throws {
        let result = arrayService.createArray()
        XCTAssertEqual(result.arraySnapshot.count, 10_000_000, "Expected array count of 10,000,000. Actual: \(result.arraySnapshot.count)")
    }

    // MARK: - Test Inserting at Beginning
    func testInsertAtBeginningArrayOneByOne() async throws {
        arrayService.createArray()
        let result = arrayService.insertOneByOne(at: 0)
        XCTAssertEqual(result.arraySnapshot.count, 10_000_000 + 1000, "Expected array count after insertion. Actual: \(result.arraySnapshot.count)")
    }

    func testInsertAtBeginningArray() async throws {
        arrayService.createArray()
        let result = arrayService.insertOnce(at: 0)
        XCTAssertEqual(result.arraySnapshot.count, 10_000_000 + 1000, "Expected array count after insertion. Actual: \(result.arraySnapshot.count)")
    }

    // MARK: - Test Inserting in Middle
    func testInsertInMiddleArrayOneByOne() async throws {
        arrayService.createArray()
        let result = arrayService.insertOneByOne(at: 4_999_999)
        XCTAssertEqual(result.arraySnapshot.count, 10_000_000 + 1000, "Expected array count after insertion. Actual: \(result.arraySnapshot.count)")
    }

    func testInsertInMiddleArray() async throws {
        arrayService.createArray()
        let result = arrayService.insertOnce(at: 4_999_999)
        XCTAssertEqual(result.arraySnapshot.count, 10_000_000 + 1000, "Expected array count after insertion. Actual: \(result.arraySnapshot.count)")
    }

    // MARK: - Test Inserting at End
    func testInsertAtEndArrayOneByOne() async throws {
        arrayService.createArray()
        let result = arrayService.insertOneByOne(at: 9_999_999)
        XCTAssertEqual(result.arraySnapshot.count, 10_000_000 + 1000, "Expected array count after insertion. Actual: \(result.arraySnapshot.count)")
    }

    func testInsertAtEndArray() async throws {
        arrayService.createArray()
        let result = arrayService.insertOnce(at: 9_999_999)
        XCTAssertEqual(result.arraySnapshot.count, 10_000_000 + 1000, "Expected array count after insertion. Actual: \(result.arraySnapshot.count)")
    }

    // MARK: - Test Removing at Beginning
    func testRemoveAtBeginningArrayOneByOne() async throws {
        arrayService.createArray()
        let result = arrayService.removeOneByOne(at: 0, count: 1000)
        XCTAssertEqual(result.arraySnapshot.count, 10_000_000 - 1000, "Expected array count after removal. Actual: \(result.arraySnapshot.count)")
    }

    func testRemoveAtBeginningArray() async throws {
        arrayService.createArray()
        let result = arrayService.removeOnce(at: 0, count: 1000)
        XCTAssertEqual(result.arraySnapshot.count, 10_000_000 - 1000, "Expected array count after removal. Actual: \(result.arraySnapshot.count)")
    }

    // MARK: - Test Removing in Middle
    func testRemoveInMiddleArrayOneByOne() async throws {
        arrayService.createArray()
        let index = arrayService.myArray.count / 2 - 500
        let result = arrayService.removeOneByOne(at: index, count: 1000)
        XCTAssertEqual(result.arraySnapshot.count, 10_000_000 - 1000, "Expected array count after removal. Actual: \(result.arraySnapshot.count)")
    }

    func testRemoveInMiddleArray() async throws {
        arrayService.createArray()
        let index = arrayService.myArray.count / 2 - 500
        let result = arrayService.removeOnce(at: index, count: 1000)
        XCTAssertEqual(result.arraySnapshot.count, 10_000_000 - 1000, "Expected array count after removal. Actual: \(result.arraySnapshot.count)")
    }

    // MARK: - Test Removing at End
    func testRemoveAtEndArrayOneByOne() async throws {
        arrayService.createArray()
        let result = arrayService.removeOneByOne(at: arrayService.myArray.count - 1000, count: 1000)
        XCTAssertEqual(result.arraySnapshot.count, 10_000_000 - 1000, "Expected array count after removal. Actual: \(result.arraySnapshot.count)")
    }

    func testRemoveAtEndArray() async throws {
        arrayService.createArray()
        let index = arrayService.myArray.count - 1000
        let result = arrayService.removeOnce(at: index, count: 1000)
        XCTAssertEqual(result.arraySnapshot.count, 10_000_000 - 1000, "Expected array count after removal. Actual: \(result.arraySnapshot.count)")
    }
}
