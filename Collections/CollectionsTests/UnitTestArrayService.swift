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
        let result = await arrayService.createArray()
        XCTAssertEqual(arrayService.myArray.count, 10_000_000, "Expected array count of 10,000,000. Actual: \(arrayService.myArray.count)")
        XCTAssertTrue(result.contains("Array creation time:"), "Unexpected result format: \(result)")
        XCTAssertEqual(arrayService.createdArrayResults.count, 10_000_000, "Expected created array results count of 10,000,000.")
    }

    // MARK: - Test Inserting at Beginning

    func testInsertAtBeginningArrayOneByOne() async throws {
        await arrayService.createArray()
        let result = await arrayService.insertAtBeginningArrayOneByOne()
        
        XCTAssertEqual(arrayService.insertedAtBeginningOneByOneResults.count, 10_000_000 + 1000, "Expected array count after insertion. Actual: \(arrayService.insertedAtBeginningOneByOneResults.count)")
        XCTAssertTrue(result.contains("Insertion time:"), "Unexpected result format: \(result)")
    }

    func testInsertAtBeginningArray() async throws {
        await arrayService.createArray()
        let result = await arrayService.insertAtBeginningArray()
        
        XCTAssertEqual(arrayService.insertedAtBeginningAllAtOnceResults.count, 10_000_000 + 1000, "Expected array count after insertion. Actual: \(arrayService.insertedAtBeginningAllAtOnceResults.count)")
        XCTAssertTrue(result.contains("Insertion time:"), "Unexpected result format: \(result)")
    }

    // MARK: - Test Inserting in Middle

    func testInsertInMiddleArrayOneByOne() async throws {
        await arrayService.createArray()
        let result = await arrayService.insertInMiddleArrayOneByOne()
        
        XCTAssertEqual(arrayService.insertedInMiddleOneByOneResults.count, 10_000_000 + 1000, "Expected array count after insertion. Actual: \(arrayService.insertedInMiddleOneByOneResults.count)")
        XCTAssertTrue(result.contains("Insertion time:"), "Unexpected result format: \(result)")
    }

    func testInsertInMiddleArray() async throws {
        await arrayService.createArray()
        let result = await arrayService.insertInMiddleArray()
        
        XCTAssertEqual(arrayService.insertedInMiddleAllAtOnceResults.count, 10_000_000 + 1000, "Expected array count after insertion. Actual: \(arrayService.insertedInMiddleAllAtOnceResults.count)")
        XCTAssertTrue(result.contains("Insertion time:"), "Unexpected result format: \(result)")
    }

    // MARK: - Test Inserting at End

    func testInsertAtEndArrayOneByOne() async throws {
        await arrayService.createArray()
        let result = await arrayService.insertAtEndArrayOneByOne()
        
        XCTAssertEqual(arrayService.insertedAtEndOneByOneResults.count, 10_000_000 + 1000, "Expected array count after insertion. Actual: \(arrayService.insertedAtEndOneByOneResults.count)")
        XCTAssertTrue(result.contains("Insertion time:"), "Unexpected result format: \(result)")
    }

    func testInsertAtEndArray() async throws {
        await arrayService.createArray()
        let result = await arrayService.insertAtEndArray()
        
        XCTAssertEqual(arrayService.insertedAtEndAllAtOnceResults.count, 10_000_000 + 1000, "Expected array count after insertion. Actual: \(arrayService.insertedAtEndAllAtOnceResults.count)")
        XCTAssertTrue(result.contains("Insertion time:"), "Unexpected result format: \(result)")
    }

    // MARK: - Test Removing at Beginning

    func testRemoveAtBeginningArrayOneByOne() async throws {
        await arrayService.createArray()
        let result = await arrayService.removeAtBeginningArrayOneByOne()
        
        XCTAssertEqual(arrayService.removedAtBeginningOneByOneResults.count, 10_000_000 - 1000, "Expected array count after removal. Actual: \(arrayService.removedAtBeginningOneByOneResults.count)")
        XCTAssertTrue(result.contains("Removal time:"), "Unexpected result format: \(result)")
    }

    func testRemoveAtBeginningArray() async throws {
        await arrayService.createArray()
        let result = await arrayService.removeAtBeginningArray()
        
        XCTAssertEqual(arrayService.removedAtBeginningAllAtOnceResults.count, 10_000_000 - 1000, "Expected array count after removal. Actual: \(arrayService.removedAtBeginningAllAtOnceResults.count)")
        XCTAssertTrue(result.contains("Removal time:"), "Unexpected result format: \(result)")
    }

    // MARK: - Test Removing in Middle

    func testRemoveInMiddleArrayOneByOne() async throws {
        await arrayService.createArray()
        let result = await arrayService.removeInMiddleArrayOneByOne()
        
        XCTAssertEqual(arrayService.removedInMiddleOneByOneResults.count, 10_000_000 - 1000, "Expected array count after removal. Actual: \(arrayService.removedInMiddleOneByOneResults.count)")
        XCTAssertTrue(result.contains("Removal time:"), "Unexpected result format: \(result)")
    }

    func testRemoveInMiddleArray() async throws {
        await arrayService.createArray()
        let result = await arrayService.removeInMiddleArray()
        
        XCTAssertEqual(arrayService.removedInMiddleAllAtOnceResults.count, 10_000_000 - 1000, "Expected array count after removal. Actual: \(arrayService.removedInMiddleAllAtOnceResults.count)")
        XCTAssertTrue(result.contains("Removal time:"), "Unexpected result format: \(result)")
    }

    // MARK: - Test Removing at End

    func testRemoveAtEndArrayOneByOne() async throws {
        await arrayService.createArray()
        let result = await arrayService.removeAtEndArrayOneByOne()
        
        XCTAssertEqual(arrayService.removedAtEndOneByOneResults.count, 10_000_000 - 1000, "Expected array count after removal. Actual: \(arrayService.removedAtEndOneByOneResults.count)")
        XCTAssertTrue(result.contains("Removal time:"), "Unexpected result format: \(result)")
    }

    func testRemoveAtEndArray() async throws {
        await arrayService.createArray()
        let result = await arrayService.removeAtEndArray()
        
        XCTAssertEqual(arrayService.removedAtEndAllAtOnceResults.count, 10_000_000 - 1000, "Expected array count after removal. Actual: \(arrayService.removedAtEndAllAtOnceResults.count)")
        XCTAssertTrue(result.contains("Removal time:"), "Unexpected result format: \(result)")
    }
}
