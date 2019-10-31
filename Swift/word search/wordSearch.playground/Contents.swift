import Foundation

//direction for word traversing
enum Direction{
    case top
    case bottom
    case left
    case right
    case diagonalTopLeft
    case diagonalBottomLeft
    case diagonalTopRight
    case diagonalBottomRight
    
    static let cases = [top,bottom,left,right,diagonalTopLeft,diagonalBottomLeft,diagonalTopRight,diagonalBottomRight]
}

typealias Row = Int
typealias Column = Int

//index calcuation according to direction
func calculateDirectionalIndex(_ grid: [String], direction: Direction, currentIndex index: (Row,Column), row: Int, coloum: Int)->(Row,Column)?{
    
    let marc = row - 1
    let macc = coloum - 1
    
    var calIndex: (Row, Column)? = nil
    switch direction {
    case .top:
        if index.0 > 0{
            calIndex = (index.0-1,index.1)
        }
    case .bottom:
        if index.0 < marc{
            calIndex = (index.0+1,index.1)
        }
    case .left:
        if index.1 > 0 {
            calIndex = (index.0, index.1-1)
        }
    case .right:
        if index.1 < macc{
            calIndex = (index.0, index.1+1)
        }
    case .diagonalTopLeft:
        if index.1 > 0 && index.0 > 0{
            calIndex = (index.0 - 1, index.1 - 1)
        }
    case .diagonalBottomLeft:
        if index.0 < marc && index.1 > 0{
            calIndex = (index.0+1,index.1-1)
        }
    case .diagonalTopRight:
        if index.0 > 0 && index.1 < macc{
            calIndex = (index.0-1, index.1+1)
        }
    case .diagonalBottomRight:
        if index.0 < marc && index.1 < macc{
            calIndex = (index.0+1, index.1+1)
        }
    }
    guard let guardedCalIndex = calIndex else { return nil }
    guard grid.getCharacterAt(guardedCalIndex).notNil() else{  return nil }
    return guardedCalIndex
}
// getting count of occurence for a perticular direction
func getWordOccurenceIn(_ direction: Direction, grid: [String], currentIndex: (Row,Column) = (0,0), stringIndex: Int = 0, word: String, row: Int, coloum: Int, count: Int = 0)->Int{
    guard let currentWord = grid.getCharacterAt(currentIndex) else { return 0 }
    guard currentWord == word.charAtIndex(stringIndex) else {  return count }
    guard stringIndex == (word.count-1) else{
        guard let calculateIndex = calculateDirectionalIndex(grid, direction: direction, currentIndex: currentIndex, row: row, coloum: coloum)else{ return count }
        return getWordOccurenceIn(direction, grid: grid, currentIndex: calculateIndex, stringIndex: stringIndex+1, word: word, row: row, coloum: coloum, count: count)
    }
    guard let calculateIndex = calculateDirectionalIndex(grid, direction: direction, currentIndex: currentIndex, row: row, coloum: coloum)else{ return count + 1 }
    guard grid.getCharacterAt(calculateIndex) == word.first else{ return count + 1 }
    return getWordOccurenceIn(direction, grid: grid, currentIndex: currentIndex, word: word, row: row, coloum: coloum, count: count + 1)
}

//func to fund word accurence in an array of string
func getWordOccurenceIn(wordArray: [String], wordToFind: String, row: Int ,coloum: Int)-> Int{
    var count = 0
    for (rowindex,string) in wordArray.enumerated(){
        for (colindex,char) in string.enumerated() where char == wordToFind.first{
            for direction in Direction.cases{
                count += getWordOccurenceIn( direction, grid: wordArray, currentIndex: (rowindex,colindex), stringIndex: 0, word: wordToFind, row: row, coloum: coloum, count: 0)
            }
        }
    }
    return count
}
//MARK: Utility Extensions
extension String{
    func charAtIndex(_ index: Int)-> Character?{
        if let stringIndex = self.index(self.startIndex, offsetBy: index, limitedBy: self.endIndex){
            return self[stringIndex] }else{ return nil }
    }
}
extension Array where Element == String{
    func getCharacterAt(_ index : (Int,Int))-> Character?{
        if index.0 >= self.count || index.0 < 0{   return nil }else{
            if index.1 >= self[index.0].count || index.1 < 0{ return nil }else{
                return self[index.0].charAtIndex(index.1)
            }
        }
    }
}
extension Optional{ func notNil()->Bool{ return !(self == nil) }}

//MARK: driver code
let testCaseCount = Int(readLine()!)!
var result: [String] = []
for testCase in 1...testCaseCount{
    let numberOfRows = Int(readLine()!)!
    let numberOfColoms = Int(readLine()!)!
    var wordArray = [String]()
    for _ in 1...numberOfRows{
        wordArray.append(readLine()!)
    }
    let wordToFind = readLine()!
    result.append("Case \(testCase): \(getWordOccurenceIn(wordArray: wordArray, wordToFind: wordToFind, row: numberOfRows, coloum: numberOfColoms))")
}
result.forEach({print($0)})
