class ArrayViewModel {
    // MARK: - Properties
    private var arrayService = ArrayService()
    var arraySnapshot: [Int] = []

    // MARK: - Methods

    func createArrayTime() -> Double {
        let result = arrayService.createArray()
        self.arraySnapshot = result.arraySnapshot
        return Double(result.time) / 1_000_000_000
    }
    
    // Insert operations
    func insertAtBeginningOneByOneTime() -> Double {
        let result = arrayService.insertOneByOne(at: 0)
        return Double(result.time) / 1_000_000_000
    }

    func insertAtBeginningOnceTime() -> Double {
        let result = arrayService.insertOnce(at: 0)
        return Double(result.time) / 1_000_000_000
    }

    func insertInMiddleOneByOneTime() -> Double {
        let index = arraySnapshot.count / 2
        let result = arrayService.insertOneByOne(at: index)
        return Double(result.time) / 1_000_000_000
    }
    
    func insertInMiddleOnceTime() -> Double {
        let index = arraySnapshot.count / 2
        let result = arrayService.insertOnce(at: index)
        return Double(result.time) / 1_000_000_000
    }

    func insertAtEndOneByOneTime() -> Double {
        let index = arraySnapshot.count
        let result = arrayService.insertOneByOne(at: index)
        return Double(result.time) / 1_000_000_000
    }

    func insertAtEndOnceTime() -> Double {
        let index = arraySnapshot.count
        let result = arrayService.insertOnce(at: index)
        return Double(result.time) / 1_000_000_000
    }

    // Remove operations
    func removeAtBeginningOneByOneTime() -> Double {
        let result = arrayService.removeOneByOne(at: 0, count: 1000)
        return Double(result.time) / 1_000_000_000
    }

    func removeAtBeginningOnceTime() -> Double {
        let result = arrayService.removeOnce(at: 0, count: 1000)
        return Double(result.time) / 1_000_000_000
    }

    func removeInMiddleOneByOneTime() -> Double {
        let index = arraySnapshot.count / 2 - 500
        let result = arrayService.removeOneByOne(at: index, count: 1000)
        return Double(result.time) / 1_000_000_000
    }

    func removeInMiddleOnceTime() -> Double {
        let index = arraySnapshot.count / 2 - 500
        let result = arrayService.removeOnce(at: index, count: 1000)
        return Double(result.time) / 1_000_000_000
    }

    func removeAtEndOneByOneTime() -> Double {
        let result = arrayService.removeOneByOne(at: arraySnapshot.count - 1000, count: 1000)
        return Double(result.time) / 1_000_000_000
    }

    func removeAtEndOnceTime() -> Double {
        let result = arrayService.removeOnce(at: arraySnapshot.count - 1000, count: 1000)
        return Double(result.time) / 1_000_000_000
    }
}
