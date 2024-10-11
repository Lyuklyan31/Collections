class ArrayViewModel {
    // MARK: - Properties
    private var arrayService = ArrayService()
    var arraySnapshot: [Int] = []

    // MARK: - Methods

    // MARK: - Array Creation
    func createArrayTime() -> Double {
        let result = arrayService.createArray()
        self.arraySnapshot = result.arraySnapshot
        return Double(result.time) / 1_000_000_000
    }
    
    // MARK: - Insert Operations
    
    /// Inserts elements one by one at the beginning of the array and returns the time taken.
    func insertAtBeginningOneByOneTime() -> Double {
        let result = arrayService.insertOneByOne(at: 0)
        return Double(result.time) / 1_000_000_000
    }

    /// Inserts all elements at the beginning of the array at once and returns the time taken.
    func insertAtBeginningOnceTime() -> Double {
        let result = arrayService.insertOnce(at: 0)
        return Double(result.time) / 1_000_000_000
    }

    /// Inserts elements one by one in the middle of the array and returns the time taken.
    func insertInMiddleOneByOneTime() -> Double {
        let index = arraySnapshot.count / 2
        let result = arrayService.insertOneByOne(at: index)
        return Double(result.time) / 1_000_000_000
    }
    
    /// Inserts all elements in the middle of the array at once and returns the time taken.
    func insertInMiddleOnceTime() -> Double {
        let index = arraySnapshot.count / 2
        let result = arrayService.insertOnce(at: index)
        return Double(result.time) / 1_000_000_000
    }

    /// Inserts elements one by one at the end of the array and returns the time taken.
    func insertAtEndOneByOneTime() -> Double {
        let index = arraySnapshot.count
        let result = arrayService.insertOneByOne(at: index)
        return Double(result.time) / 1_000_000_000
    }

    /// Inserts all elements at the end of the array at once and returns the time taken.
    func insertAtEndOnceTime() -> Double {
        let index = arraySnapshot.count
        let result = arrayService.insertOnce(at: index)
        return Double(result.time) / 1_000_000_000
    }

    // MARK: - Remove Operations
    
    /// Removes elements one by one from the beginning of the array and returns the time taken.
    func removeAtBeginningOneByOneTime() -> Double {
        let result = arrayService.removeOneByOne(at: 0, count: 1000)
        return Double(result.time) / 1_000_000_000
    }

    /// Removes all elements from the beginning of the array at once and returns the time taken.
    func removeAtBeginningOnceTime() -> Double {
        let result = arrayService.removeOnce(at: 0, count: 1000)
        return Double(result.time) / 1_000_000_000
    }

    /// Removes elements one by one from the middle of the array and returns the time taken.
    func removeInMiddleOneByOneTime() -> Double {
        let index = arraySnapshot.count / 2 - 500
        let result = arrayService.removeOneByOne(at: index, count: 1000)
        return Double(result.time) / 1_000_000_000
    }

    /// Removes all elements from the middle of the array at once and returns the time taken.
    func removeInMiddleOnceTime() -> Double {
        let index = arraySnapshot.count / 2 - 500
        let result = arrayService.removeOnce(at: index, count: 1000)
        return Double(result.time) / 1_000_000_000
    }

    /// Removes elements one by one from the end of the array and returns the time taken.
    func removeAtEndOneByOneTime() -> Double {
        let result = arrayService.removeOneByOne(at: arraySnapshot.count - 1000, count: 1000)
        return Double(result.time) / 1_000_000_000
    }

    /// Removes all elements from the end of the array at once and returns the time taken.
    func removeAtEndOnceTime() -> Double {
        let result = arrayService.removeOnce(at: arraySnapshot.count - 1000, count: 1000)
        return Double(result.time) / 1_000_000_000
    }
}
