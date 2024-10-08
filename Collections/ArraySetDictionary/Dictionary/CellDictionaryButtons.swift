import Foundation

enum CellDictionaryButtons: CaseIterable {
    case findFirstContactArray
    case findFirstContactDictionary
    case findLastContactArray
    case findLastContactDictionary
    case searchNonExistingArray
    case searchNonExistingDictionary
    
    var title: String {
        switch self {
        case .findFirstContactArray:
            return "Find the first contact1"
        case .findLastContactArray:
            return "Find the last contact1"
        case .searchNonExistingArray:
            return "Search for a non-existing element1"
        case .findFirstContactDictionary:
            return "Find the first contact"
        case .findLastContactDictionary:
            return "Find the last contact"
        case .searchNonExistingDictionary:
            return "Search for a non-existing element"
        }
    }
    
    func perform(using service: DictionaryService) async -> String {
        switch self {
        case .findFirstContactArray:
            return await service.findContactByName(name: "Contact 1")
        case .findFirstContactDictionary:
            return ""
        case .findLastContactArray:
            return await service.findContactByName(name: "Contact 9999999")
        case .findLastContactDictionary:
            return ""
        case .searchNonExistingArray:
            return ""
        case .searchNonExistingDictionary:
            return ""
        }
    }
}

