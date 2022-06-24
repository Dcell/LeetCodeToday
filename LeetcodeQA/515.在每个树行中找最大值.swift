/*
 * @lc app=leetcode.cn id=515 lang=swift
 *
 * [515] 在每个树行中找最大值
 */

// @lc code=start
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    func largestValues(_ root: TreeNode?) -> [Int] {
        var ans:[Int] = []
        guard let root = root else {
            return ans
        }
        var queue:[TreeNode] = [root]
        while !queue.isEmpty {
            let tmpQueue:[TreeNode] = Array(queue)
            queue.removeAll()
            var max = Int.min
            tmpQueue.forEach {
                if $0.val > max {
                    max = $0.val
                }
                if let left = $0.left {
                    queue.append(left)
                }
                if let right = $0.right {
                    queue.append(right)
                }
            }
            ans.append(max)
        }
        return ans
    }
}
// @lc code=end

