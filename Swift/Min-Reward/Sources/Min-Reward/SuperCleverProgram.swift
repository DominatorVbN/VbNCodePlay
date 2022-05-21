//
//  SuperCleverProgram.swift
//  
//
//  Created by Amit Samant on 12/05/22.
//

import Foundation

class SuperCleverProgram {
    
    // Super Clever approach
    // Time Complexity - O(N)
    // Space Complexity - O(N)
    func minRewards(_ scores: [Int]) -> Int {
        var rewards = Array(repeating: 1, count: scores.count)
        var rightIndex = 1
        while rightIndex < scores.count {
            if scores[rightIndex] > scores[rightIndex - 1] {
                rewards[rightIndex] = rewards[rightIndex - 1] + 1
            }
            rightIndex += 1
        }
        var leftIndex = scores.count - 2
        while leftIndex >= 0 {
            if scores[leftIndex] > scores[leftIndex + 1] {
                rewards[leftIndex] = max(rewards[leftIndex], rewards[leftIndex + 1] + 1)
            }
            leftIndex -= 1
        }
        return rewards.reduce(0, { $0 + $1 })
    }
}
