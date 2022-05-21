/*
 # Single Cycle Check
 
 You're given an array of integers where each integer represents a jump of its value in the array. For instance, the integer 2 represents a jump of two indices forward in the array; the integer -3 represents a jump of three indices backward in the array.
 If a jump spills past the array's bounds, it wraps over to the other side. For instance, a jump of -1 at index O
 brings us to the last index in the array. Similarly, a jump of 1 at the last index in the array brings us to index
 10
 Write a function that returns a boolean representing whether the jumps in the array form a single cycle. A single
 cycle occurs if, starting at any index in the array and following the jumps, every element in the array is visited
 exactly once before landing back on the starting index.
 Sample Input
 array = [2, 3, 1, -4, -4, 2]
 Sample Output
 true
 */
import Foundation

class Program {
    
    func hasSingleCycle(array: [Int]) -> Bool {
        for (index, value) in array.enumerated() {
            var didComeBack = false
            var currentElement = value
            for _ in 0..<array.count {
                let addtiveIndex = index + currentElement
                let lessCount = array.count - 1
                let moduloIndex = addtiveIndex % lessCount
                let positiveIndex = moduloIndex > 0 ? moduloIndex : ((array.count-1)+moduloIndex)
                let jumpedValue = array[positiveIndex]
                if jumpedValue == value {
                    didComeBack = true
                }
                currentElement = jumpedValue
            }
            if didComeBack == false {
                return false
            }
        }
        return true
    }
}

print(Program().hasSingleCycle(array: [10, 11, -6, -23, -2, 3, 88, 908, -26]))
