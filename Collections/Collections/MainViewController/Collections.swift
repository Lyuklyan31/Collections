import Foundation

enum Collections: CaseIterable {
    case array
    case set
    case dictionary
    
    var title: String {
        switch self {
        case .array:
            "Array"
        case .set:
            "Set"
        case .dictionary:
            "Dictionary"
        }
    }
}
