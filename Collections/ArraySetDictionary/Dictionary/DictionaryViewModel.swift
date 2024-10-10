import Foundation

class DictionaryViewModel {
    private var dictionaryService = DictionaryService()

    var arraySnapshot: [Int] = []
    var dictionarySnapshot: [String: Int] = [:]
    
    // MARK: - Collection Creation
    func createArrayDictionary() {
        let result = dictionaryService.createCollections()
        self.arraySnapshot = result.arraySnapshot
        self.dictionarySnapshot = result.dictionarySnapshot
    }
    
    // MARK: - Contact Retrieval
    // Find the first contact in the array and measure the time taken
    func findFirstContactInArrayAndMeasureTime() -> (number: Int, time: Double) {
        let startTime = DispatchTime.now()
        let number = arraySnapshot.first ?? 0
        let endTime = DispatchTime.now()
        let time = Double(endTime.uptimeNanoseconds - startTime.uptimeNanoseconds) / 1_000_000_000
        return (number, time)
    }

    // Find the first contact in the dictionary and measure the time taken
    func findFirstContactInDictionaryAndMeasureTime() -> (number: Int, time: Double) {
        let startTime = DispatchTime.now()
        let number = dictionarySnapshot["Contact 1"] ?? 0
        let endTime = DispatchTime.now()
        let time = Double(endTime.uptimeNanoseconds - startTime.uptimeNanoseconds) / 1_000_000_000
        return (number, time)
    }
    
    // Find the last contact in the array and measure the time taken
    func findLastContactInArrayAndMeasureTime() -> (number: Int, time: Double) {
        let startTime = DispatchTime.now()
        let number = arraySnapshot.last ?? 0
        let endTime = DispatchTime.now()
        let time = Double(endTime.uptimeNanoseconds - startTime.uptimeNanoseconds) / 1_000_000_000
        return (number, time)
    }

    // Find the last contact in the dictionary and measure the time taken
    func findLastContactInDictionaryAndMeasureTime() -> (number: Int, time: Double) {
        let startTime = DispatchTime.now()
        let number = dictionarySnapshot["Contact 9999999"] ?? 0
        let endTime = DispatchTime.now()
        let time = Double(endTime.uptimeNanoseconds - startTime.uptimeNanoseconds) / 1_000_000_000
        return (number, time)
    }
    
    // Find a non-existing contact in the array and measure the time taken
    func findNonExistingContactInArrayAndMeasureTime() -> (number: Int, time: Double) {
        let startTime = DispatchTime.now()
        let number = arraySnapshot.first(where: { $0 == 9999999999 }) ?? 0
        let endTime = DispatchTime.now()
        let time = Double(endTime.uptimeNanoseconds - startTime.uptimeNanoseconds) / 1_000_000_000
        return (number, time)
    }
    
    // Find a non-existing contact in the dictionary and measure the time taken
    func findNonExistingContactInDictionaryAndMeasureTime() -> (number: Int, time: Double) {
        let startTime = DispatchTime.now()
        let number = dictionarySnapshot["Contact 1234567891011"] ?? 0
        let endTime = DispatchTime.now()
        let time = Double(endTime.uptimeNanoseconds - startTime.uptimeNanoseconds) / 1_000_000_000
        return (number, time)
    }
}
