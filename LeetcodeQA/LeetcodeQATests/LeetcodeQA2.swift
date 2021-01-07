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
    
    /**
     200. 岛屿数量
     给你一个由 '1'（陆地）和 '0'（水）组成的的二维网格，请你计算网格中岛屿的数量。

     岛屿总是被水包围，并且每座岛屿只能由水平方向和/或竖直方向上相邻的陆地连接形成。

     此外，你可以假设该网格的四条边均被水包围。
     */
    func testnumIslands(){
        func numIslands(_ grid: [[Character]]) -> Int {
            var grid = grid
            var nums = 0
            func bfs(_ x:Int,_ y:Int){
                if x < 0 || y < 0 {
                   return
                }
                if x >= grid.count {
                    return
                }
                if y >= grid[x].count {
                    return
                }
                if grid[x][y] == "1" {
                    grid[x][y] = "2"
                    bfs(x + 1, y)
                    bfs(x, y + 1)
                    bfs(x - 1,y)
                    bfs(x, y - 1)
                }
            }
            
            for i in 0..<grid.count {
                for j in 0..<grid[i].count {
                    if grid[i][j] == "1" {
                        nums += 1
                        bfs(i, j)
                    }
                }
            }
            
            return nums
        }
        let ans = numIslands([
            ["1","1","1","1","0"],
            ["1","1","0","1","0"],
            ["1","1","0","0","0"],
            ["0","0","0","0","0"]
          ])
        let ans2 = numIslands([
            ["1","1","0","0","0"],
            ["1","1","0","0","0"],
            ["0","0","1","0","0"],
            ["0","0","0","1","1"]
          ])
        let ans3 = numIslands([
                                ["1","1","1"],
                                ["0","1","0"],
                                ["1","1","1"]])
        print("")
    }
    
    /**
     反转一个单链表。

     示例:

     输入: 1->2->3->4->5->NULL
     输出: 5->4->3->2->1->NULL
     进阶:
     你可以迭代或递归地反转链表。你能否用两种方法解决这道题？



     来源：力扣（LeetCode）
     链接：https://leetcode-cn.com/problems/reverse-linked-list
     著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
     */
    func testreverseList(){
        func reverseList(_ head: ListNode?) -> ListNode? {
            
            func reverse(_ head: ListNode?) -> ListNode?{
                if head == nil || head?.next == nil {
                    return head
                }
                let next = head?.next
                head?.next = nil
                let ans =  reverse(next)
                next?.next = head
                return ans
            }
            
            return reverse(head)
        }
    }
    
    
    /*
     实现一个 Trie (前缀树)，包含 insert, search, 和 startsWith 这三个操作。

     示例:

     Trie trie = new Trie();

     trie.insert("apple");
     trie.search("apple");   // 返回 true
     trie.search("app");     // 返回 false
     trie.startsWith("app"); // 返回 true
     trie.insert("app");
     trie.search("app");     // 返回 true
     说明:

     你可以假设所有的输入都是由小写字母 a-z 构成的。
     保证所有输入均为非空字符串。

     来源：力扣（LeetCode）
     链接：https://leetcode-cn.com/problems/implement-trie-prefix-tree
     著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
     */
    class Trie {
        let asciia:UInt8 = Character("a").asciiValue!
        class TrieNode {
            var isEnd = false
            var trieNodes:[TrieNode?] = Array(repeating: nil, count: 26)
        }
        
        let root:TrieNode

        /** Initialize your data structure here. */
        init() {
            root = TrieNode()
        }
        
        /** Inserts a word into the trie. */
        func insert(_ word: String) {
            var node = root
            for c in Array(word){
                let index = c.asciiValue! - asciia
                if node.trieNodes[Int(index)] == nil {
                    node.trieNodes[Int(index)] = TrieNode()
                }
                node = node.trieNodes[Int(index)]!
            }
            node.isEnd = true
        }
        
        /** Returns if the word is in the trie. */
        func search(_ word: String) -> Bool {
            var node = root
            for c in Array(word){
                let index = c.asciiValue! - asciia
                if node.trieNodes[Int(index)] == nil {
                    return false
                }
                node = node.trieNodes[Int(index)]!
            }
            return node.isEnd
        }
        
        /** Returns if there is any word in the trie that starts with the given prefix. */
        func startsWith(_ prefix: String) -> Bool {
            var node = root
            for c in Array(prefix){
                let index = c.asciiValue! - asciia
                if node.trieNodes[Int(index)] == nil {
                    return false
                }
                node = node.trieNodes[Int(index)]!
            }
            return true
        }
    }
    
    func testtrie(){
        let trie =  Trie();

        trie.insert("apple");
        print(trie.search("apple"));   // 返回 true
        print(trie.search("app"));     // 返回 false
        print(trie.startsWith("app")); // 返回 true
        print(trie.insert("app"));
        print(trie.search("app"));     // 返回 true
    }
    
    
    /**
     215. 数组中的第K个最大元素
     在未排序的数组中找到第 k 个最大的元素。请注意，你需要找的是数组排序后的第 k 个最大的元素，而不是第 k 个不同的元素。
     */
    func testfindKthLargest(){
        func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
            var nums = nums
            nums.sort { (lv, rv) -> Bool in
                return lv > rv
            }
            return nums[k - 1]
        }
    }
    
    /**
     在一个由 '0' 和 '1' 组成的二维矩阵内，找到只包含 '1' 的最大正方形，并返回其面积。
     */
    func testmaximalSquare(){
        func maximalSquare(_ matrix: [[Character]]) -> Int {
            
            func isSquare(_ startx:Int,_ starty:Int,_ endx:Int,_ endy:Int) -> Bool{
                if startx < 0 || starty < 0{
                    return false
                }
                if endx >= matrix.count {
                    return false
                }
                if endy >= matrix[endx].count {
                    return false
                }
                for i in startx ... endx {
                    for j in starty ... endy {
                        if matrix[i][j] != "1" {
                            return false
                        }
                    }
                }
                return true
            }
            
            var maxmal = 0
            for i in 0..<matrix.count {
                for j in 0..<matrix[i].count {
                    if matrix[i][j] == "1" {
                        maxmal = max(maxmal, 1)
                        let startx = i
                        let starty = j
                        var endx = startx
                        var endy = starty
                        
                        while isSquare(startx, starty, endx, endy) {
                            maxmal = max(maxmal, (endx - startx + 1) * (endy - starty + 1))
                            endx += 1
                            endy += 1
                        }
                    }
                }
            }
            return maxmal
         }
        
        let ans = maximalSquare([["1","0","1","0","0"],["1","0","1","1","1"],["1","1","1","1","1"],["1","0","0","1","0"]])
        print(<#T##items: Any...##Any#>)
    }





}
