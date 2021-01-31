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
        
    }

    
    /**
     翻转二叉树
     */
    func testinvertTree(){
        func invertTree(_ root: TreeNode?) -> TreeNode? {
            if root?.left == nil && root?.right == nil {
                return root
            }
            let left =  root?.left
            let right = root?.right
            root?.right = invertTree(left)
            root?.left = invertTree(right)
            return root
        }
    }
    
    /**
     234. 回文链表
     请判断一个链表是否为回文链表。
     */
    func testisPalindrome(){
        
        func isPalindrome(_ head: ListNode?) -> Bool {
            guard let head = head else {
                return true
            }
            if head.next == nil {
                return true
            }
            var fast:ListNode? = head
            var slow:ListNode? = head
            var p:ListNode? = nil
            var pre:ListNode? = nil
            while fast != nil && fast?.next != nil {
                p = slow
                fast = fast?.next?.next
                slow = slow?.next
                
                p?.next = pre
                pre = p
            }
            
            if fast != nil {
                slow = slow?.next
            }
            
            while slow != nil && p != nil {
                if slow?.val != p?.val {
                    return false
                }
                slow = slow?.next
                p = p?.next
            }
            
            return true
        }
    }
    
    
    /**
     236. 二叉树的最近公共祖先
     给定一个二叉树, 找到该树中两个指定节点的最近公共祖先。

     百度百科中最近公共祖先的定义为：“对于有根树 T 的两个结点 p、q，最近公共祖先表示为一个结点 x，满足 x 是 p、q 的祖先且 x 的深度尽可能大（一个节点也可以是它自己的祖先）。”
     */
    func testlowestCommonAncestor(){
        func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
            guard let root = root else {
                return nil
            }
            if p?.val == root.val || q?.val == root.val {
                return root
            }
            let left = lowestCommonAncestor(root.left, p, q)
            let right = lowestCommonAncestor(root.right, p, q)
            if left == nil {
                return right
            }
            if right == nil {
                return left
            }
            return root
        }
    }
    
    
    /**
     238. 除自身以外数组的乘积
     给你一个长度为 n 的整数数组 nums，其中 n > 1，返回输出数组 output ，其中 output[i] 等于 nums 中除 nums[i] 之外其余各元素的乘积。

      

     示例:

     输入: [1,2,3,4]
     输出: [24,12,8,6]
     */
    func testproductExceptSelf(){
        func productExceptSelf(_ nums: [Int]) -> [Int] {
            var res = Array(repeating: 1, count: nums.count)
            var p = 1
            for i in 0..<nums.count {
                res[i] = p
                p = p * nums[i]
            }
            //res 存储了 i 左边的乘积
            p = 1
            for i in stride(from: nums.count - 1, to: -1, by: -1) {
                res[i] = p * res[i]
                p = p * nums[i]
            }
            return res
        }
        productExceptSelf([1,2,3,4])
    }

    
    
    /**
     239. 滑动窗口最大值
     给你一个整数数组 nums，有一个大小为 k 的滑动窗口从数组的最左侧移动到数组的最右侧。你只可以看到在滑动窗口内的 k 个数字。滑动窗口每次只向右移动一位。

     返回滑动窗口中的最大值。

      

     示例 1：

     输入：nums = [1,3,-1,-3,5,3,6,7], k = 3
     输出：[3,3,5,5,6,7]
     解释：
     滑动窗口的位置                最大值
     ---------------               -----
     [1  3  -1] -3  5  3  6  7       3
      1 [3  -1  -3] 5  3  6  7       3
      1  3 [-1  -3  5] 3  6  7       5
      1  3  -1 [-3  5  3] 6  7       5
      1  3  -1  -3 [5  3  6] 7       6
      1  3  -1  -3  5 [3  6  7]      7
     示例 2：

     输入：nums = [1], k = 1
     输出：[1]
     示例 3：

     输入：nums = [1,-1], k = 1
     输出：[1,-1]
     示例 4：

     输入：nums = [9,11], k = 2
     输出：[11]
     示例 5：

     输入：nums = [4,-2], k = 2
     输出：[4]
     */
    
    func testmaxSlidingWindow(){

        
        func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
            
            var maxStack:[Int] = []
            var ans:[Int] = []
            for i in 0..<nums.count {
                if let first = maxStack.first{
                    if i - k == first {
                        maxStack.removeFirst()
                    }
                }
                while maxStack.count != 0 && nums[maxStack.last!] < nums[i] {
                    maxStack.removeLast()
                }
                maxStack.append(i)
                if k <= i + 1 {
                    ans.append(nums[maxStack.first!])
                }
                
            }
            return ans
        }
        
        print(maxSlidingWindow([1,3,-1,-3,5,3,6,7], 3))
        print(maxSlidingWindow([1,-1], 1))
        print(maxSlidingWindow([7,2,4], 1))
        
        
    }
    
    /**
     编写一个高效的算法来搜索 m x n 矩阵 matrix 中的一个目标值 target 。该矩阵具有以下特性：

     每行的元素从左到右升序排列。
     每列的元素从上到下升序排列。


     来源：力扣（LeetCode）
     链接：https://leetcode-cn.com/problems/search-a-2d-matrix-ii
     著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
     */
    func testsearchMatrix(){
        func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
            func searchSort(_ i:Int,_ j:Int) -> Bool{
                //先查询i
                var left = 0
                var right = j
                while left != right {
                    if (right - left) / 2 == 0 {
                        if(matrix[i][left] == target || matrix[i][right] == target){
                            return true
                        }
                        break
                    }
                    let mid = (right - left) / 2 + left
                    if matrix[i][mid] == target {
                        return true
                    }
                    if matrix[i][mid] < target {
                        left = mid
                    }
                    if matrix[i][mid] > target {
                        right = mid
                    }
                }
                
                left = 0
                right = i
                while left != right {
                    if (right - left) / 2 == 0 {
                        if(matrix[left][j] == target || matrix[right][j] == target){
                            return true
                        }
                        break
                    }
                    let mid = (right - left) / 2 + left
                    if matrix[mid][j] == target {
                        return true
                    }
                    if matrix[mid][j] < target {
                        left = mid
                    }
                    if matrix[mid][j] > target {
                        right = mid
                    }
                }
                
                return false
            }
            var i = matrix.count - 1
            var j = matrix[0].count - 1
            while i >= 0 && j >= 0  {
                if matrix[i][j] == target{
                    return true
                }
                if matrix[i][j] < target {
                    return false
                }
                let ans = searchSort(i,j)
                if ans {
                    return true
                }
                i -= 1
                j -= 1
            }
            
            return false
        }
        
        let ans = searchMatrix([[1,4,7,11,15],[2,5,8,12,19],[3,6,9,16,22],[10,13,14,17,24],[18,21,23,26,30]], 5)
        
        print("")
    }
    
    
    /**
     283. 移动零
     给定一个数组 nums，编写一个函数将所有 0 移动到数组的末尾，同时保持非零元素的相对顺序。

     示例:

     输入: [0,1,0,3,12]
     输出: [1,3,12,0,0]
     说明:

     必须在原数组上操作，不能拷贝额外的数组。
     尽量减少操作次数。
     */
    func testmoveZeroes(){
        func moveZeroes(_ nums: inout [Int]) {
            var left = 0
            for right in 0..<nums.count {
                if nums[right] != 0 {
                    let tem = nums[right]
                    nums[right] = nums[left]
                    nums[left] = tem
                    left += 1
                }
            }

        }
        
        var nums = [0,1,0,3,12]
        moveZeroes(&nums)
        print("")
    }
    
    /**
     给定一个包含 n + 1 个整数的数组 nums ，其数字都在 1 到 n 之间（包括 1 和 n），可知至少存在一个重复的整数。

     假设 nums 只有 一个重复的整数 ，找出 这个重复的数 。

      

     示例 1：

     输入：nums = [1,3,4,2,2]
     输出：2

     来源：力扣（LeetCode）
     链接：https://leetcode-cn.com/problems/find-the-duplicate-number
     著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
     */
    func testfindDuplicate(){
        // 等于 有环链表 的入口点
        func findDuplicate(_ nums: [Int]) -> Int {
            var slow = 0
            var fast = 0
            while true {
                fast = nums[nums[fast]] //next-next
                slow = nums[slow] // next
                if fast == slow {
                    break
                }
            }
            fast = 0
            while true {
                fast = nums[fast] //next-next
                slow = nums[slow] // next
                if fast == slow {
                    break
                }
            }
            return slow
        }
    }
    
    
    func testserializetree(){
        class Codec {
            func serialize(_ root: TreeNode?) -> String {
                var queue:[TreeNode?] = []
                var serializeString:[String] = []
                func bfs(_ node: TreeNode?){
                    queue.append(node)
                    while !queue.isEmpty {
                        if let node = queue.removeFirst(){
                            serializeString.append("\(node.val)")
                            queue.append(node.left)
                            queue.append(node.right)
                        }else{
                            serializeString.append("null")
                        }
                    }
                    
                }
                bfs(root)
                var ans = serializeString.reduce("") { (result, element) -> String in
                    return result + "&" + element
                }
                ans.removeFirst()
                print(ans)
                return ans
            }
            
            func deserialize(_ data: String) -> TreeNode? {
                if data == "null" {
                    return nil
                }
                let slices =  data.split(separator: "&")
                var queue:[TreeNode] = []
                let root = TreeNode(Int(slices[0])!)
                queue.append(root)
                var index = 1
                while index < slices.count{
                    let node =  queue.removeFirst()
                    let left = slices[index]
                    if left != "null" {
                        let leftNode = TreeNode(Int(left)!)
                        node.left = leftNode
                        queue.append(leftNode)
                    }
                    
                    let right = slices[index + 1]
                    if right != "null" {
                        let rightNode = TreeNode(Int(right)!)
                        node.right = rightNode
                        queue.append(rightNode)
                    }
                    index += 2
                }
                return root
            }
        }
        
        let code = Codec()
        code.deserialize("1&2&3&null&null&4&5")
        
        
    }
    
    
    
    /**
     300. 最长递增子序列
     给你一个整数数组 nums ，找到其中最长严格递增子序列的长度。

     子序列是由数组派生而来的序列，删除（或不删除）数组中的元素而不改变其余元素的顺序。例如，[3,6,2,7] 是数组 [0,3,1,6,2,2,7] 的子序列。

      
     示例 1：

     输入：nums = [10,9,2,5,3,7,101,18]
     输出：4
     解释：最长递增子序列是 [2,3,7,101]，因此长度为 4 。
     示例 2：

     输入：nums = [0,1,0,3,2,3]
     输出：4
     示例 3：

     输入：nums = [7,7,7,7,7,7,7]
     输出：1
     */
    func testlengthOfLIS(){
        func lengthOfLIS(_ nums: [Int]) -> Int {
            
            if nums.count == 1 || nums.count == 0{
                return nums.count
            }
            var dp = Array(repeating: 1, count: nums.count)
            
            for i in 1..<nums.count {
                for j in 0..<i {
                    if(nums[i] > nums[j]){
                        dp[i] =  max(dp[i], dp[j] + 1)
                    }
                }
                
            }
            return dp.max()!
        }
    }
    
    
    /**
     312. 戳气球
     有 n 个气球，编号为0 到 n - 1，每个气球上都标有一个数字，这些数字存在数组 nums 中。

     现在要求你戳破所有的气球。戳破第 i 个气球，你可以获得 nums[i - 1] * nums[i] * nums[i + 1] 枚硬币。 这里的 i - 1 和 i + 1 代表和 i 相邻的两个气球的序号。如果 i - 1或 i + 1 超出了数组的边界，那么就当它是一个数字为 1 的气球。

     求所能获得硬币的最大数量。

      

     示例 1：
     输入：nums = [3,1,5,8]
     输出：167
     解释：
     nums = [3,1,5,8] --> [3,5,8] --> [3,8] --> [8] --> []
     coins =  3*1*5    +   3*5*8   +  1*3*8  + 1*8*1 = 167
     示例 2：

     输入：nums = [1,5]
     输出：10
     */
    func testmaxCoins(){
        func maxCoins(_ nums: [Int]) -> Int {
            var nums = nums
            nums.insert(1, at: 0)
            nums.append(1)
            var dp = Array(repeating: Array(repeating: 0, count: nums.count), count: nums.count)

            for len in 3...nums.count {
                for i in 0...nums.count - len {
                    var res = 0
                    let j = i + len - 1
                    for k in (i + 1) ..< j {
                        let left = dp[i][k]
                        let right = dp[k][j]
                        let sum = left + right + nums[k] * nums[i] * nums[j];
                        res = max(res,sum);//取金币最大值
                    }
                    dp[i][j] = res
                }
            }
            return dp[0][nums.count - 1]
        }
        func maxCoins2(_ nums: [Int]) -> Int {
                var n = nums.count
                var temp = [Int](repeating: 0, count: n + 2)
                temp[0] = 1
                temp[n + 1] = 1
                for i in 0..<nums.count {
                    temp[i+1] = nums[i]
                }
                var arr = [Int](repeating: 0, count: n + 2)
                var dp = [[Int]](repeating: arr, count: n + 2)
                var len = 3 //len 表示开区间长度
                /*
                从 (i,j) 开区间只有三个数字的时候开始计算，储存每个小区间可以得到金币的最大值
                然后慢慢扩展到更大的区间，利用小区间里已经算好的数字来算更大的区间
                */
                while len <= n + 2 {
                    //i 表示 开区间左端点
                    for i in 0...(n + 2 - len) {
                        var res = 0
                        //k 为开区间内的索引 , i 和 j 之间选 K 是任意的，只需要保留获得金币最多的那种即可
                        var j = i + len - 1
                        for k in (i + 1)..<j {
                            var left = dp[i][k]
                            var right = dp[k][j]
                            res = max(res,left + temp[i]*temp[k]*temp[j] + right)
                        }
                        dp[i][j] = res
                    }
                    
                    len += 1
                }
                return dp[0][n+1]
            }
        let ans = maxCoins([3,1,5,8])
        print("")
    }

    
    /**
     322. 零钱兑换
     给定不同面额的硬币 coins 和一个总金额 amount。编写一个函数来计算可以凑成总金额所需的最少的硬币个数。如果没有任何一种硬币组合能组成总金额，返回 -1。

     你可以认为每种硬币的数量是无限的。

      

     示例 1：

     输入：coins = [1, 2, 5], amount = 11
     输出：3
     解释：11 = 5 + 5 + 1
     示例 2：

     输入：coins = [2], amount = 3
     输出：-1
     示例 3：

     输入：coins = [1], amount = 0
     输出：0
     示例 4：

     输入：coins = [1], amount = 1
     输出：1
     示例 5：

     输入：coins = [1], amount = 2
     输出：2
     */
    
    func testcoinChange(){
        func coinChange(_ coins: [Int], _ amount: Int) -> Int {
            if amount == 0 {
                return 0
            }
            var dp:[Int:Int] = [:]
            
            func change(_ coins: [Int], _ amount: Int) -> Int{
                if amount < 0 {
                    return -1
                }
                if amount == 0 {
                    return 0
                }
                if dp.keys.contains(amount) {
                    return dp[amount]!
                }
                var realMinans:Int?
                for i in 0..<coins.count {
                    let res = change(coins, amount - coins[i])
                    if res != -1 {
                        if let _realMinans = realMinans {
                            realMinans = min(_realMinans, res + 1)
                        }else{
                            realMinans = res + 1
                        }
                    }
                }
                dp[amount] = realMinans ?? -1
                return realMinans ?? -1
            }
            
            change(coins, amount)
            return dp[amount] ?? -1
        }
        let ans1 = coinChange([1, 2, 5],11)
        let ans2 = coinChange([2],3)
        print("")
        
    }


    /**
     338. 比特位计数
     给定一个非负整数 num。对于 0 ≤ i ≤ num 范围中的每个数字 i ，计算其二进制数中的 1 的数目并将它们作为数组返回。

     示例 1:

     输入: 2
     输出: [0,1,1]
     示例 2:

     输入: 5
     输出: [0,1,1,2,1,2]
     */
    
    func testcountBits(){
//        偶数n 1个数 等于 n/2 个数
        // 奇数 等 n-1 1个数+ 1
        func countBits(_ num: Int) -> [Int] {
            var ans = Array(repeating: 0, count: num + 1)
            for i in 0...num {
                if i == 0 {
                    ans[i] = 0
                    continue
                }
                if i == 1 {
                    ans[i] = 1
                    continue
                }
                if i % 2 == 0 {
                    ans[i] = ans[i/2]
                }else{
                    ans[i] = ans[i - 1] + 1
                }
            }
            
            return ans
        }
        
        countBits(3)
    }

    
    
    
    /**
     347. 前 K 个高频元素
     给定一个非空的整数数组，返回其中出现频率前 k 高的元素。

      

     示例 1:

     输入: nums = [1,1,1,2,2,3], k = 2
     输出: [1,2]
     示例 2:

     输入: nums = [1], k = 1
     输出: [1]
     */
    func testtopKFrequent(){
        func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
            var numsDic:[Int:Int] = [:]
            for i in 0..<nums.count {
                var count = 0
                if numsDic.keys.contains(nums[i]) {
                    count = numsDic[nums[i]]!
                }
                numsDic[nums[i]] = count + 1
            }
            
            let sortnumsDic =  numsDic.sorted { (l, r) -> Bool in
                return l.value > r.value
            }
            var ans:[Int] = []
            for i in 0..<sortnumsDic.count {
                if i < k {
                    ans.append(sortnumsDic[i].key)
                }
            }
            return ans
        }
        topKFrequent( [1,1,1,2,2,3], 2)
    }
    
    
    /**
     394. 字符串解码
     给定一个经过编码的字符串，返回它解码后的字符串。

     编码规则为: k[encoded_string]，表示其中方括号内部的 encoded_string 正好重复 k 次。注意 k 保证为正整数。

     你可以认为输入字符串总是有效的；输入字符串中没有额外的空格，且输入的方括号总是符合格式要求的。

     此外，你可以认为原始数据不包含数字，所有的数字只表示重复的次数 k ，例如不会出现像 3a 或 2[4] 的输入。

      

     示例 1：

     输入：s = "3[a]2[bc]"
     输出："aaabcbc"
     示例 2：

     输入：s = "3[a2[c]]"
     输出："accaccacc"
     */
    func testdecodeString(){
        func decodeString(_ s: String) -> String {
            var stack:[Character] = []
            let chars = Array(s)
            for i in 0..<chars.count {
                if chars[i] == "]" {
                    var num = ""
                    var world = ""
                    var worldEnd = false
                    while !stack.isEmpty {
                        let last = stack.removeLast()
                        
                        
                        if last == "[" && !worldEnd {
                            worldEnd = true
                            continue
                        }
                        if !worldEnd {
                            world = String(last) + world
                        }else{
                            if let _ = Int(String(last)){
                                num = String(last) + num
                            }else{
                                stack.append(last)
                                break
                            }
                        }
                    }
                    for _ in 0..<(Int(num) ?? 1) {
                        stack.append(contentsOf: world)
                    }
                }else{
                    stack.append(chars[i])
                }
            }
            
            return String(stack)
        }
        
//        let ans = decodeString("3[a]2[bc]")
        let ans2 = decodeString("3[z]2[2[y]pq4[2[jk]e1[f]]]ef")
        print("")
    }
    

    
    /**
     406. 根据身高重建队列
     假设有打乱顺序的一群人站成一个队列，数组 people 表示队列中一些人的属性（不一定按顺序）。每个 people[i] = [hi, ki] 表示第 i 个人的身高为 hi ，前面 正好 有 ki 个身高大于或等于 hi 的人。

     请你重新构造并返回输入数组 people 所表示的队列。返回的队列应该格式化为数组 queue ，其中 queue[j] = [hj, kj] 是队列中第 j 个人的属性（queue[0] 是排在队列前面的人）。

      

     示例 1：

     输入：people = [[7,0],[4,4],[7,1],[5,0],[6,1],[5,2]]
     输出：[[5,0],[7,0],[5,2],[6,1],[4,4],[7,1]]
     解释：
     编号为 0 的人身高为 5 ，没有身高更高或者相同的人排在他前面。
     编号为 1 的人身高为 7 ，没有身高更高或者相同的人排在他前面。
     编号为 2 的人身高为 5 ，有 2 个身高更高或者相同的人排在他前面，即编号为 0 和 1 的人。
     编号为 3 的人身高为 6 ，有 1 个身高更高或者相同的人排在他前面，即编号为 1 的人。
     编号为 4 的人身高为 4 ，有 4 个身高更高或者相同的人排在他前面，即编号为 0、1、2、3 的人。
     编号为 5 的人身高为 7 ，有 1 个身高更高或者相同的人排在他前面，即编号为 1 的人。
     因此 [[5,0],[7,0],[5,2],[6,1],[4,4],[7,1]] 是重新构造后的队列。
     */
    
    func testreconstructQueue(){
        func reconstructQueue(_ people: [[Int]]) -> [[Int]] {
            var ans:[[Int]] = []
            let personSort =  people.sorted { (l, r) -> Bool in
                if l[0] == r[0] {
                    return l[1] < r[1]
                }
                return l[0] > r[0]
            }
            for i in 0..<personSort.count {
                ans.insert(personSort[i], at: personSort[i][1])
            }
            return ans
        }
        
        reconstructQueue([[7,0],[4,4],[7,1],[5,0],[6,1],[5,2]])
    }

    
    /**
     605. 种花问题
     假设有一个很长的花坛，一部分地块种植了花，另一部分却没有。可是，花不能种植在相邻的地块上，它们会争夺水源，两者都会死去。

     给你一个整数数组  flowerbed 表示花坛，由若干 0 和 1 组成，其中 0 表示没种植花，1 表示种植了花。另有一个数 n ，能否在不打破种植规则的情况下种入 n 朵花？能则返回 true ，不能则返回 false。
     */

    func testcanPlaceFlowers(){
        func canPlaceFlowers(_ flowerbed: [Int], _ n: Int) -> Bool {
            guard flowerbed.count >= n else {
                return false
            }
            var flowerbed = flowerbed
            flowerbed.insert(0, at: 0)
            flowerbed.append(0)
            var hasPlaces = 0
            for i in 1..<(flowerbed.count - 1) {
                if flowerbed[i] == 0 && flowerbed[i - 1] == 0 && flowerbed[i + 1] == 0 {
                    flowerbed[i] = 1
                    hasPlaces += 1
                }
            }
            return hasPlaces >= n
        }
        
        print(canPlaceFlowers([1,0,0,0,1], 1))
        print(canPlaceFlowers([1,0,0,0,0,1], 2))
        print(canPlaceFlowers([0], 1))
    }
    
    /**
     455. 分发饼干
     假设你是一位很棒的家长，想要给你的孩子们一些小饼干。但是，每个孩子最多只能给一块饼干。

     对每个孩子 i，都有一个胃口值 g[i]，这是能让孩子们满足胃口的饼干的最小尺寸；并且每块饼干 j，都有一个尺寸 s[j] 。如果 s[j] >= g[i]，我们可以将这个饼干 j 分配给孩子 i ，这个孩子会得到满足。你的目标是尽可能满足越多数量的孩子，并输出这个最大数值。
     */
    func findContentChildren(_ g: [Int], _ s: [Int]) -> Int {
        var childrens = g.sorted()
        var sizes = s.sorted()
        var i = childrens.count - 1
        var j = sizes.count - 1
        var ans = 0
        while i >= 0  && j >= 0 {
            if sizes[j] >= childrens[i] {
                j -= 1
                ans += 1
            }
            i -= 1
        }
        return ans
    }
    
    
    /**
     剑指 Offer 03. 数组中重复的数字
     找出数组中重复的数字。


     在一个长度为 n 的数组 nums 里的所有数字都在 0～n-1 的范围内。数组中某些数字是重复的，但不知道有几个数字重复了，也不知道每个数字重复了几次。请找出数组中任意一个重复的数字。

     示例 1：

     输入：
     [2, 3, 1, 0, 2, 5, 3]
     输出：2 或 3
     */
    func findRepeatNumber(_ nums: [Int]) -> Int {
        var numsMap:Set<Int> = Set()
        for i in 0..<nums.count {
            let num = nums[i]
            if numsMap.contains(num){
                return num
            }else{
                numsMap.insert(num)
            }
        }
        return -1
    }
    
    
    
    /**
     1128. 等价多米诺骨牌对的数量
     给你一个由一些多米诺骨牌组成的列表 dominoes。

     如果其中某一张多米诺骨牌可以通过旋转 0 度或 180 度得到另一张多米诺骨牌，我们就认为这两张牌是等价的。

     形式上，dominoes[i] = [a, b] 和 dominoes[j] = [c, d] 等价的前提是 a==c 且 b==d，或是 a==d 且 b==c。

     在 0 <= i < j < dominoes.length 的前提下，找出满足 dominoes[i] 和 dominoes[j] 等价的骨牌对 (i, j) 的数量。

      

     示例：

     输入：dominoes = [[1,2],[2,1],[3,4],[5,6]]
     输出：1
      

     提示：

     1 <= dominoes.length <= 40000
     1 <= dominoes[i][j] <= 9

     */
    
    func testnumEquivDominoPairs(){
        func numEquivDominoPairs(_ dominoes: [[Int]]) -> Int {
            let intHash:[Int:Int] = [1:1,
                                     2:3,
                                     3:5,4:7,5:11,6:13,7:17,8:23,9:29]
            var ans = 0
            var set:[Int:Int] = [:]
            for i in 0..<dominoes.count {
                let unq = intHash[dominoes[i][0]]! * intHash[dominoes[i][1]]!
                var nums = 0
                if set.keys.contains(unq) {
                    nums = set[unq]!
                }
                set[unq] = nums + 1
            }
            ans = set.values.reduce(0) { (result, i) -> Int in
                return result + (i - 1) * i / 2
            }
            return ans
        }
//        func numEquivDominoPairs(_ dominoes: [[Int]]) -> Int {
//                    var intHash:[Int:Int] = [1:1,
//                                             2:3,
//                                             3:5,4:7,5:11,6:13,7:17,8:23,9:29]
//                    var ans = 0
//                    for i in 0..<dominoes.count {
//                        for j in (i + 1)..<dominoes.count {
//                            let left = intHash[dominoes[i][0]]! * intHash[dominoes[i][1]]!
//                            let right = intHash[dominoes[j][0]]! * intHash[dominoes[j][1]]!
//                            if left == right {
//                                print(dominoes[i])
//                                print(dominoes[j])
//                                ans += 1
//                            }
//                        }
//                    }
//                    return ans
//                }
        
        numEquivDominoPairs([[2,1],[5,4],[3,7],[6,2],[4,4],[1,8],[9,6],[5,3],[7,4],[1,9],[1,1],[6,6],[9,6],[1,3],[9,7],[4,7],[5,1],[6,5],[1,6],[6,1],[1,8],[7,2],[2,4],[1,6],[3,1],[3,9],[3,7],[9,1],[1,9],[8,9]])
    }
    

    
    /**
     面试题 17.16. 按摩师
     一个有名的按摩师会收到源源不断的预约请求，每个预约都可以选择接或不接。在每次预约服务之间要有休息时间，因此她不能接受相邻的预约。给定一个预约请求序列，替按摩师找到最优的预约集合（总预约时间最长），返回总的分钟数。

     注意：本题相对原题稍作改动


     */
    
    func testmassage(){
        func massage(_ nums: [Int]) -> Int {
            if nums.count == 0 {
                return 0
            }
            if nums.count == 1 {
                return nums[0]
            }
            var dp:[Int] = Array(nums)
            for i in 1..<nums.count {
                var _max = 0
                for j in 0..<i-1 {
                    _max = max(_max, dp[j])
                }
                dp[i] = _max + dp[i]
            }
            
            return dp.max()!
        }
        
        massage([2,1,4,5,3,1,1,3])
        
    }
    
    /**
     219. 存在重复元素 II
     给定一个整数数组和一个整数 k，判断数组中是否存在两个不同的索引 i 和 j，使得 nums [i] = nums [j]，并且 i 和 j 的差的 绝对值 至多为 k。
     */
    func testcontainsNearbyDuplicate(){
        func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
            var numsmap:[Int:Int] = [:]
            for i in 0..<nums.count {
                if numsmap.keys.contains(nums[i]) {
                    let beforindex = numsmap[nums[i]]!
                    if i - beforindex <= k {
                        return true
                    }
                }
                numsmap[nums[i]] = i
            }
            
            return false
        }
        print(containsNearbyDuplicate([1,2,3,1], 3))
        print(containsNearbyDuplicate([1,0,1,1], 1))
        print(containsNearbyDuplicate([1,2,3,1,2,3], 2))
    }

    /**
     提交记录
     99. 恢复二叉搜索树
     给你二叉搜索树的根节点 root ，该树中的两个节点被错误地交换。请在不改变其结构的情况下，恢复这棵树。

     进阶：使用 O(n) 空间复杂度的解法很容易实现。你能想出一个只使用常数空间的解决方案吗？
     */
    func recoverTree(_ root: TreeNode?) {
        var firstNode:TreeNode!
        var secondNode:TreeNode!
        var tmpVal:TreeNode = TreeNode(Int.min)
        
        func dfs(_ root: TreeNode?){
            guard let node = root else {
                return
            }
            dfs(node.left)
            if firstNode == nil && tmpVal.val > node.val {
                firstNode = tmpVal
            }
            if firstNode != nil && tmpVal.val > node.val {
                secondNode = node
            }
            tmpVal = node
            
            dfs(node.right)
        }
        
        dfs(root)
        let tmp = secondNode.val
        secondNode.val = firstNode.val
        firstNode.val = tmp
        
    }
    
    
    /**
     你准备参加一场远足活动。给你一个二维 rows x columns 的地图 heights ，其中 heights[row][col] 表示格子 (row, col) 的高度。一开始你在最左上角的格子 (0, 0) ，且你希望去最右下角的格子 (rows-1, columns-1) （注意下标从 0 开始编号）。你每次可以往 上，下，左，右 四个方向之一移动，你想要找到耗费 体力 最小的一条路径。

     一条路径耗费的 体力值 是路径上相邻格子之间 高度差绝对值 的 最大值 决定的。

     请你返回从左上角走到右下角的最小 体力消耗值 。

     来源：力扣（LeetCode）
     链接：https://leetcode-cn.com/problems/path-with-minimum-effort
     著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
     */
    open class Vertex :Hashable{
        public static func == (lhs: LeetcodeQA2.Vertex, rhs: LeetcodeQA2.Vertex) -> Bool {
            return false
        }
        public var hashValue: Int{
            return self.identifier.hashValue
        }

        open var identifier: String
        open var neighbors: [(Vertex, Double)] = []
        open var pathLengthFromStart = Double.infinity
        open var pathVerticesFromStart: [Vertex] = []

        public init(identifier: String) {
            self.identifier = identifier
        }

        open func clearCache() {
            pathLengthFromStart = Double.infinity
            pathVerticesFromStart = []
        }
    }
    
    
    public class Dijkstra {
        private var totalVertices: Set<Vertex>

        public init(vertices: Set<Vertex>) {
            totalVertices = vertices
        }

        private func clearCache() {
            totalVertices.forEach { $0.clearCache() }
        }

        public func findShortestPaths(from startVertex: Vertex) {
            clearCache()
            var currentVertices = self.totalVertices
            startVertex.pathLengthFromStart = 0
            startVertex.pathVerticesFromStart.append(startVertex)
            var currentVertex: Vertex? = startVertex
            while let vertex = currentVertex {
                currentVertices.remove(vertex)
                let filteredNeighbors = vertex.neighbors.filter { currentVertices.contains($0.0) }
                for neighbor in filteredNeighbors {
                    let neighborVertex = neighbor.0
                    let weight = neighbor.1

                    let theoreticNewWeight = vertex.pathLengthFromStart + weight
                    if theoreticNewWeight < neighborVertex.pathLengthFromStart {
                        neighborVertex.pathLengthFromStart = theoreticNewWeight
                        neighborVertex.pathVerticesFromStart = vertex.pathVerticesFromStart
                        neighborVertex.pathVerticesFromStart.append(neighborVertex)
                    }
                }
                if currentVertices.isEmpty {
                    currentVertex = nil
                    break
                }
                currentVertex = currentVertices.min { $0.pathLengthFromStart < $1.pathLengthFromStart }
            }
        }
    }

//    extension Vertex: Hashable {
//        open var hashValue: Int {
//            return identifier.hashValue
//        }
//    }

//    extension Vertex: Equatable {
//        public static func ==(lhs: Vertex, rhs: Vertex) -> Bool {
//            return lhs.hashValue == rhs.hashValue
//        }
//    }
    class Solution {
        func minimumEffortPath(_ heights: [[Int]]) -> Int {
            let h = heights.count
            let w = heights[0].count
            
            for i in 0..<h {
                for j in 0..<w {
                    
                }
            }
            
            return 0
        }
    }
    
    
    

       
       func swimInWater(grid: [[Int]]) -> Int {
        
          let dx = [0,0,1,-1]
          let dy = [1,-1,0,0]
           
           let N = grid.count
           var canReachMinHeight = -1
           
           func canReach(_ position: Int,_ waterHeight: Int) -> Bool {
               
               var queue = [Int]()
               queue.append(0)
               
               var visited = Array<Array<Bool>>(repeating: Array<Bool>(repeating: false, count: N), count: N)
               visited[0][0] = true
               
               while !queue.isEmpty {
                   var nextLevel = [Int]()
                   for p in queue {
                       let x = p & 0xff
                       let y = p >> 8
                       for index in 0..<4 {
                           let  nextX = x + dx[index]
                           let  nextY = y + dy[index]
                           if nextX >= 0 &&  nextX < N && nextY >= 0 && nextY < N && !visited[nextX][nextY] && grid[nextX][nextY] <= waterHeight {
                               guard nextY != N  - 1 || nextX !=  N - 1 else {
                                   canReachMinHeight = waterHeight
                                   return true
                               }
                               visited[nextX][nextY]  = true
                               nextLevel.append(nextY << 8 | nextX)
                           }
                       }
                   }
                   queue = nextLevel
               }
               
               return false
           }
           
           var left = grid[0][0]
           let maxHeight = grid.map {$0.max()!}.max()!
           guard left < maxHeight else {
               return left
           }
           var right = maxHeight + 1
           while left < right {
               let mid =  left + (right -  left) >> 1
               if canReach(0,mid) {
                   right = mid
               }  else {
                   left = mid + 1
               }
           }
           
           guard left < canReachMinHeight else {
               return canReachMinHeight
           }
           return canReach(0,left) ? left : canReachMinHeight
       }
    
    
    func testkWeakestRows(){
        func kWeakestRows(_ mat: [[Int]], _ k: Int) -> [Int] {
            var matPower:[Int:Int] = [:]
            for i in 0..<mat.count {
                let sum =  mat[i].reduce(0) { (result, value) -> Int in
                    return result + value
                }
                matPower[i] = sum
            }
            let sortmatPower = matPower.sorted { (lv, rv) -> Bool in
                return lv.value == rv.value ?  lv.key < rv.key : lv.value < rv.value
            }
            return sortmatPower.prefix(k).map { (kv) -> Int in
                return kv.key
            }
        }
        
        kWeakestRows(
            [[1,1,0,0,0],[1,1,1,1,0],[1,0,0,0,0],[1,1,0,0,0],[1,1,1,1,1]], 3)
        
    }
    
    


    
}
