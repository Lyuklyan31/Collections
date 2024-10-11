import Foundation

// MARK: - ArrayViewModel
class ArrayViewModel {
    // MARK: - Properties
    private var arrayService = ArrayService()
    var arraySnapshot: [Int] = []

    // MARK: - Methods

    // MARK: - Array Creation Time
    func getTimeForArrayCreation() -> Double {
        let result = arrayService.createArray()
        self.arraySnapshot = result.arraySnapshot
        return Double(result.time) / 1_000_000_000
    }
    
    // MARK: - Insert Operations Time
    
    func getTimeForInsertAtBeginningOneByOne() -> Double {
        let result = arrayService.insertOneByOne(at: 0)
        return Double(result.time) / 1_000_000_000
    }

    func getTimeForInsertAtBeginningOnce() -> Double {
        let result = arrayService.insertOnce(at: 0)
        return Double(result.time) / 1_000_000_000
    }

    func getTimeForInsertInMiddleOneByOne() -> Double {
        let index = arraySnapshot.count / 2
        let result = arrayService.insertOneByOne(at: index)
        return Double(result.time) / 1_000_000_000
    }
    
    func getTimeForInsertInMiddleOnce() -> Double {
        let index = arraySnapshot.count / 2
        let result = arrayService.insertOnce(at: index)
        return Double(result.time) / 1_000_000_000
    }

    func getTimeForInsertAtEndOneByOne() -> Double {
        let index = arraySnapshot.count
        let result = arrayService.insertOneByOne(at: index)
        return Double(result.time) / 1_000_000_000
    }

    func getTimeForInsertAtEndOnce() -> Double {
        let index = arraySnapshot.count
        let result = arrayService.insertOnce(at: index)
        return Double(result.time) / 1_000_000_000
    }

    // MARK: - Remove Operations Time
    
    func getTimeForRemoveAtBeginningOneByOne() -> Double {
        let result = arrayService.removeOneByOne(at: 0, count: 1000)
        return Double(result.time) / 1_000_000_000
    }

    func getTimeForRemoveAtBeginningOnce() -> Double {
        let result = arrayService.removeOnce(at: 0, count: 1000)
        return Double(result.time) / 1_000_000_000
    }

    func getTimeForRemoveInMiddleOneByOne() -> Double {
        let index = arraySnapshot.count / 2 - 500
        let result = arrayService.removeOneByOne(at: index, count: 1000)
        return Double(result.time) / 1_000_000_000
    }

    func getTimeForRemoveInMiddleOnce() -> Double {
        let index = arraySnapshot.count / 2 - 500
        let result = arrayService.removeOnce(at: index, count: 1000)
        return Double(result.time) / 1_000_000_000
    }

    func getTimeForRemoveAtEndOneByOne() -> Double {
        let result = arrayService.removeOneByOne(at: arraySnapshot.count - 1000, count: 1000)
        return Double(result.time) / 1_000_000_000
    }

    func getTimeForRemoveAtEndOnce() -> Double {
        let result = arrayService.removeOnce(at: arraySnapshot.count - 1000, count: 1000)
        return Double(result.time) / 1_000_000_000
    }
}
