class Program {
  func classPhotos(_ redShirtHeights: inout [Int], _ blueShirtHeights: inout [Int]) -> Bool {
        redShirtHeights.sort(by:<)
        blueShirtHeights.sort(by:<)
        if redShirtHeights[redShirtHeights.count - 1] > blueShirtHeights[blueShirtHeights.count - 1] {
            for index in 0..<redShirtHeights.count {
                if redShirtHeights[index] <= blueShirtHeights[index] {
                    return false
                }
            }
            return true
        } else if redShirtHeights[redShirtHeights.count - 1] < blueShirtHeights[blueShirtHeights.count - 1]  {
            for index in 0..<blueShirtHeights.count {
                if blueShirtHeights[index] <= redShirtHeights[index] {
                    return false
                }
            }
            return true
        } else {
            return false
        }
  }
}

var redShirtHeights = [5, 8, 1, 3, 4]
var blueShirtHeights = [6, 9, 2, 4, 5]

print(Program().classPhotos(&redShirtHeights, &blueShirtHeights))

for i in stride(from: 1.0, to: 9.0, by: 0.1) {
    print(i)
}
