//class Program {
//    // This is an input class. Do not edit.
//    class BST {
//        var value: Int
//        var left: BST?
//        var right: BST?
//
//        init(value: Int) {
//            self.value = value
//            left = nil
//            right = nil
//        }
//    }
//
//    func reconstructBst(_ preOrderTraversalValues: [Int]) -> BST? {
//        guard preOrderTraversalValues.isEmpty == false else {
//            return nil
//        }
//        guard preOrderTraversalValues.count > 1 else {
//            return BST(value: preOrderTraversalValues[0])
//        }
//        let rootIdx = 0
//        var rightIdx = preOrderTraversalValues.count - 1
//        for (index, value) in preOrderTraversalValues.enumerated() {
//            if value > preOrderTraversalValues[rootIdx] {
//                rightIdx = index
//                break
//            }
//        }
//
//        let leftSubTree = reconstructBst(rightIdx >= 2 ? Array(preOrderTraversalValues[1..<rightIdx]) : [])
//        let rightSubtree = reconstructBst(Array(preOrderTraversalValues[rightIdx...]))
//        var bst = BST(value: preOrderTraversalValues[rootIdx])
//        bst.left = leftSubTree
//        bst.right = rightSubtree
//        return bst
//
//    }
//
//    func reconstructBst2(_ preOrderTraversalValues: [Int]) -> BST? {
//        var currentRootIndex = 0
//        return getBST(forRootIndex: &currentRootIndex, array: preOrderTraversalValues)
//    }
//
//    func getBST(forRootIndex rootIndex: inout Int, upperBound: Int = .max, lowerBound: Int = .min, array: [Int]) -> BST? {
//        guard rootIndex < array.count else {
//            return nil
//        }
//        let rootElement = array[rootIndex]
//        let bst = BST(value: rootElement)
//        if rootElement >= lowerBound  && rootElement <= upperBound {
//            rootIndex += 1
//        }  else {
//            return nil
//        }
//        let leftSubtree = getBST(forRootIndex: &rootIndex, upperBound: rootElement, lowerBound: lowerBound, array: array)
//        let rightSubtree = getBST(forRootIndex: &rootIndex, upperBound: upperBound, lowerBound: rootElement, array: array)
//        bst.left = leftSubtree
//        bst.right = rightSubtree
//        return bst
//    }
//}
//
//let input = [10, 4, 2, 1, 5, 17, 15, 18]
//dump(Program().reconstructBst2(input))


class Program {
  func topologicalSort(jobs: [Int], dependencies: [[Int]]) -> [Int] {
      var dependencies = dependencies
      var map: [Int: [Int]] = [:]
      for job in jobs {
          var index = 0
          while index < dependencies.count{
              if dependencies[index][1] == job {
                  map[job] = (map[job] ?? []) + [dependencies[index][0]]
                  dependencies.remove(at: index)
              }
              index += 1
          }
          if map[job] == nil {
              map[job] = []
          }
      }
      var inProcessMap: [Int: Bool] = [:]
      var traversedMap: [Int: Bool] = [:]
      var jobArray: [Int] = []
      for mapElement in map {
          guard inProcessMap[mapElement.key] == nil else {
              return []
          }
          guard traversedMap[mapElement.key] == nil else {
              break
          }
          inProcessMap[mapElement.key] = true
          if mapElement.value.isEmpty {
              jobArray.append(mapElement.key)
              inProcessMap[mapElement.key] = nil
              traversedMap[mapElement.key] = nil
          } else {
              var queue = mapElement.value
              while queue.isEmpty == false {
                  guard traversedMap[mapElement.key] == nil else {
                      break
                  }
                  let job = queue.popLast()!
                  guard inProcessMap[job] == nil else {
                      return []
                  }
                  guard traversedMap[mapElement.key] == nil else {
                      break
                  }
                  inProcessMap[job] = true
                  if let jobDeps = map[job] {
                      queue.append(contentsOf: jobDeps)
                  } else {
                      jobArray.append(job)
                      inProcessMap[job] = nil
                      traversedMap[job] = nil
                  }
              }
          }
      }
      print(jobArray)
      return []
  }
    
//    func traverse()
}

print(
    Program().topologicalSort(
        jobs: [1, 2, 3, 4],
        dependencies: [
            [1, 2],
            [1, 3],
            [3, 2],
            [4, 2],
            [4, 3]
        ]
    )
)
