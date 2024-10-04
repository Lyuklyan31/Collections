import Foundation

class ArrayService {
    var myArray = [Int]()
    
    // MARK: - Create Array with 10,000,000 elements
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
    
    // MARK: - Insert at the Beginning One-by-One
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
    
    // MARK: - Insert at the Beginning All at Once
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
    
    // MARK: - Insert in the Middle One-by-One
    func insertInMiddleArrayOneByOne() async -> String {
        var array = myArray
        let startTime = DispatchTime.now()
        
        for number in 1...1000 {
            array.insert(number, at: 4_999_999)
        }
        let endTime = DispatchTime.now()
        
        let nanoseconds = endTime.uptimeNanoseconds - startTime.uptimeNanoseconds
        let seconds = Double(nanoseconds) / 1_000_000_000
        
        let formattedTime = String(format: "%.3f", seconds)
        
        return "Insertion time: \(formattedTime) ms."
    }
    
    // MARK: - Insert in the Middle All at Once
    func insertInMiddleArray() async -> String {
        var array = myArray
        let startTime = DispatchTime.now()
        
        array.insert(contentsOf: 1...1000, at: 4_999_999)
        
        let endTime = DispatchTime.now()
        let nanoseconds = endTime.uptimeNanoseconds - startTime.uptimeNanoseconds
        let seconds = Double(nanoseconds) / 1_000_000_000
        
        let formattedTime = String(format: "%.3f", seconds)
        
        return "Insertion time: \(formattedTime) ms."
    }
    
    // MARK: - Insert at the End One-by-One
    func insertAtEndArrayOneByOne() async -> String {
        var array = myArray
        let startTime = DispatchTime.now()
        
        for number in 1...1000 {
            array.insert(number, at: 9_999_999)
        }
        let endTime = DispatchTime.now()
        
        let nanoseconds = endTime.uptimeNanoseconds - startTime.uptimeNanoseconds
        let seconds = Double(nanoseconds) / 1_000_000_000
        
        let formattedTime = String(format: "%.3f", seconds)
        
        return "Insertion time: \(formattedTime) ms."
    }
    
    // MARK: - Insert at the End All at Once
    func insertAtEndArray() async -> String {
        var array = myArray
        let startTime = DispatchTime.now()
        
        array.insert(contentsOf: 1...1000, at: 9_999_999)
        
        let endTime = DispatchTime.now()
        
        let nanoseconds = endTime.uptimeNanoseconds - startTime.uptimeNanoseconds
        let seconds = Double(nanoseconds) / 1_000_000_000
        
        let formattedTime = String(format: "%.3f", seconds)
        
        return "Insertion time: \(formattedTime) ms."
    }
    
    //    // MARK: - Remove at the Beginning One-by-One
    //    func removeAtBeginningArrayOneByOne() async -> String {
    //        var array = myArray
    //        let startTime = DispatchTime.now()
    //
    //        for number in 1...1000 {
    //            array.remove(at: number)
    //        }
    //        let endTime = DispatchTime.now()
    //
    //        let nanoseconds = endTime.uptimeNanoseconds - startTime.uptimeNanoseconds
    //        let seconds = Double(nanoseconds) / 1_000_000_000
    //
    //        let formattedTime = String(format: "%.3f", seconds)
    //
    //        return "Insertion time: \(formattedTime) ms."
    //    }
    //
    //    // MARK: - Remove at the Beginning All at Once
    //    func removeAtBeginningArray() async -> String {
    //        var array = myArray
    //        let startTime = DispatchTime.now()
    //
    //        array.insert(contentsOf: 1...1000, at: 0)
    //
    //        let endTime = DispatchTime.now()
    //        let nanoseconds = endTime.uptimeNanoseconds - startTime.uptimeNanoseconds
    //        let seconds = Double(nanoseconds) / 1_000_000_000
    //
    //        let formattedTime = String(format: "%.3f", seconds)
    //
    //        return "Insertion time: \(formattedTime) ms."
    //    }
    //
    //    // MARK: - Remove in the Middle One-by-One
    //    func removeInMiddleArrayOneByOne() async -> String {
    //        var array = myArray
    //        let startTime = DispatchTime.now()
    //
    //        for number in 1...1000 {
    //            array.insert(number, at: 4_999_999)
    //        }
    //        let endTime = DispatchTime.now()
    //
    //        let nanoseconds = endTime.uptimeNanoseconds - startTime.uptimeNanoseconds
    //        let seconds = Double(nanoseconds) / 1_000_000_000
    //
    //        let formattedTime = String(format: "%.3f", seconds)
    //
    //        return "Insertion time: \(formattedTime) ms."
    //    }
    //
    //    // MARK: - Remove in the Middle All at Once
    //    func removeInMiddleArray() async -> String {
    //        var array = myArray
    //        let startTime = DispatchTime.now()
    //
    //        array.insert(contentsOf: 1...1000, at: 4_999_999)
    //
    //        let endTime = DispatchTime.now()
    //        let nanoseconds = endTime.uptimeNanoseconds - startTime.uptimeNanoseconds
    //        let seconds = Double(nanoseconds) / 1_000_000_000
    //
    //        let formattedTime = String(format: "%.3f", seconds)
    //
    //        return "Insertion time: \(formattedTime) ms."
    //    }
    //
    //    // MARK: - Remove at the End One-by-One
    //    func removeAtEndArrayOneByOne() async -> String {
    //        var array = myArray
    //        let startTime = DispatchTime.now()
    //
    //        for number in 1...1000 {
    //            array.insert(number, at: 9_999_999)
    //        }
    //        let endTime = DispatchTime.now()
    //
    //        let nanoseconds = endTime.uptimeNanoseconds - startTime.uptimeNanoseconds
    //        let seconds = Double(nanoseconds) / 1_000_000_000
    //
    //        let formattedTime = String(format: "%.3f", seconds)
    //
    //        return "Insertion time: \(formattedTime) ms."
    //    }
    //
    //    // MARK: - Remove at the End All at Once
    //    func removeAtEndArray() async -> String {
    //        var array = myArray
    //        let startTime = DispatchTime.now()
    //
    //        array.insert(contentsOf: 1...1000, at: 9_999_999)
    //
    //        let endTime = DispatchTime.now()
    //
    //        let nanoseconds = endTime.uptimeNanoseconds - startTime.uptimeNanoseconds
    //        let seconds = Double(nanoseconds) / 1_000_000_000
    //
    //        let formattedTime = String(format: "%.3f", seconds)
    //
    //        return "Insertion time: \(formattedTime) ms."
    //    }
    //}
}
