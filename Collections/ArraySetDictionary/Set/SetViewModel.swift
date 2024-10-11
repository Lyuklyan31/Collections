//
//  SetViewModel.swift
//  Collections
//
//  Created by Mac on 11.10.2024.
//

import Foundation

class SetViewModel {
    // MARK: - Finding Matching Letters
    func findMatchingLetters(firstText: String, secondText: String) -> String {
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
    func findNonMatchingLetters(firstText: String, secondText: String) -> String {
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
    func findUniqueNonMatchingChars(firstText: String, secondText: String) -> String {
        let firstSet = Set(firstText)
        let secondSet = Set(secondText)
        let unique = firstSet.subtracting(secondSet)
        return String(unique)
    }
}
