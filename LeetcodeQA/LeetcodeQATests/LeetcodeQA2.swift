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

    



}
