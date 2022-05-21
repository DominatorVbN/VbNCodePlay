//
//  NaiveProgram.swift
//  
//
//  Created by Amit Samant on 11/05/22.
//

import Foundation

class NaiveProgram {
    
    // Naive approach
    // Time Complexity - O(N^2)
    // Space Complexity - O(N)
    func minRewards(_ scores: [Int]) -> Int {
        var rewards = Array(repeating: 1, count: scores.count)
        for i in 1..<scores.count {
            var j = i - 1
            if scores[i] > scores[j] {
                rewards[i] = rewards[j] + 1
            } else {
                //[4,2]
                while j >= 0 && scores[j] > scores[j+1] {
                    rewards[j] = max(rewards[j], rewards[j+1] + 1)
                    j -= 1
                }
            }
        }
        return rewards.reduce(0, { $0 + $1})
    }
}
