/*
 * @lc app=leetcode.cn id=160 lang=swift
 *
 * [160] 相交链表
 */
 public class ListNode {
      public var val: Int
      public var next: ListNode?
      public init(_ val: Int) {
          self.val = val
          self.next = nil
      }
  }
// @lc code=start
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

class Solution {
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        var a = headA
        var b = headB
        var isCoverA = false
        var isCoverB = false
        while a != nil && b != nil {
            // print(a?.val)
            // print(b?.val)
            // print("-------")
            if a === b {
                return a
            }  
            if a?.next == nil && !isCoverA {
                a = headB
                isCoverA = true
            }else{
                a = a?.next
            }
            if b?.next == nil && !isCoverB {
                b = headA
                isCoverB = true
            }else{
                b = b?.next
            }
             
        }
        return nil
    }
}
// @lc code=end
[4,1,8,4,5,5,6,1,8,4,5]
[5,6,1,8,4,5,4,1,8,4,5]
