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
    
    
//    数字 n 代表生成括号的对数，请你设计一个函数，用于能够生成所有可能的并且 有效的 括号组合。
//
//
//
//    示例：
//
//    输入：n = 3
//    输出：[
//           "((()))",
//           "(()())",
//           "(())()",
//           "()(())",
//           "()()()"
//         ]
//
//    来源：力扣（LeetCode）
//    链接：https://leetcode-cn.com/problems/generate-parentheses
//    著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
    func generateParenthesis(_ n: Int) -> [String] {
        return []
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
    
    func testlengthOfLongestSubstring(){
        print(letterCombinations("23"))
//        print(threeSumClosest([-1,2,1,-4],1))
//          print(threeSum([-1, 0, 1, 2, -1, -4]))
//        print(convert("PAYPALISHIRING", 4))
//        print(lengthOfLongestSubstring("au"))
//        print(lengthOfLongestSubstring(" "))
//        print(lengthOfLongestSubstring("abcabcbb"))
//
//        print(lengthOfLongestSubstring("bbbbbbb"))
    }

}
