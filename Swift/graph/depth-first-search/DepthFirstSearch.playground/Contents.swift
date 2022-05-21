/*
 # Depth-first Search
 
 You're given a Node class that has a name and an array of optional children nodes. When put together,
 nodes form an acyclic tree-like structure.
 Implement the depthFirstSearch method on the Node class, which takes in an empty array, traverses the
 tree using the Depth-first Search approach (specifically navigating the tree from left to right), stores all of the
 nodes' names in the input array, and returns it.
 If you're unfamiliar with Depth-first Search, we recommend watching the Conceptual Overview section of this
 question's video explanation before starting to code.
 
 ## Sample Input
 
 ```
 graph =  A
        / | \
       B  C  D
      / \   / \
     E   F G   H
        / \ \
       I   J K
 ```
 
 ## Sample Output
 
 ```
 ["A", "B", "E", "E", "T", "J", "C", "D", "G", "K", "H"]
 ```
 */

import Foundation

class Program {
    class Node {
        let name: String
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
        
        func depthFirstSearch(array: inout [String]) -> [String] {
            array.append(name)
            for child in children {
                child.depthFirstSearch(array: &array)
            }
            return array
        }
    }

}


let graph = Program.Node(name: "A")
graph.addChild(name: "B").addChild(name: "C").addChild(name: "D")
graph.children[0].addChild(name: "E").addChild(name: "F")
graph.children[2].addChild(name: "G").addChild(name: "H")
graph.children[0].children[1].addChild(name: "I").addChild(name: "J")
graph.children[2].children[0].addChild(name: "K")

var array = [String]()
let nodes = graph.depthFirstSearch(array: &array)
print(nodes)
