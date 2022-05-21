import Foundation

class Program {
  class Node {
    var name: String
    var children: [Node]

    init(name: String) {
      self.name = name
      children = []
    }

    func addChild(name: String) -> Node {
      let childNode = Node(name: name)
      children.append(childNode)

      return self
    }

    func breadthFirstSearch(array: inout [String]) -> [String] {
      // Write your code here.
            var queue = [Node]()
            queue.append(self)
            
            while queue.isEmpty == false {
                let element = queue.first!
                queue.removeFirst()
                array.append(element.name)
                if element.children.isEmpty == false {
                    queue.append(contentsOf: element.children)
                }
            }
            return array
    }
  }
}

