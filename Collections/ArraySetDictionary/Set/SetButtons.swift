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
    
    // MARK: - Button Actions
    func perform(using button: ButtonView, firstText: String, secondText: String) -> String {
        switch self {
        case .matchingLetters:
            return findMatchingLetters(firstText: firstText, secondText: secondText)
            
        case .nonMatchingLetters:
            return findNonMatchingLetters(firstText: firstText, secondText: secondText)
            
        case .nonMatchingUniqueChars:
            return findUniqueNonMatchingChars(firstText: firstText, secondText: secondText)
        }
    }
    
    // MARK: - Finding Matching Letters
    private func findMatchingLetters(firstText: String, secondText: String) -> String {
        let secondSet = Set(secondText)
        var resultText = ""

        for char in firstText {
            if secondSet.contains(char) {
                resultText.append(char)
            }
        }
        
        return resultText
    }


    // MARK: - Finding Non-Matching Letters
    private func findNonMatchingLetters(firstText: String, secondText: String) -> String {
        let secondSet = Set(secondText)
        var resultText = ""

        for char in firstText {
            if !secondSet.contains(char) {
                resultText.append(char)
            }
        }
        return resultText
    }

    // MARK: - Finding Unique Non-Matching Characters
    private func findUniqueNonMatchingChars(firstText: String, secondText: String) -> String {
        let firstSet = Set(firstText)
        let secondSet = Set(secondText)
        let uniqueNonMatchingCharacters = firstSet.subtracting(secondSet)
        return String(uniqueNonMatchingCharacters)
    }
}
