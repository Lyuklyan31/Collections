import Foundation

struct ArrayOperationResult {
    let time: UInt64
    let arraySnapshot: [Int]
}

class ArrayService {
    
    // MARK: - Array Creation
    var myArray = [Int]()
    
    @discardableResult
    func createArray() -> ArrayOperationResult {
        let startTime = DispatchTime.now()
        for number in 0...9_999_999 {
            myArray.append(number)
        }
        let endTime = DispatchTime.now()
        let time = endTime.uptimeNanoseconds - startTime.uptimeNanoseconds
        return ArrayOperationResult(time: time, arraySnapshot: myArray)
    }
    
    // MARK: - Insert OneByOne
    func insertOneByOne(at index: Int) -> ArrayOperationResult {
        var array = myArray
        let startTime = DispatchTime.now()
        for number in 1...1000 {
            array.insert(number, at: index)
        }
        let endTime = DispatchTime.now()
        let time = endTime.uptimeNanoseconds - startTime.uptimeNanoseconds
        return ArrayOperationResult(time: time, arraySnapshot: array)
    }
    
    // MARK: - Insert Once
    func insertOnce(at index: Int) -> ArrayOperationResult {
        var array = myArray
        let startTime = DispatchTime.now()
        array.insert(contentsOf: 1...1000, at: index)
        let endTime = DispatchTime.now()
        let time = endTime.uptimeNanoseconds - startTime.uptimeNanoseconds
        return ArrayOperationResult(time: time, arraySnapshot: array)
    }
    
    // MARK: - Remove OneByOne
    func removeOneByOne(at index: Int, count: Int) -> ArrayOperationResult {
        var array = myArray
        let startTime = DispatchTime.now()
        for _ in 0..<count {
            array.remove(at: index)
        }
        let endTime = DispatchTime.now()
        let time = endTime.uptimeNanoseconds - startTime.uptimeNanoseconds
        return ArrayOperationResult(time: time, arraySnapshot: array)
    }

    // MARK: - Remove Once
    func removeOnce(at index: Int, count: Int) -> ArrayOperationResult {
        var array = myArray
        let startTime = DispatchTime.now()
        array.removeSubrange(index..<index + count)
        let endTime = DispatchTime.now()
        let time = endTime.uptimeNanoseconds - startTime.uptimeNanoseconds
        return ArrayOperationResult(time: time, arraySnapshot: array)
    }
}
