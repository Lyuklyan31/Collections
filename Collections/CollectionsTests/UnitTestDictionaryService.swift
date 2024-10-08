import XCTest
@testable import Collections

class DictionaryServiceTests: XCTestCase {
    var service: DictionaryService!

    override func setUp() {
        super.setUp()
        service = DictionaryService()
    }

    override func tearDown() {
        service = nil
        super.tearDown()
    }

    // MARK: - Tests for Contact Creation
    
    func testCreateContactsArrayPerformance() async {
        await service.createContactsArray()
        XCTAssertEqual(service.array.count, 9_999_999)
    }

    func testCreateContactsDictionaryPerformance() async {
        await service.createContactsDictionary()
        XCTAssertEqual(service.dictionary.count, 9_999_999)
    }

    
    // MARK: - Tests for Contact Search

    func testFindContactInArray() async {
        await service.createContactsArray()
        let result = await service.findContactByNameInArray(name: "Contact 1")
        
        // Extract the result number
        let resultNumber = result.components(separatedBy: "Result number: ").last ?? ""
        
        XCTAssertEqual(resultNumber, "123-456-781")
    }

    func testFindContactInDictionary() async {
        await service.createContactsDictionary()
        let result = await service.findContactByNameInDictionary(name: "Contact 1")
        
        // Extract the result number
        let resultNumber = result.components(separatedBy: "Result number: ").last ?? ""
        
        XCTAssertEqual(resultNumber, "123-456-781")
    }

    func testFindLastContactInArray() async {
        await service.createContactsArray()
        let result = await service.findContactByNameInArray(name: "Contact 9999999")
        
        // Extract the result number
        let resultNumber = result.components(separatedBy: "Result number: ").last ?? ""
        
        XCTAssertEqual(resultNumber, "123-456-789999999")
    }

    func testFindLastContactInDictionary() async {
        await service.createContactsDictionary()
        let result = await service.findContactByNameInDictionary(name: "Contact 9999999")
        
        // Extract the result number
        let resultNumber = result.components(separatedBy: "Result number: ").last ?? ""
        
        XCTAssertEqual(resultNumber, "123-456-789999999")
    }
    
    func testFindNonExistingContactInArray() async {
        await service.createContactsArray()
        let result = await service.findContactByNameInArray(name: "Contact 1 0000000")
        
        // Extract the result number
        let resultNumber = result.components(separatedBy: "Result number: ").last ?? ""
        
        XCTAssertEqual(resultNumber, "0")
    }

    func testFindNonExistingContactInDictionary() async {
        await service.createContactsDictionary()
        let result = await service.findContactByNameInDictionary(name: "Contact 1 0000000")
        
        // Extract the result number
        let resultNumber = result.components(separatedBy: "Result number: ").last ?? ""
        
        XCTAssertEqual(resultNumber, "0")
    }
}
