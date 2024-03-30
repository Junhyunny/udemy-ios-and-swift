
import Foundation

protocol RandomGenerator {
    func getRandomIndex() -> Int
}

class DefaultRandomGenerator: RandomGenerator {
    func getRandomIndex() -> Int {
        return Int.random(in: 0..<6)
    }
}

class MockRandomGenerator: RandomGenerator {
    
    var indexArray: Array<Int> = []
    
    func addIndex(index: Int) {
        self.indexArray.append(index)
    }
    
    func getRandomIndex() -> Int {
        if(indexArray.isEmpty) {
            return 0
        }
        let result = indexArray[0]
        indexArray.remove(at: 0)
        return result
    }
}
