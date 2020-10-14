 import UIKit
 
public class TreeNode {
  public var val: Int
  public var left: TreeNode?
  public var right: TreeNode?
  public init(_ val: Int) {
      self.val = val
      self.left = nil
      self.right = nil
  }
}
func maxDepth(_ root: TreeNode?) -> Int {
    guard let root = root else {
        return 0
    }
    if root.left == nil && root.right == nil {
        return 1
    }
    return 1 + max(maxDepth(root.left), maxDepth(root.right))
}
 
func minDepth(_ root: TreeNode?) -> Int {
    guard let root = root else {
        return 0
    }
    if root.left == nil && root.right == nil {
        return 1
    }
    if(root.left != nil && root.right != nil){
        return 1 + min(minDepth(root.left), minDepth(root.right))
    }
    return 1 + (root.left == nil ? minDepth(root.right) : minDepth(root.left))
}
 
func hasPathSum(_ root: TreeNode?, _ sum: Int) -> Bool {
 guard let root = root else {
     return false
 }
 if root.left == nil && root.right == nil {
    return root.val == sum
 }
 return hasPathSum(root.left,sum - root.val) || hasPathSum(root.right,sum - root.val)
}

 
 func levelOrderBottom2(_ result: inout [[Int]] , _ nodes: [TreeNode]){
    if nodes.count == 0 {
        return
    }
    var clevel:[Int] = []
    var nextNodes:[TreeNode] = []
    nodes.forEach { (node) in
        clevel.append(node.val)
        if let left = node.left{
            nextNodes.append(left)
        }
        if let right = node.right{
            nextNodes.append(right)
        }
    }
    if clevel.count != 0 {
        result.append(clevel)
    }
    levelOrderBottom2(&result,nextNodes)
 }
 
 
 func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
    var result:[[Int]] = []
    if let root = root {
        levelOrderBottom2( &result,[root])
    }
    return result.reversed()
 }
 

// func isBalanced(_ root: TreeNode?) -> Bool {
//    guard let root = root else {
//        return true
//    }
//    let ab =  abs(maxDepth(root.left) - maxDepth(root.right))
//    return ab <= 1 && maxDepth(root.left) && maxDepth(root.right)
// }
 
 
 func generate(_ numRows: Int) -> [[Int]] {
    var result:[[Int]] = []
    for i in 0..<numRows {
        var parentrow:[Int]? = nil
        let parentrowIndex = i - 1
        if(parentrowIndex >= 0){//找到父类列表
            parentrow = result[parentrowIndex]
        }
        var rows:[Int] = []//当前列表
        for j in 0...i {
            if let parentrow = parentrow {
                let parentrowleft = j - 1
                let parentrowRight = j
                if(parentrowleft >= 0 && parentrowRight < parentrow.count){
                    rows.append(parentrow[parentrowleft] + parentrow[parentrowRight] )
                }else{
                     rows.append(1)
                }
            }else{
                rows.append(1)
            }
        }
        result.append(rows)
    }
     return result
 }

 func maxProfit(_ prices: [Int]) -> Int {
    if(prices.count == 0){
        return 0
    }
    var result = 0
    var buyPrice = prices[0]
    prices.forEach { (val) in
        if(val < buyPrice){
            buyPrice = val
        }else{
            result = max(result, val - buyPrice)
        }
    }
    return result
 }
 
 func maxProfit2(_ prices: [Int]) -> Int {
     if(prices.count == 0){
         return 0
     }
    var result = 0
    var buyPrice = prices[0]
    prices.forEach { (val) in
        if(val > buyPrice){
            result += (val - buyPrice)
            buyPrice = val
        }else{
            buyPrice = val
        }
    }
    
    return result
    
 }

 
 func isPalindrome(_ s: String) -> Bool {
    var clearString = s
  // - 1、创建规则
  let pattern = "[^a-z0-9]"
  // - 2、创建正则表达式对象
  let regex = try? NSRegularExpression(pattern: pattern, options: NSRegularExpression.Options.caseInsensitive)
  
  // - 3、正则替换
  clearString = regex!.stringByReplacingMatches(in: clearString, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, clearString.count), withTemplate: "")
    
    clearString = clearString.replacingOccurrences(of: " ", with: "")
    print(clearString)
    clearString = clearString.trimmingCharacters(in: .whitespaces)
    print(clearString)
    clearString = clearString.lowercased()
    print(clearString)
    return clearString ==  String(clearString.reversed())
 }

 
 func singleNumber(_ nums: [Int]) -> Int {
    var result = 0
    nums.forEach { (rh) in
        result = result^rh
    }
    return result
 }
 
 public class ListNode{
  public var val: Int
  public var next: ListNode?
  public init(_ val: Int) {
      self.val = val
      self.next = nil
  }
}
 
 
 func hasCycle(_ head: ListNode?) -> Bool {
    guard let head = head else {
        return false
    }
    var slow:ListNode? = head
    var fast:ListNode? = head.next
    //快慢指针
    while slow != nil && fast != nil{
        guard let slow1 = slow else {
            return false
        }
        guard let fast1 = fast else {
            return false
        }
        if(slow1 === fast1){
            return true
        }
        slow = slow1.next
        fast = fast1.next?.next
    }
     return false
 }

 
 class MinStack {
    
    var stackList:[Int]
    var minStackList:[Int]

     /** initialize your data structure here. */
     init() {
        stackList = []
        minStackList = []
     }
     
     func push(_ x: Int) {
        stackList.append(x)
        if let lastMin = minStackList.last{
            minStackList.append( min(x, lastMin))
        }else{
            minStackList.append(x)
        }
     }
     
     func pop() {
         stackList.removeLast()
        minStackList.removeLast()
     }
     
     func top() -> Int {
        return stackList.last!
     }
     
     func getMin() -> Int {
        return minStackList.last!
     }
 }
 
 
 func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
    guard let headA = headA else {
        return nil
    }
    guard let headB = headB else {
        return nil
    }
    var stepA:ListNode? = headA
    var stepB:ListNode? = headB
    
    var hasbridgingA =  false
    var hasbridgingB =  false
    
    while stepA != nil && stepB != nil {
        if(stepA === stepB){
            return stepA
        }
        stepA = stepA?.next
        stepB = stepB?.next
        if(stepA == nil && !hasbridgingA){
            stepA = headB
            hasbridgingA = true
        }
        if(stepB == nil && !hasbridgingB){
            stepB = headA
            hasbridgingB = true
        }
    }
    
    return nil
    
 }
 
 
 func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
    var index1 = 0
    var index2 = numbers.count - 1
    while (numbers[index1] + numbers[index2]) != target {
        if(target > (numbers[index1] + numbers[index2]) ){
            index1 += 1
        }else{
            index2 -= 1
        }
    }
    return [index1 + 1,index2 + 1]
 }
 
 //10进制 转 自定义进制
 func convertToTitle(_ n: Int) -> String {
    let word = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    let scale =  word.count
    var result = ""
    var fromNumber = n
    while fromNumber > 0 {
        //如果是整数，则需要特殊处理，因为没有0
        fromNumber -= 1 //神操作
        
        result = word[fromNumber%scale] + result
        fromNumber = fromNumber/scale
    }
    return result
 }

 
 func majorityElement(_ nums: [Int]) -> Int {
    var element:Int? = nums[0]
    var count:Int = 0
    nums.forEach { (num) in
        if let _element = element{
            if(num == _element){
                count += 1
            }else{
                count -= 1
            }
        }else{
            element = num
            count += 1
        }
        if(count == 0){
            element = nil
        }
    }
     return element!
 }
// majorityElement([3,2,3])

 
// 给出两个 非空 的链表用来表示两个非负的整数。其中，它们各自的位数是按照 逆序 的方式存储的，并且它们的每个节点只能存储 一位 数字。
//
// 如果，我们将这两个数相加起来，则会返回一个新的链表来表示它们的和。
//
// 您可以假设除了数字 0 之外，这两个数都不会以 0 开头。
//
// 示例：
//
// 输入：(2 -> 4 -> 3) + (5 -> 6 -> 4)
// 输出：7 -> 0 -> 8
// 原因：342 + 465 = 807
//
// 来源：力扣（LeetCode）
// 链接：https://leetcode-cn.com/problems/add-two-numbers
// 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 class Solution {
     func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var l1 = l1
        var l2 = l2
        var carry = 0
        var sunListNode = ListNode(0)
        var tmpNode = ListNode(0)
        sunListNode.next = tmpNode
        while l1?.val != nil || l2?.val != nil {
            print(l1?.val)
            print(l2?.val)
            print("--------")
            let l1v = l1?.val ?? 0
            let l2v = l2?.val ?? 0
            let sun  = l1v + l2v + carry
            print(sun)
            carry = sun/10
            let listNode = ListNode(sun%10)
            tmpNode.next =  listNode
            tmpNode = listNode
            
            l1 = l1?.next
            l2 = l2?.next
        }
        if(carry > 0){
            tmpNode.next =  ListNode(carry)
        }
        return sunListNode.next?.next
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
     var start  = 0
     var end  = 1
     var longestLenght = 0
     var tmpList = [s.first!]
    var tmpHash:[] = [:]
    tmpHash[s.first!] = 1
     while end < s.count {
         
//            s[end]
         end = end + 1
     }
     
     return longestLenght
  }
