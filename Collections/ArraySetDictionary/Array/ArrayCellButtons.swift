import Foundation

// MARK: - Buttons Enum
enum ArrayCellButtons: CaseIterable {
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
            "Create Int array with 10,000,000 elements"
        case .insertAtBeginningOneByOne:
            "Insert 1000 elements at the beginning of the array one-by-one."
        case .insertAtBeginning:
            "Insert 1000 elements at the beginning of the array."
        case .insertInMiddleOneByOne:
            "Insert 1000 elements in the middle of the array one-by-one."
        case .insertInMiddle:
            "Insert 1000 elements in the middle of the array."
        case .insertAtEndOneByOne:
            "Insert 1000 elements at the end of the array one-by-one."
        case .insertAtEnd:
            "Insert 1000 elements at the end of the array all at once."
        case .removeAtEndOneByOne:
            "Remove 1000 elements at the end of the array one-by-one."
        case .removeAtEnd:
            "Remove 1000 elements at the end of the array."
        case .removeAtBeginningOneByOne:
            "Remove 1000 elements at the beginning of the array one-by-one."
        case .removeAtBeginning:
            "Remove 1000 elements at the beginning of the array."
        case .removeInMiddleOneByOne:
            "Remove 1000 elements in the middle of the array one-by-one."
        case .removeInMiddle:
            "Remove 1000 elements in the middle of the array."
        }
    }
}
