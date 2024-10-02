import Foundation

class ArrayService {
    var myArray = [Int]()
    
    func createArray() async -> String {
        let startTime = DispatchTime.now()
        
        for number in 0...9_999_999 {
            myArray.append(number)
        }
        
        let endTime = DispatchTime.now()
        let nanoseconds = endTime.uptimeNanoseconds - startTime.uptimeNanoseconds
        let seconds = Double(nanoseconds) / 1_000_000_000
        
        
        let formattedTime = String(format: "%.3f", seconds)
        
        print("Time taken to create array: \(formattedTime) seconds")
        
        return "Array creation time: \(formattedTime) seconds."
    }
    
    func insertAtBeginningArrayOneByOne() async -> String {
        var array = myArray
        let startTime = DispatchTime.now()
        
        for number in 1...1000 {
            array.insert(number, at: 0)
        }
        let endTime = DispatchTime.now()

        let nanoseconds = endTime.uptimeNanoseconds - startTime.uptimeNanoseconds
        let seconds = Double(nanoseconds) / 1_000_000_000
        
        let formattedTime = String(format: "%.3f", seconds)

        return "Insertion time: \(formattedTime) ms."
    }
    
    func insertAtBeginningArray() async -> String {
        var array = myArray
        let startTime = DispatchTime.now()
        
        array.insert(contentsOf: 1...1000, at: 0)
        
        let endTime = DispatchTime.now()
        let nanoseconds = endTime.uptimeNanoseconds - startTime.uptimeNanoseconds
        let seconds = Double(nanoseconds) / 1_000_000_000
        
        let formattedTime = String(format: "%.3f", seconds)

        return "Insertion time: \(formattedTime) ms."
    }
    
    func insertInMiddleArrayOneByOne() async -> String {
        var array = myArray
        let startTime = DispatchTime.now()
        
        for number in 1...1000 {
            array.insert(number, at: 5_000_000)
        }
        let endTime = DispatchTime.now()

        let nanoseconds = endTime.uptimeNanoseconds - startTime.uptimeNanoseconds
        let seconds = Double(nanoseconds) / 1_000_000_000
        
        let formattedTime = String(format: "%.3f", seconds)

        return "Insertion time: \(formattedTime) ms."
    }
    
    func insertInMiddleArray() async -> String {
        var array = myArray
        let startTime = DispatchTime.now()
        
        array.insert(contentsOf: 1...1000, at: 5_000_000)
        
        let endTime = DispatchTime.now()
        let nanoseconds = endTime.uptimeNanoseconds - startTime.uptimeNanoseconds
        let seconds = Double(nanoseconds) / 1_000_000_000
        
        let formattedTime = String(format: "%.3f", seconds)

        return "Insertion time: \(formattedTime) ms."
    }
}
