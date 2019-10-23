import UIKit

var resultCountArray: [Int] = []
if let numberOfTestCases = Int(readLine() ?? ""){
    for _ in 1...numberOfTestCases {
        var count = 0
        let a = Int(readLine() ?? "") ?? 0
        let b = Int(readLine() ?? "") ?? 0
        let k = Int(readLine() ?? "") ?? 0
        
        for number in a...b{
            if number % k == 0{
                count += 1
            }
        }
        resultCountArray.append(count)
    }
}
for (index,count) in resultCountArray.enumerated(){
    print("Case \(index): \(count)")
}
