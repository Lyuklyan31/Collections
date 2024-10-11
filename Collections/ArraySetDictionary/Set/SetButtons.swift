enum SetButtons: CaseIterable {
    // MARK: - Button Cases
    case matchingLetters
    case nonMatchingLetters
    case nonMatchingUniqueChars
    
    // MARK: - Button Titles
    var title: String {
        switch self {
        case .matchingLetters:
            return "All matching letters"
        case .nonMatchingLetters:
            return "All characters that do not match"
        case .nonMatchingUniqueChars:
            return "All unique characters from the first text field that do not match in text fields"
        }
    }
}
