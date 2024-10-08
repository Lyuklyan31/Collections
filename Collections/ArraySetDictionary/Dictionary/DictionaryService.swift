import Foundation

// MARK: - Contact Model
struct Contact {
    let name: String
    let phoneNumber: String
}

// MARK: - Dictionary Service
class DictionaryService {
    var dictionary: [String: String] = [:]
    var array: [Contact] = []
    
    // MARK: - Contact Creation
    func createContactsArray() async {
        for i in 1...9_999_999 {
            let name = "Contact \(i)"
            let phoneNumber = "123-456-78\(i)"
            let contact = Contact(name: name, phoneNumber: phoneNumber)
            array.append(contact)
        }
    }
    
    func createContactsDictionary() async {
        for i in 1...9_999_999 {
            let name = "Contact \(i)"
            let phoneNumber = "123-456-78\(i)"
            dictionary[name] = phoneNumber
        }
    }
    
    // MARK: - Contact Search
    
    /// Searching in Array
    func findContactByNameInArray(name: String) async -> String {
        let startTime = DispatchTime.now()
        var resultNumber: String = "0"
        
        for contact in array {
            if contact.name == name {
                resultNumber = contact.phoneNumber
                break
            }
        }
        let endTime = DispatchTime.now()
        let nanoseconds = endTime.uptimeNanoseconds - startTime.uptimeNanoseconds
        let seconds = Double(nanoseconds) / 1_000_000_000
        
        let formattedTime = String(format: "%.3f", seconds)
        
        return "First element search time: \(formattedTime) ms. Result number: \(resultNumber)"
    }
    
    /// Searching in Dictionary
    func findContactByNameInDictionary(name: String) async -> String {
        let startTime = DispatchTime.now()
        
        let resultNumber = dictionary[name] ?? "0"
        
        let endTime = DispatchTime.now()
        let nanoseconds = endTime.uptimeNanoseconds - startTime.uptimeNanoseconds
        let seconds = Double(nanoseconds) / 1_000_000_000
        
        let formattedTime = String(format: "%.3f", seconds)
        
        return "Dictionary search time: \(formattedTime) ms. Result number: \(resultNumber)"
    }
}
