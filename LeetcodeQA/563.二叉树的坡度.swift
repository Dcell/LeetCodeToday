/*
 * @lc app=leetcode.cn id=563 lang=swift
 *
 * [563] 二叉树的坡度
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
    var sum = 0
    func findTiltAndSum(_ root: TreeNode?) -> Int{
        guard let root = root else {
            return 0
        }
        let left = findTiltAndSum(root.left)
        let right = findTiltAndSum(root.right)
        sum += abs(left - right)
        return left + right + root.val
    }
    func findTilt(_ root: TreeNode?) -> Int {
        findTiltAndSum(root)
        return sum
    }
}
// @lc code=end

