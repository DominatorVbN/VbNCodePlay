//
//  MidCleverProgram.swift
//  
//
//  Created by Amit Samant on 12/05/22.
//

import Foundation

class MidCleverProgram {
    
    // Mid Clever approach
    // Time Complexity - O(N)
    // Space Complexity - O(N)
    func minRewards(_ scores: [Int]) -> Int {
        var rewards = Array(repeating: 1, count: scores.count)
        let localMinIdxs = getLocalMinIdxs(scores)
        
        for localMinIdx in localMinIdxs {
            var leftIndex = localMinIdx - 1
            while leftIndex >= 0 && scores[leftIndex] > scores[leftIndex + 1] {
                rewards[leftIndex] = max(rewards[leftIndex], rewards[leftIndex+1] + 1)
                leftIndex -= 1
            }
            var rightIndex = localMinIdx + 1
            while rightIndex < scores.count && scores[rightIndex] > scores[rightIndex - 1] {
                rewards[rightIndex] = rewards[rightIndex - 1] + 1
                rightIndex += 1
            }
        }
        return rewards.reduce(0, { $0 + $1 })
    }
    
    func getLocalMinIdxs(_ array: [Int]) -> [Int] {
        var localMinIdxs = Array<Int>()
        for i in 0..<array.count {
            if i == 0 && array[i] < array[i + 1] {
                localMinIdxs.append(i)
            }
            if i == array.count - 1 && array[i] < array[i - 1] {
                localMinIdxs.append(i)
            }
            if i == 0 || i == array.count - 1 {
                continue
            }
            if array[i] < array[i + 1] && array[i] < array[i - 1] {
                localMinIdxs.append(i)
            }
        }
        return localMinIdxs
    }
}
