import Foundation

struct Contact {
    let name: String
    let phoneNumber: String
}

class DictionaryService {
    var dictionary: [String: String] = [:]
    var array: [Contact] = []
    
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
    
    func findContactByName(name: String) async -> String {
        let startTime = DispatchTime.now()
        var resultNumber: String = "Not found"
        
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
}
