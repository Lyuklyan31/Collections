import Foundation

class ArrayService {
    // MARK: - Properties
    var myArray = [Int]()
    //Arrays for UnitTests
    var createdArrayResults = [Int]()
    var insertedAtBeginningOneByOneResults = [Int]()
    var insertedAtBeginningAllAtOnceResults = [Int]()
    var insertedInMiddleOneByOneResults = [Int]()
    var insertedInMiddleAllAtOnceResults = [Int]()
    var insertedAtEndOneByOneResults = [Int]()
    var insertedAtEndAllAtOnceResults = [Int]()
    var removedAtBeginningOneByOneResults = [Int]()
    var removedAtBeginningAllAtOnceResults = [Int]()
    var removedInMiddleOneByOneResults = [Int]()
    var removedInMiddleAllAtOnceResults = [Int]()
    var removedAtEndOneByOneResults = [Int]()
    var removedAtEndAllAtOnceResults = [Int]()

    // MARK: - Array Creation
    @discardableResult
    func createArray() async -> String {
        let startTime = DispatchTime.now()
        
        for number in 0...9_999_999 {
            myArray.append(number)
        }
        
        let endTime = DispatchTime.now()
        let nanoseconds = endTime.uptimeNanoseconds - startTime.uptimeNanoseconds
        let seconds = Double(nanoseconds) / 1_000_000_000
        
        let formattedTime = String(format: "%.3f", seconds)
        createdArrayResults = myArray
        
        return "Array creation time: \(formattedTime) ms."
    }

    // MARK: - Insert at Beginning
    func insertAtBeginningArrayOneByOne() async -> String {
        var array = myArray
        let startTime = DispatchTime.now()
        
        for number in 1...1000 {
            array.insert(number, at: 0)
        }
        let endTime = DispatchTime.now()
        let nanoseconds = endTime.uptimeNanoseconds - startTime.uptimeNanoseconds
        let seconds = Double(nanoseconds) / 1_000_000_000
        
        insertedAtBeginningOneByOneResults = array
        
        return "Insertion time: \(seconds) ms."
    }

    func insertAtBeginningArray() async -> String {
        var array = myArray
        let startTime = DispatchTime.now()
        
        array.insert(contentsOf: 1...1000, at: 0)
        
        let endTime = DispatchTime.now()
        let nanoseconds = endTime.uptimeNanoseconds - startTime.uptimeNanoseconds
        let seconds = Double(nanoseconds) / 1_000_000_000
        
        insertedAtBeginningAllAtOnceResults = array
        
        return "Insertion time: \(seconds) ms."
    }

    // MARK: - Insert in Middle
    func insertInMiddleArrayOneByOne() async -> String {
        var array = myArray
        let startTime = DispatchTime.now()
        
        for number in 1...1000 {
            array.insert(number, at: 4_999_999)
        }
        let endTime = DispatchTime.now()
        
        insertedInMiddleOneByOneResults = array
        
        let nanoseconds = endTime.uptimeNanoseconds - startTime.uptimeNanoseconds
        let seconds = Double(nanoseconds) / 1_000_000_000
        
        return "Insertion time: \(seconds) ms."
    }

    func insertInMiddleArray() async -> String {
        var array = myArray
        let startTime = DispatchTime.now()
        
        array.insert(contentsOf: 1...1000, at: 4_999_999)
        
        let endTime = DispatchTime.now()
        let nanoseconds = endTime.uptimeNanoseconds - startTime.uptimeNanoseconds
        let seconds = Double(nanoseconds) / 1_000_000_000
        
        insertedInMiddleAllAtOnceResults = array
        
        return "Insertion time: \(seconds) ms."
    }

    // MARK: - Insert at End
    func insertAtEndArrayOneByOne() async -> String {
        var array = myArray
        let startTime = DispatchTime.now()
        
        for number in 1...1000 {
            array.insert(number, at: 9_999_999)
        }
        let endTime = DispatchTime.now()
        
        insertedAtEndOneByOneResults = array
        
        let nanoseconds = endTime.uptimeNanoseconds - startTime.uptimeNanoseconds
        let seconds = Double(nanoseconds) / 1_000_000_000
        
        return "Insertion time: \(seconds) ms."
    }

    func insertAtEndArray() async -> String {
        var array = myArray
        let startTime = DispatchTime.now()
        
        array.insert(contentsOf: 1...1000, at: 9_999_999)
        
        let endTime = DispatchTime.now()
        
        insertedAtEndAllAtOnceResults = array
        
        let nanoseconds = endTime.uptimeNanoseconds - startTime.uptimeNanoseconds
        let seconds = Double(nanoseconds) / 1_000_000_000
        
        return "Insertion time: \(seconds) ms."
    }

    // MARK: - Remove at Beginning
    func removeAtBeginningArrayOneByOne() async -> String {
        var array = myArray
        let startTime = DispatchTime.now()
        
        for _ in 1...1000 {
            array.remove(at: 0)
        }
        let endTime = DispatchTime.now()
        
        removedAtBeginningOneByOneResults = array
        
        let nanoseconds = endTime.uptimeNanoseconds - startTime.uptimeNanoseconds
        let seconds = Double(nanoseconds) / 1_000_000_000
        
        return "Removal time: \(seconds) ms."
    }

    func removeAtBeginningArray() async -> String {
        var array = myArray
        let startTime = DispatchTime.now()
        
        array.removeFirst(1000)
        
        let endTime = DispatchTime.now()
        removedAtBeginningAllAtOnceResults = array
        
        let nanoseconds = endTime.uptimeNanoseconds - startTime.uptimeNanoseconds
        let seconds = Double(nanoseconds) / 1_000_000_000
        
        return "Removal time: \(seconds) ms."
    }

    // MARK: - Remove in Middle
    func removeInMiddleArrayOneByOne() async -> String {
        var array = myArray
        let startTime = DispatchTime.now()
        
        for _ in 0..<1000 {
            let middleIndex = array.count / 2
            array.remove(at: middleIndex)
        }
        let endTime = DispatchTime.now()
        
        removedInMiddleOneByOneResults = array
        
        let nanoseconds = endTime.uptimeNanoseconds - startTime.uptimeNanoseconds
        let seconds = Double(nanoseconds) / 1_000_000_000
        
        return "Removal time: \(seconds) ms."
    }

    func removeInMiddleArray() async -> String {
        var array = myArray
        let startTime = DispatchTime.now()
        
        let middleIndex = array.count / 2
        
        let startRemoveIndex = max(0, middleIndex - 500)
        let endIndex = min(array.count, startRemoveIndex + 1000)
        array.removeSubrange(startRemoveIndex..<endIndex)
        
        let endTime = DispatchTime.now()
        removedInMiddleAllAtOnceResults = array
        
        let nanoseconds = endTime.uptimeNanoseconds - startTime.uptimeNanoseconds
        let seconds = Double(nanoseconds) / 1_000_000_000
        
        return "Removal time: \(seconds) ms."
    }

    // MARK: - Remove at End
    func removeAtEndArrayOneByOne() async -> String {
        var array = myArray
        let startTime = DispatchTime.now()
        
        for _ in 1...1000 {
            array.removeLast()
        }
        let endTime = DispatchTime.now()
        
        removedAtEndOneByOneResults = array
        
        let nanoseconds = endTime.uptimeNanoseconds - startTime.uptimeNanoseconds
        let seconds = Double(nanoseconds) / 1_000_000_000
        
        return "Removal time: \(seconds) ms."
    }

    func removeAtEndArray() async -> String {
        var array = myArray
        let startTime = DispatchTime.now()
        
        array.removeLast(1000)

        let endTime = DispatchTime.now()
        removedAtEndAllAtOnceResults = array
        
        let nanoseconds = endTime.uptimeNanoseconds - startTime.uptimeNanoseconds
        let seconds = Double(nanoseconds) / 1_000_000_000
        
        return "Removal time: \(seconds) ms."
    }
}
