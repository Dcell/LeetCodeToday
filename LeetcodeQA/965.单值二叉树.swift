/*
 * @lc app=leetcode.cn id=965 lang=swift
 *
 * [965] 单值二叉树
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
    func isUnivalTree(_ root: TreeNode?) -> Bool {
        guard let root = root else {
            return true
        }
        let val = root.val
        let leftval = root.left?.val ?? val
        let rightval = root.right?.val ?? val
        let isUnivalLeftTree = isUnivalTree(root.left)
        let isUnivalRightTree = isUnivalTree(root.right)
        return isUnivalLeftTree && isUnivalRightTree && (val == leftval) && (val == rightval)
    }
}
// @lc code=end

