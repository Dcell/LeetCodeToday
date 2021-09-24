/*
 * @lc app=leetcode.cn id=430 lang=swift
 *
 * [430] 扁平化多级双向链表
 */
//  public class Node {
//       public var val: Int
//       public var prev: Node?
//       public var next: Node?
//       public var child: Node?
//       public init(_ val: Int) {
//           self.val = val
//           self.prev = nil
//           self.next = nil
//           self.child  = nil
//       }
// }
// @lc code=start
/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var prev: Node?
 *     public var next: Node?
 *     public var child: Node?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.prev = nil
 *         self.next = nil
 *         self.child  = nil
 *     }
 * }
 */

class Solution {
    func flatten(_ head: Node?) -> Node? {
        dfs(head)
        return head
    }
    
    func dfs(_ head: Node?) -> Node?{
        var last:Node? = head
        var head:Node? = head
        while head != nil {
            if head?.child == nil {
                last = head
                head = head?.next
            }else{
                let tmp = head?.next
                let childLast = dfs(head?.child)
                head?.next = head?.child
                head?.child?.prev = head
                head?.child = nil
                if childLast != nil {
                    childLast?.next = tmp
                }
                if tmp != nil {
                    tmp?.prev = childLast
                }
                last = head
                head = childLast
            }
        }
        return last
    }
}
// @lc code=end

