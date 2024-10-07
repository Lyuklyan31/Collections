import Foundation

// MARK: - Buttons Enum
enum Buttons: CaseIterable {
    case createArray
    case insertAtBeginningOneByOne
    case insertAtBeginning
    case insertInMiddleOneByOne
    case insertInMiddle
    case insertAtEndOneByOne
    case insertAtEnd
    case removeAtEndOneByOne
    case removeAtEnd
    case removeAtBeginningOneByOne
    case removeAtBeginning
    case removeInMiddleOneByOne
    case removeInMiddle

    // MARK: - Titles
    var title: String {
        switch self {
        case .createArray:
            return "Create Int array with 10,000,000 elements"
        case .insertAtBeginningOneByOne:
            return "Insert 1000 elements at the beginning of the array one-by-one."
        case .insertAtBeginning:
            return "Insert 1000 elements at the beginning of the array."
        case .insertInMiddleOneByOne:
            return "Insert 1000 elements in the middle of the array one-by-one."
        case .insertInMiddle:
            return "Insert 1000 elements in the middle of the array."
        case .insertAtEndOneByOne:
            return "Insert 1000 elements at the end of the array one-by-one."
        case .insertAtEnd:
            return "Insert 1000 elements at the end of the array all at once."
        case .removeAtEndOneByOne:
            return "Remove 1000 elements at the end of the array one-by-one."
        case .removeAtEnd:
            return "Remove 1000 elements at the end of the array."
        case .removeAtBeginningOneByOne:
            return "Remove 1000 elements at the beginning of the array one-by-one."
        case .removeAtBeginning:
            return "Remove 1000 elements at the beginning of the array."
        case .removeInMiddleOneByOne:
            return "Remove 1000 elements in the middle of the array one-by-one."
        case .removeInMiddle:
            return "Remove 1000 elements in the middle of the array."
        }
    }
    
    // MARK: - Perform Actions
    func perform(using service: ArrayService) async -> String {
        switch self {
        case .createArray:
            return await service.createArray()
        case .insertAtBeginningOneByOne:
            return await service.insertAtBeginningArrayOneByOne()
        case .insertAtBeginning:
            return await service.insertAtBeginningArray()
        case .insertInMiddleOneByOne:
            return await service.insertInMiddleArrayOneByOne()
        case .insertInMiddle:
            return await service.insertInMiddleArray()
        case .insertAtEndOneByOne:
            return await service.insertAtEndArrayOneByOne()
        case .insertAtEnd:
            return await service.insertAtEndArray()
        case .removeAtEndOneByOne:
            return await service.removeAtEndArrayOneByOne()
        case .removeAtEnd:
            return await service.removeAtEndArray()
        case .removeAtBeginningOneByOne:
            return await service.removeAtBeginningArrayOneByOne()
        case .removeAtBeginning:
            return await service.removeAtBeginningArray()
        case .removeInMiddleOneByOne:
            return await service.removeInMiddleArrayOneByOne()
        case .removeInMiddle:
            return await service.removeInMiddleArray()
        }
    }
}
