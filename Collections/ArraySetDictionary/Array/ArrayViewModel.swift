import UIKit

class ArrayViewModel {
    // MARK: - Properties
    private var arrayService = ArrayService()
    var arraySnapshot: [Int] = []
    
    // MARK: - Methods

    func createArray() -> String {
        let result = arrayService.createArray()
        self.arraySnapshot = result.arraySnapshot
        let seconds = Double(result.time) / 1_000_000_000
        let formattedTime = String(format: "%.3f", seconds)
        return "Array creation time: \(formattedTime) ms."
    }
    
    // MARK: - Insert in Beginning
    func insertAtBeginningArrayOneByOne() -> String {
        let result = arrayService.insertOneByOne(at: 0)
        let seconds = Double(result.time) / 1_000_000_000
        let formattedTime = String(format: "%.3f", seconds)
        return "Insertion time: \(formattedTime) ms."
    }

    func insertAtBeginningArrayOnce() -> String {
        let result = arrayService.insertOnce(at: 0)
        let seconds = Double(result.time) / 1_000_000_000
        let formattedTime = String(format: "%.3f", seconds)
        return "Insertion time: \(formattedTime) ms."
    }
    
    // MARK: - Insert in Middle
    func insertInMiddleArrayOneByOne() -> String {
        let result = arrayService.insertOneByOne(at: 4_999_999)
        let seconds = Double(result.time) / 1_000_000_000
        let formattedTime = String(format: "%.3f", seconds)
        return "Insertion time: \(formattedTime) ms."
    }
    
    func insertInMiddleArrayOnce() -> String {
        let result = arrayService.insertOnce(at: 4_999_999)
        let seconds = Double(result.time) / 1_000_000_000
        let formattedTime = String(format: "%.3f", seconds)
        return "Insertion time: \(formattedTime) ms."
    }
    
    // MARK: - Insert in End
    func insertInEndArrayOneByOne() -> String {
        let result = arrayService.insertOneByOne(at: 9_999_999)
        let seconds = Double(result.time) / 1_000_000_000
        let formattedTime = String(format: "%.3f", seconds)
        return "Insertion time: \(formattedTime) ms."
    }
    
    func insertInEndArrayOnce() -> String {
        let result = arrayService.insertOnce(at: 9_999_999)
        let seconds = Double(result.time) / 1_000_000_000
        let formattedTime = String(format: "%.3f", seconds)
        return "Insertion time: \(formattedTime) ms."
    }
    
    // MARK: - Remove in Beginning
    func removeAtBeginningArrayOneByOne() -> String {
        let result = arrayService.removeOneByOne(at: 0, count: 1000)
        let seconds = Double(result.time) / 1_000_000_000
        let formattedTime = String(format: "%.3f", seconds)
        return "Removal time: \(formattedTime) ms."
    }

    func removeAtBeginningArrayOnce() -> String {
        let result = arrayService.removeOnce(at: 0, count: 1000)
        let seconds = Double(result.time) / 1_000_000_000
        let formattedTime = String(format: "%.3f", seconds)
        return "Removal time: \(formattedTime) ms."
    }
    
    // MARK: - Remove in Middle
    func removeInMiddleArrayOneByOne() -> String {
        let index = arraySnapshot.count / 2 - 500
        let result = arrayService.removeOneByOne(at: index, count: 1000)
        let seconds = Double(result.time) / 1_000_000_000
        let formattedTime = String(format: "%.3f", seconds)
        return "Removal time: \(formattedTime) ms."
    }

    func removeInMiddleArrayOnce() -> String {
        let index = arraySnapshot.count / 2 - 500
        let result = arrayService.removeOnce(at: index, count: 1000)
        let seconds = Double(result.time) / 1_000_000_000
        let formattedTime = String(format: "%.3f", seconds)
        return "Removal time: \(formattedTime) ms."
    }

    // MARK: - Remove at End
    func removeAtEndArrayOneByOne() -> String {
        let result = arrayService.removeOneByOne(at: arraySnapshot.count - 1000, count: 1000)
        let seconds = Double(result.time) / 1_000_000_000
        let formattedTime = String(format: "%.3f", seconds)
        return "Removal time: \(formattedTime) ms."
    }

    func removeAtEndArrayOnce() -> String {
        let index = arraySnapshot.count - 1000
        let result = arrayService.removeOnce(at: index, count: 1000) 
        let seconds = Double(result.time) / 1_000_000_000
        let formattedTime = String(format: "%.3f", seconds)
        return "Removal time: \(formattedTime) ms."
    }
}

