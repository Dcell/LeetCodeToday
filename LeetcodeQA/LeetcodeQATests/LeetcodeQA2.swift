//
//  LeetcodeQA2.swift
//  LeetcodeQATests
//
//  Created by mac_25648_newMini on 2020/12/31.
//  Copyright © 2020 mac_25648_newMini. All rights reserved.
//

import XCTest

public class TreeNode {
     public var val: Int
     public var left: TreeNode?
     public var right: TreeNode?
     public init() { self.val = 0; self.left = nil; self.right = nil; }
     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
         self.val = val
         self.left = left
         self.right = right
     }
 }

public class ListNode{
  public var val: Int
  public var next: ListNode?
  public init(_ val: Int) {
      self.val = val
      self.next = nil
  }
}

class LeetcodeQA2: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    /**
     148. 排序链表
     给你链表的头结点 head ，请将其按 升序 排列并返回 排序后的链表 。

     进阶：

     你可以在 O(n log n) 时间复杂度和常数级空间复杂度下，对链表进行排序吗？

     */
    func testsortList(){
        func sortList(_ head: ListNode?) -> ListNode? {
            func mergeSortList(_ frist:ListNode?,_ second:ListNode?) -> ListNode?{
                guard let frist = frist else {
                    return second
                }
                guard let second = second else {
                    return frist
                }
                let head = ListNode(0)
                var node = head
                var left:ListNode? = frist
                var right:ListNode? = second
                while left != nil && right != nil {
                    if left!.val <= right!.val {
                        node.next = left
                        node = left!
                        left = left?.next
                    }else{
                        node.next = right
                        node = right!
                        right = right?.next
                    }
                }
                if left != nil {
                    node.next = left
                }else{
                    node.next = right
                }
                return head.next
            }
            
            func midNode(_ node:ListNode?) -> ListNode?{
                if node == nil || node?.next == nil {
                    return node
                }
                var fast:ListNode? = node
                var slow:ListNode? = node
                while fast != nil && fast?.next != nil{
                    slow = slow?.next
                    fast = fast?.next?.next
                }
                return slow
            }
            
            func sort(_ node:ListNode?) -> ListNode?{
                if node == nil || node?.next == nil {
                    return node
                }
                var mid:ListNode?
                if node?.next?.next == nil {
                    mid = node
                }else{
                    mid = midNode(node)
                }
                let rightnodes = mid?.next
                mid?.next = nil
                
                let left = sort(node)
                let right = sort(rightnodes)
                
                
                return mergeSortList(left, right)
            }
            
            
            return sort(head)
        }
    }
    
    /**
     假设按照升序排序的数组在预先未知的某个点上进行了旋转。例如，数组 [0,1,2,4,5,6,7] 可能变为 [4,5,6,7,0,1,2] 。

     请找出其中最小的元素。

      

     示例 1：

     输入：nums = [3,4,5,1,2]
     输出：1
     示例 2：

     输入：nums = [4,5,6,7,0,1,2]
     输出：0
     示例 3：

     输入：nums = [1]
     输出：1

     来源：力扣（LeetCode）
     链接：https://leetcode-cn.com/problems/find-minimum-in-rotated-sorted-array
     著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
     */
    func testfindMin(){
        
        func findMin(_ nums: [Int]) -> Int {
            var ans = nums[0]
            for i in 1 ..< nums.count {
                let num = nums[i]
                if num < ans {
                    ans = num
                    break
                }
            }
            return ans
        }
        
        let ans1 = findMin([3,4,5,1,2])
        let ans2 = findMin([4,5,6,7,0,1,2])
        let ans3 = findMin([1])
        
        print("")
    }
    
    /**
     打家劫舍
     你是一个专业的小偷，计划偷窃沿街的房屋。每间房内都藏有一定的现金，影响你偷窃的唯一制约因素就是相邻的房屋装有相互连通的防盗系统，如果两间相邻的房屋在同一晚上被小偷闯入，系统会自动报警。

     给定一个代表每个房屋存放金额的非负整数数组，计算你 不触动警报装置的情况下 ，一夜之内能够偷窃到的最高金额。

      

     示例 1：

     输入：[1,2,3,1]
     输出：4
     解释：偷窃 1 号房屋 (金额 = 1) ，然后偷窃 3 号房屋 (金额 = 3)。
          偷窃到的最高金额 = 1 + 3 = 4 。
     */
    func testrob(){
        func rob(_ nums: [Int]) -> Int {
            if nums.count == 0 {
                return 0
            }
            if nums.count == 1 {
                return nums[0]
            }
            if nums.count == 2 {
                return max(nums[0], nums[1])
            }
            var dp = Array(nums)
            dp[1] = max(dp[0], dp[1])
            var maxNum = max(nums[0], nums[1])
            for i in 2..<nums.count {
                dp[i] = max(nums[i] + dp[i - 2],dp[i - 1])
                maxNum = max(maxNum, dp[i])
            }
            return maxNum
        }
        let ans = rob([1,2,3,1])
        let ans2 = rob([2,7,9,3,1])
        print("")
    }


}
