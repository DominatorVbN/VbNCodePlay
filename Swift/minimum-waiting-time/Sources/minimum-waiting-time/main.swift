class Program {
  func minimumWaitingTime(_ queries: inout [Int]) -> Int {
    queries.sort(by:<)
        var length = queries.count - 1
        var sum = 0
        for query in queries {
            sum += query*length
            length -= 1
        }
    return sum
  }
}

var input = [3, 2, 1, 2, 6]
print(Program().minimumWaitingTime(&input))
