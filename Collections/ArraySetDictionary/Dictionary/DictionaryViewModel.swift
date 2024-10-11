import Foundation

// MARK: - DictionaryViewModel
class DictionaryViewModel {
    private var dictionaryService = DictionaryService()

    var arraySnapshot: [Int] = []
    var dictionarySnapshot: [String: Int] = [:]
    
    // MARK: - Collection Creation
    func loadCollections() {
        let result = dictionaryService.createCollections()
        arraySnapshot = result.arraySnapshot
        dictionarySnapshot = result.dictionarySnapshot
    }
    
    // MARK: - Contact Retrieval

    // Get the first contact from the array and the time taken
    func getFirstContactFromArrayWithTime() -> (contact: Int, time: Double) {
        let startTime = DispatchTime.now()
        let contact = arraySnapshot.first ?? 0
        let endTime = DispatchTime.now()
        let time = Double(endTime.uptimeNanoseconds - startTime.uptimeNanoseconds) / 1_000_000_000
        return (contact, time)
    }

    // Get the first contact from the dictionary and the time taken
    func getFirstContactFromDictionaryWithTime() -> (contact: Int, time: Double) {
        let startTime = DispatchTime.now()
        let contact = dictionarySnapshot["Contact 1"] ?? 0
        let endTime = DispatchTime.now()
        let time = Double(endTime.uptimeNanoseconds - startTime.uptimeNanoseconds) / 1_000_000_000
        return (contact, time)
    }

    // Get the last contact from the array and the time taken
    func getLastContactFromArrayWithTime() -> (contact: Int, time: Double) {
        let startTime = DispatchTime.now()
        let contact = arraySnapshot.last ?? 0
        let endTime = DispatchTime.now()
        let time = Double(endTime.uptimeNanoseconds - startTime.uptimeNanoseconds) / 1_000_000_000
        return (contact, time)
    }

    // Get the last contact from the dictionary and the time taken
    func getLastContactFromDictionaryWithTime() -> (contact: Int, time: Double) {
        let startTime = DispatchTime.now()
        let contact = dictionarySnapshot["Contact 9999999"] ?? 0
        let endTime = DispatchTime.now()
        let time = Double(endTime.uptimeNanoseconds - startTime.uptimeNanoseconds) / 1_000_000_000
        return (contact, time)
    }

    // Get a non-existing contact from the array and the time taken
    func getNonExistingContactFromArrayWithTime() -> (contact: Int, time: Double) {
        let startTime = DispatchTime.now()
        let contact = arraySnapshot.first(where: { $0 == 9999999999 }) ?? 0
        let endTime = DispatchTime.now()
        let time = Double(endTime.uptimeNanoseconds - startTime.uptimeNanoseconds) / 1_000_000_000
        return (contact, time)
    }

    // Get a non-existing contact from the dictionary and the time taken
    func getNonExistingContactFromDictionaryWithTime() -> (contact: Int, time: Double) {
        let startTime = DispatchTime.now()
        let contact = dictionarySnapshot["Contact 1234567891011"] ?? 0
        let endTime = DispatchTime.now()
        let time = Double(endTime.uptimeNanoseconds - startTime.uptimeNanoseconds) / 1_000_000_000
        return (contact, time)
    }
}
