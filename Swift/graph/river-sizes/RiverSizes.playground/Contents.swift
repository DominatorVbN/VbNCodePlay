import Foundation

class Program {
  func riverSizes(_ matrix: [[Int]]) -> [Int] {
        
      var sizes: [Int] = []
      var visitedMatrix: [[Bool]] = {
          var rows = [[Bool]]()
          for row in 0..<matrix.count {
              var rowFalse =  [Bool]()
              for _ in 0..<matrix[row].count {
                  rowFalse.append(false)
              }
              rows.append(rowFalse)
          }
          return rows
      }()
      
      for row in 0..<matrix.count {
          for colum in 0..<matrix[row].count {
              if visitedMatrix[row][colum] {
                  continue
              }
              traverseNode(row: row, colum: colum, sizes: &sizes, visitedMatrix: &visitedMatrix)
          }
      }
      
      return sizes
  }
    
    func traverseNode(row: Int, colum: Int, sizes: inout [Int], visitedMatrix: inout [[Bool]]) {
        
        var nodesToVisit = [[row, colum]]
        
        while nodesToVisit.isEmpty == false {
            
        }
        
    }
}
