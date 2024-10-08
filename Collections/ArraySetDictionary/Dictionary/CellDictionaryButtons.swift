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
    
    // MARK: - Perform Actions
    func perform(using service: DictionaryService) async -> String {
        switch self {
        case .findFirstContactArray:
            return await service.findContactByNameInArray(name: "Contact 1")
        case .findFirstContactDictionary:
            return await service.findContactByNameInDictionary(name: "Contact 1")
        case .findLastContactArray:
            return await service.findContactByNameInArray(name: "Contact 9999999")
        case .findLastContactDictionary:
            return await service.findContactByNameInDictionary(name: "Contact 9999999")
        case .searchNonExistingArray:
            return await service.findContactByNameInArray(name: "Contact 10000000")
        case .searchNonExistingDictionary:
            return await service.findContactByNameInDictionary(name: "Contact 10000000")
        }
    }
}
