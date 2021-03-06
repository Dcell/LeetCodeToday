//
//  LeetcodeQATests.swift
//  LeetcodeQATests
//
//  Created by mac_25648_newMini on 2020/10/13.
//  Copyright © 2020 mac_25648_newMini. All rights reserved.
//

import XCTest

class LeetcodeQATests: XCTestCase {
    
    public class ListNode{
      public var val: Int
      public var next: ListNode?
      public init(_ val: Int) {
          self.val = val
          self.next = nil
      }
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    // 给定一个字符串，请你找出其中不含有重复字符的 最长子串 的长度。
    //
    // 示例 1:
    //
    // 输入: "abcabcbb"
    // 输出: 3
    // 解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。
    // 示例 2:
    //
    // 输入: "bbbbb"
    // 输出: 1
    // 解释: 因为无重复字符的最长子串是 "b"，所以其长度为 1。
    // 示例 3:
    //
    // 输入: "pwwkew"
    // 输出: 3
    // 解释: 因为无重复字符的最长子串是 "wke"，所以其长度为 3。
    //      请注意，你的答案必须是 子串 的长度，"pwke" 是一个子序列，不是子串。
    //
    // 来源：力扣（LeetCode）
    // 链接：https://leetcode-cn.com/problems/longest-substring-without-repeating-characters
    // 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
    func lengthOfLongestSubstring(_ s: String) -> Int {
         guard s.count != 0 else {
             return 0
         }
        guard s.count != 1 else {
            return 1
        }
         var start  = 0
         var longestLenght = 0
         var tmpHash:[Character:Int] = [:]
        let characters = Array(s)
        for i in 0..<s.count {
            let char = characters[i]
            if let hasIndex = tmpHash[char] {
                start = max(hasIndex + 1, start)
            }
            tmpHash[char] = i
            longestLenght = max(longestLenght, i - start + 1)
        }
         
         return longestLenght
    }
    
//    5. 最长回文子串
//    给定一个字符串 s，找到 s 中最长的回文子串。你可以假设 s 的最大长度为 1000。
//
//    示例 1：
//
//    输入: "babad"
//    输出: "bab"
//    注意: "aba" 也是一个有效答案。
//    示例 2：
//
//    输入: "cbbd"
//    输出: "bb"
    func longestPalindrome(_ s: String) -> String {
        let characters = Array(s)
        let n = s.count
        var dp = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
        var ans = "";
        for l in 0..<n {
            for i in 0..<(n - l) {
                let j = i + l;
                if (l == 0) {
                    dp[i][j] = true;
                } else if (l == 1) {
                    dp[i][j] = (characters[i] == characters[j]);
                } else {
                    dp[i][j] = (characters[i] == characters[j] && dp[i + 1][j - 1]);
                }
                if (dp[i][j] && l + 1 > ans.count) {
                    ans = String(characters[i..<(i + l + 1)])
                }
            }
        }
        return ans;
    }

//    6. Z 字形变换
//    将一个给定字符串根据给定的行数，以从上往下、从左到右进行 Z 字形排列。
//
//    比如输入字符串为 "LEETCODEISHIRING" 行数为 3 时，排列如下：
//
//    L   C   I   R
//    E T O E S I I G
//    E   D   H   N
//    之后，你的输出需要从左往右逐行读取，产生出一个新的字符串，比如："LCIRETOESIIGEDHN"。
//
//    请你实现这个将字符串进行指定行数变换的函数：
//
//    string convert(string s, int numRows);
//    示例 1:
//
//    输入: s = "LEETCODEISHIRING", numRows = 3
//    输出: "LCIRETOESIIGEDHN"
//    示例 2:
//
//    输入: s = "LEETCODEISHIRING", numRows = 4
//    输出: "LDREOEIIECIHNTSG"
//    解释:
//
//    L     D     R
//    E   O E   I I
//    E C   I H   N
//    T     S     G
    func convert(_ s: String, _ numRows: Int) -> String {
        let characters = Array(s)
        var converChars:[Character] = []
        for i in 0..<numRows {
            if i == 0 ||  i == numRows - 1{
                var start = i
                while start < characters.count {
                    converChars.append(characters[start])
                    start = start + 2*numRows - 2
                }
            }else{
                var start = i
                while start < characters.count {
                    converChars.append(characters[start])
                    let carry = start + numRows - i
                    if(carry < characters.count){
                        converChars.append(characters[carry])
                    }
                    start = start + 2*numRows - 2
                }
            }
        }
        return String(converChars)
    }
    func reverse(_ x: Int) -> Int {
        let xString =  String(x)
        let characters = Array(xString)
        var converChars:[Character] = []
        if(characters[0] == "-"){
            converChars.append("-")
            for i in stride(from: characters.count - 1, through: 1, by: -1) {
                converChars.append(characters[i])
            }
        }else{
            for i in stride(from: characters.count - 1, through: 0, by: -1) {
                converChars.append(characters[i])
            }
        }
        return Int(Int32(String(converChars)) ?? 0)
    }
    
//    9. 回文数
//    判断一个整数是否是回文数。回文数是指正序（从左向右）和倒序（从右向左）读都是一样的整数。
//
//    示例 1:
//
//    输入: 121
//    输出: true
//    示例 2:
//
//    输入: -121
//    输出: false
//    解释: 从左向右读, 为 -121 。 从右向左读, 为 121- 。因此它不是一个回文数。
//    示例 3:
//
//    输入: 10
//    输出: false
//    解释: 从右向左读, 为 01 。因此它不是一个回文数。
//    进阶:
//
//    你能不将整数转为字符串来解决这个问题吗？
    func isPalindrome(_ x: Int) -> Bool {
        let xString = String(x)
        let characters = Array(xString)
        var start = 0
        var end = characters.count - 1
        var isPalindrome =  true
        while start <= end {
            isPalindrome = isPalindrome && characters[start] == characters[end]
            start = start + 1
            end  =  end - 1
        }
        return isPalindrome
    }
    
//    给你 n 个非负整数 a1，a2，...，an，每个数代表坐标中的一个点 (i, ai) 。在坐标内画 n 条垂直线，垂直线 i 的两个端点分别为 (i, ai) 和 (i, 0)。找出其中的两条线，使得它们与 x 轴共同构成的容器可以容纳最多的水。
//
//    说明：你不能倾斜容器，且 n 的值至少为 2。
//
//
//
//
//
//    图中垂直线代表输入数组 [1,8,6,2,5,4,8,3,7]。在此情况下，容器能够容纳水（表示为蓝色部分）的最大值为 49。
//
//
//
//    示例：
//
//    输入：[1,8,6,2,5,4,8,3,7]
//    输出：49
//
//    来源：力扣（LeetCode）
//    链接：https://leetcode-cn.com/problems/container-with-most-water
//    著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
    func maxArea(_ height: [Int]) -> Int {
        return 0
    }
//    12. 整数转罗马数字
//    罗马数字包含以下七种字符： I， V， X， L，C，D 和 M。
//
//    字符          数值
//    I             1
//    V             5
//    X             10
//    L             50
//    C             100
//    D             500
//    M             1000
//    例如， 罗马数字 2 写做 II ，即为两个并列的 1。12 写做 XII ，即为 X + II 。 27 写做  XXVII, 即为 XX + V + II 。
//
//    通常情况下，罗马数字中小的数字在大的数字的右边。但也存在特例，例如 4 不写做 IIII，而是 IV。数字 1 在数字 5 的左边，所表示的数等于大数 5 减小数 1 得到的数值 4 。同样地，数字 9 表示为 IX。这个特殊的规则只适用于以下六种情况：
//
//    I 可以放在 V (5) 和 X (10) 的左边，来表示 4 和 9。
//    X 可以放在 L (50) 和 C (100) 的左边，来表示 40 和 90。
//    C 可以放在 D (500) 和 M (1000) 的左边，来表示 400 和 900。
//    给定一个整数，将其转为罗马数字。输入确保在 1 到 3999 的范围内。
    func intToRoman(_ num: Int) -> String {
        let values = [1000,900,500,400,100,90,50,40,10,9,5,4,1];
        let reps = ["M","CM","D","CD","C","XC","L","XL","X","IX","V","IV","I"];
        
        var res = "";
        var num = num
        for i in 0..<13 {
            while(num>=values[i]){
                num -= values[i];
                res += reps[i];
            }
        }
        return res;
    }
//    15. 三数之和
//    给你一个包含 n 个整数的数组 nums，判断 nums 中是否存在三个元素 a，b，c ，使得 a + b + c = 0 ？请你找出所有满足条件且不重复的三元组。
//
//    注意：答案中不可以包含重复的三元组。
//
//
//
//    示例：
//
//    给定数组 nums = [-1, 0, 1, 2, -1, -4]，
//
//    满足要求的三元组集合为：
//    [
//      [-1, 0, 1],
//      [-1, -1, 2]
//    ]
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var nums = nums
        nums.sort()
        var dp:[Int:Int] = [:]
        var trs:[[Int]] = []
        func twoSum(_ nums: [Int],_ target:Int,_ index:Int) -> [Int]{
            for i in 0..<nums.count{
                if let other = dp[target - nums[i]]{
                    return [nums[i],target - nums[i]]
                }else{
                    dp[nums[i]] = i + index
                }
            }
            return []
        }
        for i in 0..<nums.count{
            var ts =  twoSum(Array(nums[i + 1..<nums.count]),0 - nums[i], i + 1)
            if(ts.count == 2){
                ts.insert(nums[i], at: 0)
                trs.append(ts)
            }else{
                dp[nums[i]] = i
            }
        }
        
        return trs
    }
    
//    16. 最接近的三数之和
//    给定一个包括 n 个整数的数组 nums 和 一个目标值 target。找出 nums 中的三个整数，使得它们的和与 target 最接近。返回这三个数的和。假定每组输入只存在唯一答案。
//
//
//
//    示例：
//
//    输入：nums = [-1,2,1,-4], target = 1
//    输出：2
//    解释：与 target 最接近的和是 2 (-1 + 2 + 1 = 2) 。
//
//
//    提示：
//
//    3 <= nums.length <= 10^3
//    -10^3 <= nums[i] <= 10^3
//    -10^4 <= target <= 10^4
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        func twoSumClosest(_ nums: [Int], _ target: Int) -> Int{
            var start = 0
            var end = nums.count - 1
            var closest = nums[start] + nums[end]
            while start != end {
                let sun = nums[start] + nums[end]
                if(abs(target - sun) < abs(target - closest)){
                    closest = sun
                }
                if(nums[start] + nums[end] > target){
                    end -= 1
                }else{
                    start += 1
                }
            }
            return closest
        }
        var nums = nums
        nums.sort()
        var closest = nums[0] + nums[1] + nums[2]
        for i in 0..<nums.count - 2 {
            let iv = nums[i]
            let twoSumclosest =  twoSumClosest(Array(nums[i + 1..<nums.count]),target - iv)
            let threeSumclosest = twoSumclosest + iv
            if(abs(target - threeSumclosest) < abs(target - closest)){
                closest = threeSumclosest
            }
        }
        
        return closest
    }
    
//    17. 电话号码的字母组合
//    给定一个仅包含数字 2-9 的字符串，返回所有它能表示的字母组合。
//
//    给出数字到字母的映射如下（与电话按键相同）。注意 1 不对应任何字母。
//
//
//
//    示例:
//
//    输入："23"
//    输出：["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"].
//    说明:
//    尽管上面的答案是按字典序排列的，但是你可以任意选择答案输出的顺序。
    func letterCombinations(_ digits: String) -> [String] {
        var result:[String] = []
        
        let letterMap:[String] = [
                    " ",    //0
                    "",     //1
                    "abc",  //2
                    "def",  //3
                    "ghi",  //4
                    "jkl",  //5
                    "mno",  //6
                    "pqrs", //7
                    "tuv",  //8
                    "wxyz"  //9
            ]
        
        func backTrack(_ digits:String,_ res:String,_ index:Int){
            if(index == digits.count){
                result.append(res)
                return
            }
            let num = Array(digits)[index]
            let letters = letterMap[Int(String(num))!]
            for letter in letters {
                //选择
                
                //回溯
                backTrack(digits, res + String(letter), index + 1)
                //删除选择

            }
        }
        
        if digits.count == 0 {
            return []
        }
        
        backTrack(digits, "", 0)
        
        return result
    }

//    19. 删除链表的倒数第N个节点
//    给定一个链表，删除链表的倒数第 n 个节点，并且返回链表的头结点。
//
//    示例：
//
//    给定一个链表: 1->2->3->4->5, 和 n = 2.
//
//    当删除了倒数第二个节点后，链表变为 1->2->3->5.
//    说明：
//
//    给定的 n 保证是有效的。
//
//    进阶：
//
//    你能尝试使用一趟扫描实现吗？
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var dump = ListNode(0)
        dump.next = head
        var second:ListNode? = dump
        var frist:ListNode? = dump
        for i in 0..<n {
            second = second?.next
        }
        while second?.next != nil  {
            second = second?.next
            frist = frist?.next
        }
        frist?.next = frist?.next?.next
        return dump.next
    }
    
    

    
//    24. 两两交换链表中的节点
//    给定一个链表，两两交换其中相邻的节点，并返回交换后的链表。
//
//    你不能只是单纯的改变节点内部的值，而是需要实际的进行节点交换。
//
//
//
//    示例 1：
//
//
//    输入：head = [1,2,3,4]
//    输出：[2,1,4,3]
//    示例 2：
//
//    输入：head = []
//    输出：[]
//    示例 3：
//
//    输入：head = [1]
//    输出：[1]
    func swapPairs(_ head: ListNode?) -> ListNode? {
        print("----------")
        let dump = ListNode(0)
        dump.next = head
        if dump.next != nil && dump.next?.next != nil {
            let leave = dump.next?.next?.next
            print(leave?.val)
            let tmp = dump.next
            print(tmp?.val)

            dump.next = dump.next?.next
            dump.next = tmp
            
            print(dump.next?.val)
            print(dump.next?.next?.val)
            
            dump.next?.next?.next = swapPairs(leave)
        }
        return dump.next
    }
    
    // 数字 n 代表生成括号的对数，请你设计一个函数，用于能够生成所有可能的并且 有效的 括号组合。
    //
    //
    //
    // 示例：
    //
    // 输入：n = 3
    // 输出：[
    //        "((()))",
    //        "(()())",
    //        "(())()",
    //        "()(())",
    //        "()()()"
    //      ]
    //
    // 来源：力扣（LeetCode）
    // 链接：https://leetcode-cn.com/problems/generate-parentheses
    // 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
     
     
     func generateParenthesis(_ n: Int) -> [String] {
        var result:[String] = []
        func generateParent(_ left:Int,_ right:Int,_ parent:String){
            if left == 0 && right == 0 {
                result.append(parent)
                return
            }
            if left == right {//如果左括号 等于 右边 括弧 ，只能放左括号
                let _parent = parent + "("
                generateParent(left - 1, right, _parent)
            }else if(left < right){ //如果小于 可以放左括号 和 可以放右括号
                if left > 0 {
                    generateParent(left - 1, right, parent + "(")
                }
                generateParent(left, right - 1, parent + ")")
            }
            else{
                return
            }
        }
        generateParent(n, n, "")
        return result
     }
    
//    给你一个链表数组，每个链表都已经按升序排列。
//
//    请你将所有链表合并到一个升序链表中，返回合并后的链表。
//
//
//
//    示例 1：
//
//    输入：lists = [[1,4,5],[1,3,4],[2,6]]
//    输出：[1,1,2,3,4,4,5,6]
//    解释：链表数组如下：
//    [
//      1->4->5,
//      1->3->4,
//      2->6
//    ]
//    将它们合并到一个有序链表中得到。
//    1->1->2->3->4->4->5->6
//
//    来源：力扣（LeetCode）
//    链接：https://leetcode-cn.com/problems/merge-k-sorted-lists
//    著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        
        //分治 22 合并的方法
        func mergeKLists2(_ lists: [ListNode?]) -> ListNode? {
                if lists.count == 0 {
                    return nil
                }
                if lists.count == 1 {
                    return lists[0]
                }
                var resultNode: ListNode = ListNode(-1)
                func mergeListNodel(_ node1: ListNode?, _ node2: ListNode?,     _ result: inout ListNode) {
                    if node1 == nil {
                        result.next = node2
                        return
                    }
                    if node2 == nil {
                        result.next = node1
                        return
                    }

                    if node1!.val > node2!.val {
                        result.next = node2
                        mergeListNodel(node1, node2?.next, &result.next!)
                    }else{
                        result.next = node1
                        mergeListNodel(node1?.next, node2, &result.next!)
                    }
                }

                var resultList:[ListNode?] = lists
                while resultList.count > 1 {
                    var tempList:[ListNode?] = []
                    for idx in stride(from: 0, to: resultList.count, by: 2) {
                        var resultNode: ListNode = ListNode(-1)
                        if idx < resultList.count-1 {
                            mergeListNodel(resultList[idx], resultList[idx+1], &resultNode)
                            
                        } else {
                            mergeListNodel(resultList[idx], resultNode.next, &resultNode)
                        }
                        tempList.append(resultNode.next)
                    }
                    resultList = tempList
                }
                
                return resultList.first!
            }
        
//        let head = ListNode(0)
//        var tmp:ListNode = ListNode(0)
//        head.next = tmp
//
//        //方式2
//        var kHash:[Int:ListNode]  = [:]
//        var i = 0
//        for node in lists {
//            if node != nil {
//                i += 1
//                kHash[i] = node!
//            }
//        }
//
//        while !kHash.isEmpty {
//            var minNode = ListNode(Int.max)
//            var index = 0
//            for item in kHash {
//                if item.value.val < minNode.val  {
//                    minNode = item.value
//                    index = item.key
//                }
//            }
//            if let nextNode = minNode.next {
//                kHash[index] = nextNode
//            }else{
//                kHash.removeValue(forKey: index)
//            }
//            tmp.next = minNode
//            tmp = minNode
//        }
        
        
        
        
//        var klist:[ListNode]  = []
//        for node in lists {
//            if node != nil {
//                klist.append(node!)
//            }
//        }
//
//
//        head.next = tmp
//        while klist.count != 0 {// 第一次提交用list存储 性能太差，改成hash存储试试
//            //找到该数组中 最小的点
//            var minNode = ListNode(Int.max)
//            var index = 0
//            for item in klist.enumerated() {
//                if item.element.val < minNode.val  {
//                    minNode = item.element
//                    index = item.offset
//                }
//            }
//            if let nextNode = minNode.next {
//                klist[index] = nextNode
//            }else{
//                klist.remove(at: index)
//            }
//            tmp.next = minNode
//            tmp = minNode
//        }
        
//        return head.next?.next
        return nil
    }
    
    
//    给定一个只包含 '(' 和 ')' 的字符串，找出最长的包含有效括号的子串的长度。
//
//    示例 1:
//
//    输入: "(()"
//    输出: 2
//    解释: 最长有效括号子串为 "()"
//    示例 2:
//
//    输入: ")()())"
//    输出: 4
//    解释: 最长有效括号子串为 "()()"
//
//    来源：力扣（LeetCode）
//    链接：https://leetcode-cn.com/problems/longest-valid-parentheses
//    著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

    
    func longestValidParentheses(_ s: String) -> Int {
        guard s.count != 0 else {
            return 0
        }
        var res = 0
        let sArray = Array(s)
        var dp = Array(repeating: 0, count: s.count)//初始化dp默认都是0
        for item in sArray.enumerated() {
            if(item.element == ")" && item.offset > 0){
                let i = item.offset
                if sArray[i - 1] == "("  {
                    dp[i] = (i >= 2 ? dp[i - 2] : 0) + 2
                } else if i - dp[i - 1] > 0 && sArray[i - dp[i - 1] - 1] == "(" {
                    dp[i] = dp[i - 1] + (i - dp[i - 1] >= 2 ? dp[i - dp[i - 1] - 2] : 0) + 2
                }
                res = max(res, dp[i])

            }
        }
        return res
    }
    
    
//    33. 搜索旋转排序数组
//    给你一个整数数组 nums ，和一个整数 target 。
//
//    该整数数组原本是按升序排列，但输入时在预先未知的某个点上进行了旋转。（例如，数组 [0,1,2,4,5,6,7] 可能变为 [4,5,6,7,0,1,2] ）。
//
//    请你在数组中搜索 target ，如果数组中存在这个目标值，则返回它的索引，否则返回 -1 。
//
//
//    示例 1：
//
//    输入：nums = [4,5,6,7,0,1,2], target = 0
//    输出：4
//    示例 2：
//
//    输入：nums = [4,5,6,7,0,1,2], target = 3
//    输出：-1
//    示例 3：
//
//    输入：nums = [1], target = 0
//    输出：-1
//
//
//    提示：
//
//    1 <= nums.length <= 5000
//    -10^4 <= nums[i] <= 10^4
//    nums 中的每个值都 独一无二
//    nums 肯定会在某个点上旋转
//    -10^4 <= target <= 10^4
    
    func search(_ nums: [Int], _ target: Int) -> Int {
            if nums.count == 0 {
                return -1
            }
            if nums.count == 1 && nums[0] == target {
                return 0
            }
            if nums.count == 1 {
                return -1
            }
            var left  = 0
            var right = nums.count - 1
            while left <= right {
                let mid = (left + right)/2
                if nums[mid] == target {
                    return mid
                }
                //判断左边是否是有序的
                if(nums[0] <= nums[mid]){//左侧是排序的
                    if(target >= nums[0] && target < nums[mid]){
                        right = mid - 1
                    }else{
                        left = mid + 1
                    }
                }else{//右侧是排序的
                    if(target > nums[mid] && target <= nums[nums.count - 1]){
                        left = mid + 1
                    }else{
                        right = mid - 1
                    }
                }
                
            }
            return -1
        }
    
//    34. 在排序数组中查找元素的第一个和最后一个位置
//    给定一个按照升序排列的整数数组 nums，和一个目标值 target。找出给定目标值在数组中的开始位置和结束位置。
//
//    如果数组中不存在目标值 target，返回 [-1, -1]。
//
//    进阶：
//
//    你可以设计并实现时间复杂度为 O(log n) 的算法解决此问题吗？
//
//
//    示例 1：
//
//    输入：nums = [5,7,7,8,8,10], target = 8
//    输出：[3,4]
//    示例 2：
//
//    输入：nums = [5,7,7,8,8,10], target = 6
//    输出：[-1,-1]
//    示例 3：
//
//    输入：nums = [], target = 0
//    输出：[-1,-1]
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        if nums.count == 0 {
            return [-1,-1]
        }
        var left = 0
        var right = nums.count - 1
        while left <= right {
            let mid = (left + right)/2
            if nums[mid] == target {//如果命中 则表示就在旁边
                var _left = mid
                var _right = mid
                while nums[_left] == target || nums[_right] == target {
                    let l = _left - 1
                    let r = _right + 1
                    if((l < 0 || nums[l] != target) && (r > nums.count - 1 || nums[r] != target) ){
                        return [_left,_right]
                    }else{
                        if (l >= 0 && nums[l] == target) {
                            _left = l
                        }else if (r <= nums.count - 1 && nums[r] == target) {
                            _right = r
                        }else{
                            break
                        }
                    }
                }
                return [_left,_right]
            }else{
                if nums[mid] >= target {
                    right = mid - 1
                }else{
                    left = mid + 1
                }
            }
        }
        return [-1,-1]
    }
    
    
//    39. 组合总和
//    给定一个无重复元素的数组 candidates 和一个目标数 target ，找出 candidates 中所有可以使数字和为 target 的组合。
//
//    candidates 中的数字可以无限制重复被选取。
//
//    说明：
//
//    所有数字（包括 target）都是正整数。
//    解集不能包含重复的组合。
//    示例 1：
//
//    输入：candidates = [2,3,6,7], target = 7,
//    所求解集为：
//    [
//      [7],
//      [2,2,3]
//    ]
    func testcombinationSum(){
        
        func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
            var combo:[[Int]] = []
            
            func dfs(_ candidates: [Int], _ target:Int, _ path:[Int] ,_ index:Int){
                if target < 0 {
                    return
                }
                if target == 0 {
                    combo.append(path)
                }
                for i in index..<candidates.count {
                    var tmpPath = path
                    tmpPath.append(candidates[i])
                    dfs(candidates, target - candidates[i], tmpPath, i)
                }
                
            }
            
            dfs(candidates, target, [], 0)
            
            return combo
        }
        
        var result = combinationSum([2,3,6,7], 7)
        print(result)
        
        result = combinationSum([2,3,5], 8)
        print(result)
        
    }
    
    
    
//    42. 接雨水
//    给定 n 个非负整数表示每个宽度为 1 的柱子的高度图，计算按此排列的柱子，下雨之后能接多少雨水。
//
//
//
//    示例 1：
//
//
//
//    输入：height = [0,1,0,2,1,0,1,3,2,1,2,1]
//    输出：6
//    解释：上面是由数组 [0,1,0,2,1,0,1,3,2,1,2,1] 表示的高度图，在这种情况下，可以接 6 个单位的雨水（蓝色部分表示雨水）。
    func testtrap() {
        func trap(_ height: [Int]) -> Int {//找到对应的凹槽
            var stack:[Int] = []
            var ans = 0
            for i in 0..<height.count {
                while !stack.isEmpty && height[i] > height[stack.last!] {
                    // 当前索引
                    let currentIndex = stack.last!
                    while !stack.isEmpty && height[stack.last!] == height[currentIndex] {
                        stack.popLast()
                    }
                    if !stack.isEmpty {
                        let width = i - stack.last! - 1
                        let height = min(height[i], height[stack.last!]) - height[currentIndex]
                        ans += width * height
                    }
                }
                stack.append(i)
            }
            return ans
        }
        
        let result = trap([0,1,0,2,1,0,1,3,2,1,2,1])
        print(result)
    }
    
//    给定一个 没有重复 数字的序列，返回其所有可能的全排列。
//
//    示例:
//
//    输入: [1,2,3]
//    输出:
//    [
//      [1,2,3],
//      [1,3,2],
//      [2,1,3],
//      [2,3,1],
//      [3,1,2],
//      [3,2,1]
//    ]
//
//    来源：力扣（LeetCode）
//    链接：https://leetcode-cn.com/problems/permutations
//    著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
    
    func testpermute(){
        func permute(_ nums: [Int]) -> [[Int]] {
            if nums.count == 1 {
                return [nums]
            }
            var ans:[[Int]] = []
           
            for item in nums.enumerated() {
                var tmp = nums
                tmp.remove(at: item.offset)
                let tmpans = permute(tmp)
                let mapans = tmpans.map { (lr) -> [Int] in
                    var nlr = lr
                    nlr.insert(item.element, at: 0)
                    return nlr
                }
                ans.append(contentsOf: mapans)

            }
            
            return ans
        }
        
        let ans = permute([1,2,3])
        print(ans)
        
    }
    
//    48. 旋转图像
//    给定一个 n × n 的二维矩阵表示一个图像。
//
//    将图像顺时针旋转 90 度。
//
//    说明：
//
//    你必须在原地旋转图像，这意味着你需要直接修改输入的二维矩阵。请不要使用另一个矩阵来旋转图像。
//
//    示例 1:
//
//    给定 matrix =
//    [
//      [1,2,3],
//      [4,5,6],
//      [7,8,9]
//    ],
//
//    原地旋转输入矩阵，使其变为:
//    [
//      [7,4,1],
//      [8,5,2],
//      [9,6,3]
//    ]
    
    func testrotate() {
        func rotate(_ matrix: inout [[Int]]) {
            let size = matrix.count
            //先对角线反转
            for i in 0..<size {
                for j in 0..<i {
                    let tem = matrix[j][i]
                    matrix[j][i] = matrix[i][j]
                    matrix[i][j] = tem
                }
            }
            
            //再每行反转
            for i in 0..<size {
                for j in 0..<size/2 {
                    let tem = matrix[i][size - j - 1]
                    matrix[i][size - j - 1] = matrix[i][j]
                    matrix[i][j] = tem
                }
            }
        }
        var demo = [
            [1,2,3],
            [4,5,6],
            [7,8,9]
          ]
        
        rotate(&demo)
    }
//    55. 跳跃游戏
//    给定一个非负整数数组，你最初位于数组的第一个位置。
//
//    数组中的每个元素代表你在该位置可以跳跃的最大长度。
//
//    判断你是否能够到达最后一个位置。
//
//    示例 1:
//
//    输入: [2,3,1,1,4]
//    输出: true
//    解释: 我们可以先跳 1 步，从位置 0 到达 位置 1, 然后再从位置 1 跳 3 步到达最后一个位置。
//    示例 2:
//
//    输入: [3,2,1,0,4]
//    输出: false
//    解释: 无论怎样，你总会到达索引为 3 的位置。但该位置的最大跳跃长度是 0 ， 所以你永远不可能到达最后一个位置。
//
    func testcanJump(){
//        如果某一个作为 起跳点 的格子可以跳跃的距离是 3，那么表示后面 3 个格子都可以作为 起跳点。
//        可以对每一个能作为 起跳点 的格子都尝试跳一次，把 能跳到最远的距离 不断更新。
//        如果可以一直跳到最后，就成功了。
//
//        作者：ikaruga
//        链接：https://leetcode-cn.com/problems/jump-game/solution/55-by-ikaruga/
//        来源：力扣（LeetCode）
//        著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
        func canJump(_ nums: [Int]) -> Bool {
            var k = 0
            for i in 0..<nums.count {
                if i > k {
                    return false
                }
                k = max(k, i + nums[i])
            }
            return true
        }
    }
    
    
    /**56. 合并区间
     给出一个区间的集合，请合并所有重叠的区间。

      

     示例 1:

     输入: intervals = [[1,3],[2,6],[8,10],[15,18]]
     输出: [[1,6],[8,10],[15,18]]
     解释: 区间 [1,3] 和 [2,6] 重叠, 将它们合并为 [1,6].
     示例 2:

     输入: intervals = [[1,4],[4,5]]
     输出: [[1,5]]
     解释: 区间 [1,4] 和 [4,5] 可被视为重叠区间。
     注意：输入类型已于2019年4月15日更改。 请重置默认代码定义以获取新方法签名。*/
    func testmerge(){
        func merge(_ intervals: [[Int]]) -> [[Int]] {
            if intervals.count <= 0 {
                return []
            }
            //先按照左边点，重新排序
            var intervals = intervals
            intervals.sort { (lf, lr) -> Bool in
                return lf[0] < lr[0]
            }
            var ans:[[Int]] = []
            ans.append(intervals[0])
            for i in 1..<intervals.count {
                let currInterval = intervals[i]
                var lastInterval = ans.last!
                if currInterval[0] >  lastInterval[1] {
                    ans.append(currInterval)
                }else{
                    lastInterval[1] = max(lastInterval[1], currInterval[1])
                    ans.popLast()
                    ans.append(lastInterval)
                }
            }
            return ans
        }
        merge([[1,3],[2,6],[8,10],[15,18]])
    }
    
    /**
     提交记录
     49. 字母异位词分组
     给定一个字符串数组，将字母异位词组合在一起。字母异位词指字母相同，但排列不同的字符串。

     示例:

     输入: ["eat", "tea", "tan", "ate", "nat", "bat"]
     输出:
     [
       ["ate","eat","tea"],
       ["nat","tan"],
       ["bat"]
     ]
     说明：

     所有输入均为小写字母。
     不考虑答案输出的顺序。
     */
    func testgroupAnagrams(){
        func groupAnagrams(_ strs: [String]) -> [[String]] {
            //按照首字母排序
            let sortStrs = strs.map { (array) -> String in
                return String(array.sorted())
            }
            var hashMap:[String:[String]] = [:]
            for i in 0..<sortStrs.count {
                let item = sortStrs[i]
                let realitem = strs[i]
                if hashMap.keys.contains(item) {
                    var list = hashMap[item]
                    list?.append(realitem)
                    hashMap[item] = list
                }else{
                    let list = [realitem]
                    hashMap[item] = list
                }
            }
            return hashMap.values.reversed()
        }
        
        groupAnagrams(["eat", "tea", "tan", "ate", "nat", "bat"])
    }
    
    /**
     62. 不同路径
     一个机器人位于一个 m x n 网格的左上角 （起始点在下图中标记为 “Start” ）。

     机器人每次只能向下或者向右移动一步。机器人试图达到网格的右下角（在下图中标记为 “Finish” ）。

     问总共有多少条不同的路径？

      

     示例 1：


     输入：m = 3, n = 7
     输出：28
     示例 2：

     输入：m = 3, n = 2
     输出：3
     解释：
     从左上角开始，总共有 3 条路径可以到达右下角。
     1. 向右 -> 向右 -> 向下
     2. 向右 -> 向下 -> 向右
     3. 向下 -> 向右 -> 向右
     示例 3：

     输入：m = 7, n = 3
     输出：28
     示例 4：

     输入：m = 3, n = 3
     输出：6*/
    func testuniquePaths(){
        
        func uniquePaths(_ m: Int, _ n: Int) -> Int {
            var dp:[String:Int] = [:]
            func dps(_ x: Int, _ y: Int) -> Int{
                if x + y == 0 {
                    return 1
                }
                if x + y == 1 {
                    return 1
                }
                let key = "\(x)_\(y)"
                if dp.keys.contains(key) {
                    return dp[key]!
                }
                var down = 0
                var right = 0
                if x > 0 {
                    right =  dps(x - 1, y)
                }
                if y > 0{
                    down =  dps(x, y - 1)
                }
                dp[key] = down + right
                return down + right
                
            }
            let ans = dps(m - 1, n - 1)
            return ans
        }
        
        let ans = uniquePaths(7, 3)
        print(ans)
    }
    
//    59. 螺旋矩阵 II
//    给定一个正整数 n，生成一个包含 1 到 n2 所有元素，且元素按顺时针顺序螺旋排列的正方形矩阵。
//
//    示例:
//
//    输入: 3
//    输出:
//    [
//     [ 1, 2, 3 ],
//     [ 8, 9, 4 ],
//     [ 7, 6, 5 ]
//    ]
//
    func testgenerateMatrix(){
        func generateMatrix(_ n: Int) -> [[Int]] {
            var l = 0
            var r = n - 1
            var t = 0
            var b = n - 1
            var num = 0
            var ans:Array<Array<Int>> = Array(repeating: Array(repeating: 0, count: n), count: n)
            while num < n*n {
                for i in stride(from: l, through: r, by: 1){
                    num += 1
                    ans[t][i] = num
                }
                t = t + 1
                for i in stride(from: t, through: b, by: 1){
                    num += 1
                    ans[i][r] = num
                }
                r = r - 1
                for i in stride(from: r, through: l, by: -1) {
                    num += 1
                    ans[b][i] = num
                }
                b = b - 1
                for i in stride(from: b, through: t, by: -1) {
                    num += 1
                    ans[i][l] = num
                }
                l = l + 1
            }
            return ans
        }
        let ans = generateMatrix(3)
        print(ans)
    }
    
    /**
     64. 最小路径和
     给定一个包含非负整数的 m x n 网格 grid ，请找出一条从左上角到右下角的路径，使得路径上的数字总和为最小。

     说明：每次只能向下或者向右移动一步。
     
     示例 1：


     输入：grid = [[1,3,1],[1,5,1],[4,2,1]]
     输出：7
     解释：因为路径 1→3→1→1→1 的总和最小。
     示例 2：

     输入：grid = [[1,2,3],[4,5,6]]
     输出：12

     来源：力扣（LeetCode）
     链接：https://leetcode-cn.com/problems/minimum-path-sum
     著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
     */
    func testminPathSum(){
        
        func minPathSum(_ grid: [[Int]]) -> Int {
//            var dp:[String:Int] = [:]
//            let n = grid.count
//            let m = grid[n - 1].count
//            func dps(_ startx:Int,_ starty:Int) -> Int {
//                if startx + 1 == n && starty + 1 == m {
//                    print("x:\(startx) -- y:\(starty) === \(grid[startx][starty])")
//                    return grid[startx][starty]
//                }
//                let key = "\(startx)_\(starty)"
//                if dp.keys.contains(key) {
//                    return dp[key]!
//                }
//                var minans = 0
//                if startx >= n - 1{
//                    minans = grid[startx][starty] + dps(startx, starty + 1)
//                }else if starty >= m - 1{
//                    minans = grid[startx][starty] + dps(startx + 1,starty)
//                }else {
//                    minans = grid[startx][starty] + min(dps(startx + 1,starty), dps(startx, starty + 1))
//                }
//                print("x:\(startx) -- y:\(starty) === \(minans)")
//                dp[key] = minans
//                return minans
//            }
//            return dps(0,0)
            
            
            //方法2，
            var grid = grid
            for i in 0..<grid.count {
                for j in 0..<grid[0].count {
                    if i == 0 && j == 0 {
                        continue
                    }
                    if i == 0 {
                        grid[i][j] = grid[i][j] + grid[i][j - 1]
                    }else if j == 0{
                        grid[i][j] = grid[i][j] + grid[i - 1][j]
                    }else{
                        grid[i][j] = grid[i][j] + min(grid[i - 1][j], grid[i][j - 1])
                    }
                }
            }
            return grid[grid.count - 1][grid[0].count - 1]
        }
        let ans = minPathSum([[1,2,3],[4,5,6]])
        print(ans)
        
    }
    

    
    /**
     75. 颜色分类
     给定一个包含红色、白色和蓝色，一共 n 个元素的数组，原地对它们进行排序，使得相同颜色的元素相邻，并按照红色、白色、蓝色顺序排列。

     此题中，我们使用整数 0、 1 和 2 分别表示红色、白色和蓝色。

      

     进阶：

     你可以不使用代码库中的排序函数来解决这道题吗？
     你能想出一个仅使用常数空间的一趟扫描算法吗？
     示例 1：

     输入：nums = [2,0,2,1,1,0]
     输出：[0,0,1,1,2,2]
     */
    func testortcolor(){
        func sortColors(_ nums: inout [Int]) {
            //先排0
            var left = 0
            var right = 0
            while right < nums.count {
                if nums[right] == 0 {//交换
                    let leftValue = nums[left]
                    nums[left] = nums[right]
                    nums[right] = leftValue
                    left += 1
                }
                right += 1
            }
            
            //排1
            right = left
            while right < nums.count {
                if nums[right] == 1 {//交换
                    let leftValue = nums[left]
                    nums[left] = nums[right]
                    nums[right] = leftValue
                    left += 1
                }
                right += 1
            }
        }
        var colors = [2,0,2,1,1,0]
        let ans = sortColors(&colors)
        print(ans)
    }

    
    /**
     78. 子集
     给定一组不含重复元素的整数数组 nums，返回该数组所有可能的子集（幂集）。

     说明：解集不能包含重复的子集。

     示例:

     输入: nums = [1,2,3]
     输出:
     [
       [3],
       [1],
       [2],
       [1,2,3],
       [1,3],
       [2,3],
       [1,2],
       []
     ]
     */
    func testsubsets(){
        func subsets(_ nums: [Int]) -> [[Int]] {
            if nums.count == 0 {
                return [nums]
            }
            if nums.count == 1 {
                return [nums,[]]
            }
            var tmpNums = nums
            let lastnum = tmpNums.popLast()!
            var ans = subsets(tmpNums)
            let mapans = ans.map { (item) -> [Int] in
                var mapitem = item
                mapitem.append(lastnum)
                return mapitem
            }
            ans.append(contentsOf: mapans)
            
            return ans
        }
        let ans = subsets( [1,2,3])
        print(ans)
    }
    
    
    /**
     79. 单词搜索
     给定一个二维网格和一个单词，找出该单词是否存在于网格中。

     单词必须按照字母顺序，通过相邻的单元格内的字母构成，其中“相邻”单元格是那些水平相邻或垂直相邻的单元格。同一个单元格内的字母不允许被重复使用。

      

     示例:

     board =
     [
       ['A','B','C','E'],
       ['S','F','C','S'],
       ['A','D','E','E']
     ]

     给定 word = "ABCCED", 返回 true
     给定 word = "SEE", 返回 true
     给定 word = "ABCB", 返回 false
     */
    func testsearch(){
        func exist(_ board: [[Character]], _ word: String) -> Bool {
            let wordArray = Array(word)
            func dfs(_ board: [[Character]], _ word: Array<Character>,_ wordindex:Int,_ x:Int, _ y:Int) -> Bool{
                if board[x][y] != word[wordindex] { //如果值不相同
                    return false
                }
                if wordindex == word.count - 1 { //如果最后一个值也相同 则直接返回true
                    return true
                }
                var tmpboard = board
                tmpboard[x][y] = "0"
                let wordindex = wordindex + 1
                if x > 0 && dfs(tmpboard, word, wordindex, x - 1, y) || y > 0 && dfs(tmpboard, word, wordindex, x, y - 1) || x < board.count - 1 && dfs(tmpboard, word, wordindex, x + 1, y) || y < board[x].count - 1 && dfs(tmpboard, word, wordindex, x, y + 1) {
                    return true
                }
                return false
            }
            
            for i in 0..<board.count {
                for j in 0..<board[i].count {
                    if(dfs(board, wordArray, 0, i, j)){
                        return true
                    }
                }
            }
            
            return false
        }
    }
    
    
    /**
     84. 柱状图中最大的矩形
     给定 n 个非负整数，用来表示柱状图中各个柱子的高度。每个柱子彼此相邻，且宽度为 1 。

     求在该柱状图中，能够勾勒出来的矩形的最大面积。
     
     示例:

     输入: [2,1,5,6,2,3]
     输出: 10
     */
    func testlargestRectangleArea(){
//        func largestRectangleArea(_ heights: [Int]) -> Int {
//            func maxSize(_ heights: [Int]) ->Int{
//                if heights.count == 0 {
//                    return 0
//                }
//                if heights.count == 1  {
//                    return heights[0]
//                }
//                let right = heights.count - 1
//                var left = heights.count - 1
//                var maxsize = 0
//                var minHeight = min(heights[left], heights[right])
//                while left >= 0 {
//                    let w = right - left + 1
//                    minHeight = min(minHeight, heights[left])
//                    maxsize = max(maxsize, w*minHeight)
//                    left -= 1
//                }
//                return maxsize
//            }
//            var stack:[Int] = []
//            var maxsize = 0
//            for i in 0..<heights.count {
//                stack.append(heights[i])
//                maxsize = max(maxsize, maxSize(stack))
//            }
//
//            return maxsize
//        }
        
        func largestRectangleArea(_ heights: [Int]) -> Int {
                if heights.isEmpty {
                 return 0
             }
             if heights.count == 1 {
                 return heights.first!
             }
             var heights = heights
             var stack = [Int]()
             //防止都是递增
             heights.append(0)
             var maxArea = 0
             for i in 0..<heights.count {
                 //当前栈不为空 & 紧接着元素 小于 栈顶元素
                 while !stack.isEmpty && heights[stack.last!] >= heights[i] {
                     //栈顶元素出栈
                     var last = stack.removeLast()
                     var width = 0
                     if !stack.isEmpty {
                         //计算栈顶元素为高度的矩形时，因为它已经出栈
                         //宽度等于 当前比栈顶小的 -  栈顶之前比栈顶小的 ，由于栈顶已经出栈 ，再 - 1
                         //此时的栈顶放的是比已经出栈的栈顶严格小的那个
                         width = i - stack.last! - 1
                     } else {
                         width = i
                     }
                     maxArea = max(maxArea, heights[last] * width)
                 }
                 stack.append(i)
             }
             
             return maxArea
         }
        
        //let ans = largestRectangleArea([1,1])
        let ans2 = largestRectangleArea([2,1,5,6,2,3])
//        let ans3 = largestRectangleArea([0,9])
        
        print(ans2)
    }

    
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
    /**
     94. 二叉树的中序遍历
     给定一个二叉树的根节点 root ，返回它的 中序 遍历。
     */
    func testinorderTraversal(){
        func inorderTraversal(_ root: TreeNode?) -> [Int] {
            var ans:[Int] = []
            func dfs(_ node:TreeNode?){
                guard let node = node else {
                    return
                }
                dfs(node.left)
                ans.append(node.val)
                dfs(node.right)
            }
            dfs(root)
            return ans
        }
    }
    
    
    
    /**
     96. 不同的二叉搜索树
     给定一个整数 n，求以 1 ... n 为节点组成的二叉搜索树有多少种？
     */
    func testnumtrees(){
        func numTrees(_ n: Int) -> Int {
            var dp = Array(repeating: 0, count: n + 1)
            dp[1] = 1
            dp[0] = 1
            if n > 1 {
                for i in 2...n {
                    let s = i - 1
                    var count = 0
                    for j in 0..<i {
                        count += (dp[j] * dp[s - j])
                    }
                    dp[i] = count
                }
            }
            return dp[n]
        }
        let ans = numTrees(1)
        print(ans)
    }
    /**
     98. 验证二叉搜索树
     给定一个二叉树，判断其是否是一个有效的二叉搜索树。

     假设一个二叉搜索树具有如下特征：

     节点的左子树只包含小于当前节点的数。
     节点的右子树只包含大于当前节点的数。
     所有左子树和右子树自身必须也是二叉搜索树。
     */
    func testisValidBST(){
        func isValidBST(_ root: TreeNode?) -> Bool {
//            guard let node = root else {
//                return true
//            }
//            var leftisValidBST = true
//            var rightisValiBST = true
//            if let left = node.left{
//                leftisValidBST = node.val > left.val && isValidBST(left)
//            }
//            if let right = node.right{
//                rightisValiBST = node.val < right.val && isValidBST(right)
//            }
//            return leftisValidBST && rightisValiBST
            var lastNum = Int.min
            func dfs(_ node:TreeNode?) -> Bool{
                guard let node = node else {
                    return true
                }
                guard dfs(node.left) else{
                    return false
                }
                if node.val <= lastNum {
                    return false
                }
                lastNum = node.val
                let isRight = dfs(node.right)
                return isRight
            }
            return dfs(root)
        }
    }

    /**
     102. 二叉树的层序遍历
     给你一个二叉树，请你返回其按 层序遍历 得到的节点值。 （即逐层地，从左到右访问所有节点）。

      

     示例：
     二叉树：[3,9,20,null,null,15,7],
     返回其层序遍历结果：

     [
       [3],
       [9,20],
       [15,7]
     ]
     */
    func testlevelOrder(){
        func levelOrder(_ root: TreeNode?) -> [[Int]] {
//            var ans:[Int:[Int]] = [:]
//            func dfs(_ root: TreeNode?,_ index:Int){
//                guard let node = root else {
//                    return
//                }
//                var list:[Int] = []
//                if ans.keys.contains(index){
//                    list = ans[index]!
//                }
//                list.append(node.val)
//                ans[index] = list
//                dfs(node.left, index + 1)
//                dfs(node.right, index + 1)
//            }
//
//            dfs(root, 0)
//            return ans.sorted { (value1, value2) -> Bool in
//                return value1.key < value2.key
//            }.map { (value) -> [Int] in
//                return value.value
//            }
            var ans:[[Int]] = []
            func bfs(_ root:TreeNode){
                var queue:[TreeNode] = []
                queue.append(root)
                while !queue.isEmpty {
                    let size = queue.count
                    var levelorder:[Int] = []
                    for i in 0..<size {
                        let node = queue.removeFirst()
                        levelorder.append(node.val)
                        if let left = node.left{
                            queue.append(left)
                        }
                        if let right = node.right{
                            queue.append(right)
                        }
                    }
                    ans.append(levelorder)
                    
                }
            }
            if let node = root {
                bfs(node)
            }
            
            return ans
        }
    }
    
    /**
     105. 从前序与中序遍历序列构造二叉树
     根据一棵树的前序遍历与中序遍历构造二叉树。

     注意:
     你可以假设树中没有重复的元素。

     例如，给出

     前序遍历 preorder = [3,9,20,15,7]
     中序遍历 inorder = [9,3,15,20,7]
     返回如下的二叉树：
     */
    func testbuildTree(){
        func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
            
            func findIndexInorder(_ val:Int) -> Int{
                return inorder.firstIndex(of: val)!
            }
            
            func helper(_ perorderStart:Int,_ perorderEnd:Int,_ inorderStart:Int,_ inorderEnd:Int) -> TreeNode?{
                if perorderStart >= perorderEnd {
                    return nil
                }
                if inorderStart >=  inorderEnd{
                    return nil
                }
                let node = TreeNode(preorder[perorderStart])
                let index = findIndexInorder(preorder[perorderStart])
                node.left = helper(perorderStart + 1, perorderStart + 1 + index - inorderStart, inorderStart, index)
                node.right = helper(perorderStart + 1 + index - inorderStart, perorderEnd, index + 1, inorderEnd)
                
                return node
            }
            
            return helper(0, preorder.count , 0, inorder.count)
        }
    }
    
    /**
     106. 从中序与后序遍历序列构造二叉树
     根据一棵树的中序遍历与后序遍历构造二叉树。

     注意:
     你可以假设树中没有重复的元素。

     例如，给出

     中序遍历 inorder = [9,3,15,20,7]
     后序遍历 postorder = [9,15,7,20,3]
     */
    func testbuildTree2(){
        
        func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
            func findIndexInorder(_ val:Int) -> Int{
                return inorder.firstIndex(of: val)!
            }
            func helper(_ postorderStart:Int,_ postorderEnd:Int,_ inorderStart:Int,_ inorderEnd:Int) -> TreeNode?{
                if postorderStart >  postorderEnd || inorderStart > inorderEnd{
                    return nil
                }
                if postorderStart == postorderEnd {
                    return TreeNode(postorder[postorderEnd])
                }
                if inorderStart ==  inorderEnd{
                    return TreeNode(inorder[inorderEnd])
                }
                let node = TreeNode(postorder[postorderEnd])
                let index = findIndexInorder(postorder[postorderEnd])
                let leftinorderSize = index - inorderStart
                node.left = helper(postorderStart,postorderStart + leftinorderSize - 1, inorderStart, index - 1)
                node.right = helper(postorderStart + leftinorderSize ,postorderEnd - 1, index + 1, inorderEnd)
                
                return node
            }
            
            return helper(0, postorder.count - 1 , 0, inorder.count - 1)
        }
    }
    
    /**
     114. 二叉树展开为链表
     给定一个二叉树，原地将它展开为一个单链表。

      

     例如，给定二叉树

         1
        / \
       2   5
      / \   \
     3   4   6
     将其展开为：

     1
      \
       2
        \
         3
          \
           4
            \
             5
              \
               6
     */
    func testflatten(){
        //前序？
        func flatten(_ root: TreeNode?) {
//            func dfs(_ root: TreeNode?) -> TreeNode?{
//                guard let node = root else {
//                    return nil
//                }
//                //
//                dfs(node.left)
//                dfs(node.right)
//            }
//            let right = root?.right
//            root?.right =  dfs(root?.left)
            guard let node = root else {
                return
            }
            flatten(node.left) //左边改成链接
            flatten(node.right) //右边改成链接
            let tmp = node.right
            node.right = node.left
            node.left = nil
            //找到右边最后一个节点，再拼接上tmp
            var tmpRoot:TreeNode? = node
            while tmpRoot?.right != nil {
                tmpRoot = tmpRoot?.right
            }
            tmpRoot?.right = tmp
            
            
        }
    }
    
    /**
     二叉树中的最大路径和
     给定一个非空二叉树，返回其最大路径和。

     本题中，路径被定义为一条从树中任意节点出发，沿父节点-子节点连接，达到任意节点的序列。该路径至少包含一个节点，且不一定经过根节点。

     来源：力扣（LeetCode）
     链接：https://leetcode-cn.com/problems/binary-tree-maximum-path-sum
     著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
     */
    func testmaxPathSum(){
        func maxPathSum(_ root: TreeNode?) -> Int {
            var maxSum = Int.min
            func dfs(_ root: TreeNode?) -> Int{
                guard let node = root else {
                    return 0
                }
                let left = dfs(node.left)
                let right = dfs(node.right)
                let nodeMax = node.val + left + right
                maxSum = max(maxSum, nodeMax)
                
                var nextStep = max(left, right)
                nextStep = max(0, nextStep)
                let value = node.val + nextStep
                return max(0, value)
                
            }
            dfs(root)
            return maxSum
        }
    }
    
    /**
     128. 最长连续序列
     给定一个未排序的整数数组 nums ，找出数字连续的最长序列（不要求序列元素在原数组中连续）的长度。

      

     进阶：你可以设计并实现时间复杂度为 O(n) 的解决方案吗？

      

     示例 1：

     输入：nums = [100,4,200,1,3,2]
     输出：4
     解释：最长数字连续序列是 [1, 2, 3, 4]。它的长度为 4。
     示例 2：

     输入：nums = [0,3,7,2,5,8,4,6,0,1]
     输出：9
     */
    func testlongestConsecutive(){
        func longestConsecutive(_ nums: [Int]) -> Int {
            var ans = 0
            var hashMap:[Int:Int] = [:]
            for i in 0..<nums.count {
                hashMap[nums[i]] = i
            }
            while !hashMap.isEmpty {
                let first = hashMap.keys.first!
                hashMap.removeValue(forKey: first)
                var lenght = 1
                var right = first + 1
                while hashMap.keys.contains(right) {
                    lenght += 1
                    hashMap.removeValue(forKey: right)
                    right = right + 1
                }
                var left = first - 1
                while hashMap.keys.contains(left) {
                    lenght += 1
                    hashMap.removeValue(forKey: left)
                    left = left - 1
                }
                
                ans = max(ans, lenght)
            }
            return ans
        }
        let ans = longestConsecutive([100,4,200,1,3,2])
        let ans2 = longestConsecutive([0,3,7,2,5,8,4,6,0,1])
        print(ans)
    }
    
    /**
     运用你所掌握的数据结构，设计和实现一个  LRU (最近最少使用) 缓存机制 。
     实现 LRUCache 类：

     LRUCache(int capacity) 以正整数作为容量 capacity 初始化 LRU 缓存
     int get(int key) 如果关键字 key 存在于缓存中，则返回关键字的值，否则返回 -1 。
     void put(int key, int value) 如果关键字已经存在，则变更其数据值；如果关键字不存在，则插入该组「关键字-值」。当缓存容量达到上限时，它应该在写入新数据之前删除最久未使用的数据值，从而为新的数据值留出空间。
      

     进阶：你是否可以在 O(1) 时间复杂度内完成这两种操作？

      

     示例：

     输入
     ["LRUCache", "put", "put", "get", "put", "get", "put", "get", "get", "get"]
     [[2], [1, 1], [2, 2], [1], [3, 3], [2], [4, 4], [1], [3], [4]]
     输出
     [null, null, null, 1, null, -1, null, -1, 3, 4]

     解释
     LRUCache lRUCache = new LRUCache(2);
     lRUCache.put(1, 1); // 缓存是 {1=1}
     lRUCache.put(2, 2); // 缓存是 {1=1, 2=2}
     lRUCache.get(1);    // 返回 1
     lRUCache.put(3, 3); // 该操作会使得关键字 2 作废，缓存是 {1=1, 3=3}
     lRUCache.get(2);    // 返回 -1 (未找到)
     lRUCache.put(4, 4); // 该操作会使得关键字 1 作废，缓存是 {4=4, 3=3}
     lRUCache.get(1);    // 返回 -1 (未找到)
     lRUCache.get(3);    // 返回 3
     lRUCache.get(4);    // 返回 4

     来源：力扣（LeetCode）
     链接：https://leetcode-cn.com/problems/lru-cache
     著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
     */
    class DLinkedNode: NSObject {
        let key: Int
        var val: Int
        var prior: DLinkedNode?
        var next: DLinkedNode?
        
        init(_ key: Int, value: Int) {
           self.key = key
            val = value
        }
        // 辅助调试 debug, 打印出信息的，方便看
        override var description: String{
            var result = String(val)
            var point = prior
            while let bee = point{
                result = "\(bee.val) -> " + result
                point = bee.prior
            }
            point = next
            while let bee = point{
                result = result + "-> \(bee.val)"
                point = bee.next
            }
            return result
        }
    }




    class LRUCache {
        // 怎样化 O ( n ) 为 O ( 1 ). 关心的状态，都用一个专门的指针，记录了
        var dummyHead = DLinkedNode(0, value: 0)
        var dummyTail = DLinkedNode(0, value: 0)
        var capacity: Int
        var container = [Int: DLinkedNode]()
        var hasCount: Int = 0

        init(_ capacity: Int) {
            self.capacity = capacity
              // 建立结构
              dummyHead.next = dummyTail
              dummyTail.prior = dummyHead
        }
        
        func get(_ key: Int) -> Int {
            // 有一个刷新机制
            if let node = container[key]{
                deleteNode(node)
                insertHead(node)
                return node.val
            }
            else{
                return -1
            }
        }
        
        func put(_ key: Int, _ value: Int) {
            if let node = container[key]{
                // 包含，就换顺序
                // 还有一个更新操作
                node.val = value
                deleteNode(node)
                insertHead(node)
            }
            else{
                if hasCount >= capacity{
                    // 超过，就处理
                    hasCount -= 1
                    deleteTail()
                }
                hasCount += 1
                // 不包含，就插入头节点
                let node = DLinkedNode(key, value: value)
                insertHead(node)
                container[key] = node
            }
        }
        
        func insertHead(_ node: DLinkedNode){
            let former = dummyHead.next
            former?.prior = node
            dummyHead.next = node
            node.prior = dummyHead
            node.next = former
        }
        
        // 指针操作，最好还是弄个变量，接一下
        func deleteNode(_ node: DLinkedNode){
            node.prior?.next = node.next
            node.next?.prior = node.prior
            node.prior = nil
            node.next = nil
        }
        
        func deleteTail(){
            if let toDel = dummyTail.prior{
                toDel.prior?.next = dummyTail
                dummyTail.prior = toDel.prior
                container.removeValue(forKey: toDel.key)
            }
        }
    }
    /*
     给你一个整数数组 nums ，请你找出数组中乘积最大的连续子数组（该子数组中至少包含一个数字），并返回该子数组所对应的乘积。

      

     示例 1:

     输入: [2,3,-2,4]
     输出: 6
     解释: 子数组 [2,3] 有最大乘积 6。
     示例 2:

     输入: [-2,0,-1]
     输出: 0
     解释: 结果不能为 2, 因为 [-2,-1] 不是子数组。

     来源：力扣（LeetCode）
     链接：https://leetcode-cn.com/problems/maximum-product-subarray
     著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
     */
    func testmaxProduct(){
        func maxProduct(_ nums: [Int]) -> Int {
            if nums.count == 1 {
                return nums[0]
            }
            var maxdp = Array(nums)
            var mindp = Array(nums)
            var maxnum = nums[0]
            for i in 1..<nums.count {
                if nums[i - 1] == 0 {
                    maxnum = max(maxnum, maxdp[i])
                }else{
                    let num = nums[i]
                    if num == 0{
                        //do nothing
                    }else if num > 0 {
                        let maxidp = maxdp[i - 1]
                        let minidp = mindp[i - 1]
                        maxdp[i] = max(num * maxidp,num)
                        mindp[i] = min(num * minidp,num)
                    }else{
                        let maxidp = maxdp[i - 1]
                        let minidp = mindp[i - 1]
                        maxdp[i] = max(num * minidp,num)
                        mindp[i] = min(num * maxidp,num)
                    }
                    
                    maxnum = max(maxnum, maxdp[i])
                }
            }
            return maxnum
        }
        let ans = maxProduct([2,3,-2,4])
        let ans2 = maxProduct([-2,0,-1])
        let ans3 = maxProduct([-2,1,1,1,1,-10])
        let ans4 = maxProduct([0,2])
        let ans5 = maxProduct([3,-1,4])
        print(ans4)
    }

}
