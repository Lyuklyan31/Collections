import Foundation

// MARK: - Collections Enum
enum Collections: CaseIterable {
    case array
    case set
    case dictionary
    
    // MARK: - Title
    var title: String {
        switch self {
        case .array:
            return "Array"
        case .set:
            return "Set"
        case .dictionary:
            return "Dictionary"
        }
    }
}
