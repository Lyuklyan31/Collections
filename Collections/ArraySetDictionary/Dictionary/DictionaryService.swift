import Foundation

// MARK: - Dictionary Operation Result
struct DictionaryOperationResult {
    let arraySnapshot: [Int]
    let dictionarySnapshot: [String: Int]
}

// MARK: - Dictionary Service
class DictionaryService {
    var dictionary: [String: Int] = [:]
    var array: [Int] = []

    func createCollections() -> DictionaryOperationResult {
        for i in 1...9_999_999 {
            array.append(i)
            let name = "Contact \(i)"
            dictionary[name] = i
        }
        return DictionaryOperationResult(arraySnapshot: array, dictionarySnapshot: dictionary)
    }
}
