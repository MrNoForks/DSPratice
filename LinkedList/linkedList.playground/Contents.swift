import Foundation

class Node : Equatable{
    var data : String?
    var next : Node?
    init(data : String){
        self.data = data
    }
    
    static func ==(lhs: Node, rhs: Node) -> Bool {
        return lhs.data == rhs.data
    }
}

struct linkedList {
    var head : Node?
    var tail : Node? {
        var temp = head
        while let node = temp?.next{
            temp = node
        }
        return temp
    }

    mutating func append(node : Node) {
        let node = node
        if var temp = head {
            while let nextNode = temp.next {
                temp = nextNode
            }
            temp.next = node
            
        }
        else{
            self.head = node
            
        }
    }

    mutating func insert(node : Node,pos : Int) {

        if(pos < 0){
            print("Position can't be negative")
            return
        }


        let node = node
        if pos == 0 {
            node.next = head
            head = node
        }
        else {
            var cur = head
            for _ in 1..<pos{
                cur = cur?.next
            }
            node.next = cur?.next
            cur?.next = node
        }

    }

    mutating func deleteNode(at pos : Int){
        if head == nil{
            return
        }

        var temp = head
        if pos == 0{
            head = temp?.next
            return
        }

        for _ in 1..<pos where temp != nil{
            temp = temp!.next
        }

        if temp == nil || temp?.next == nil {
            return
        }

        let nextToNextNode = temp?.next?.next
        temp?.next = nextToNextNode

    }

    func printAllNodes() {
        if var temp = head{
            var count = 1
            print("Node is \(head!.data ?? "") ", terminator:"")
            while let nextNode = temp.next{
                count += 1
                temp = nextNode
                print("-> Node is \(temp.data!) ", terminator:"")
            }
            print("\n No of nodes is \(count)")
        }
        else {
            print("No of nodes is 0")
        }
    }
    
    func breakLoop(){
        var nodes : [Node] = []
   
        guard var temp = head else {return}
        nodes.append(temp)
        
        while let nextNode = temp.next{
            if nodes.contains(nextNode){
                print("here is node \(nextNode.data)")
                temp.next = nil
            }
            else{
            nodes.append(nextNode)
            temp = nextNode
            }
        }
    }

}

func breakIntersection(linkedList1 : linkedList,linkedList2 : linkedList){
    
    var ll1temp = linkedList1.head
    
    
    while let node1 = ll1temp{
       // print(node1.data)
        var ll2temp = linkedList2.head
        while let node2 = ll2temp{
         //   print(node1.data,node2.data )
            if node1 == node2.next{
                node2.next = nil
                break
            }
            ll2temp = node2.next
        }
        ll1temp = node1.next
    }
 
    
    
}

let nodeA = Node(data: "A")
let nodeB = Node(data : "B")
let nodeC = Node(data: "C")
let nodeD = Node(data: "D")
let nodeE = Node(data: "E")
let nodeF = Node(data: "F")
let nodeG = Node(data: "G")
let nodeH = Node(data: "H")
let nodeI = Node(data: "I")


var ll1 = linkedList()
ll1.append(node : nodeA)
nodeA.next = nodeB
nodeB.next = nodeC
nodeC.next = nodeD
nodeD.next = nodeE

var ll2 = linkedList()
ll2.append(node: nodeI)
nodeI.next = nodeH
nodeH.next = nodeC

ll1.printAllNodes()
ll2.printAllNodes()
//LL.deleteNode(at : 1)

//print(ll1.getAllNodes().map{$0.data})
 print("============================")
breakIntersection(linkedList1: ll1, linkedList2: ll2)

ll1.printAllNodes()
ll2.printAllNodes()

print(ll1.tail?.data)

