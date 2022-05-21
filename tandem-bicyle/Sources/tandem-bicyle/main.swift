class Program {
  func tandemBicycle(_ redShirtSpeeds: inout [Int], _ blueShirtSpeeds: inout [Int], _ fastest: Bool) -> Int {
      if fastest {
            redShirtSpeeds.sort(by: >)
        } else {
            redShirtSpeeds.sort(by: <)
        }
        blueShirtSpeeds.sort(by: <)
        return zip(redShirtSpeeds,blueShirtSpeeds).reduce(0) {
            $0 + max($1.0, $1.1)
        }
  }
}

var red = [5, 5, 3, 9, 2]
var blue = [3, 6, 7, 2, 1]
let fastest = true

print(Program().tandemBicycle(&red, &blue, fastest))
