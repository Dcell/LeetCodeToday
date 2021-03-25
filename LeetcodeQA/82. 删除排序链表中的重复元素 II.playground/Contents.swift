public class ListNode {
  public var val: Int
  public var next: ListNode?
  public init() { self.val = 0; self.next = nil; }
  public init(_ val: Int) { self.val = val; self.next = nil; }
  public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

extension ListNode{
    func debug(){
        var str = ""
        var preNode = self
        str.append("\(self.val)")
        while preNode.next != nil {
            str.append("-")
            str.append("\(preNode.next!.val)")
            preNode = preNode.next!
        }
        print(str)
    }
}

class Solution {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {

        var dump:ListNode = ListNode()
        var tail:ListNode? = dump
        var currNode:ListNode? = head
        while(currNode != nil){
            if currNode?.next == nil || currNode?.val != currNode?.next?.val  {
                tail?.next = currNode
                tail = currNode
            }
            while currNode?.next != nil && currNode?.next?.val == currNode?.val {
                currNode = currNode?.next
            }
            currNode = currNode?.next
        }
        tail?.next = nil
        return dump.next
    }
}


let l1 = ListNode(1)
let l2 = ListNode(2)
let l3 = ListNode(3)
let l32 = ListNode(3)
let l4 = ListNode(4)
let l42 = ListNode(4)
let l5 = ListNode(5)

l1.next = l2
l2.next = l3
l3.next = l32
l32.next = l4
l4.next = l42
l42.next = l5


let s = Solution()
//s.deleteDuplicates(l1)
