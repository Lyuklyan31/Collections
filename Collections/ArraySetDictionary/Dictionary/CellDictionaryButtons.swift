import Foundation

// MARK: - CellDictionaryButtons Enum
enum CellDictionaryButtons: CaseIterable {
    
    // MARK: - Cases
    case findFirstContactArray
    case findFirstContactDictionary
    case findLastContactArray
    case findLastContactDictionary
    case searchNonExistingArray
    case searchNonExistingDictionary
    
    // MARK: - Titles
    var title: String {
        switch self {
        case .findFirstContactArray:
            return "Find the first contact in Array"
        case .findLastContactArray:
            return "Find the last contact in Array"
        case .searchNonExistingArray:
            return "Search for a non-existing contact in Array"
        case .findFirstContactDictionary:
            return "Find the first contact in Dictionary"
        case .findLastContactDictionary:
            return "Find the last contact in Dictionary"
        case .searchNonExistingDictionary:
            return "Search for a non-existing contact in Dictionary"
        }
    }
}
