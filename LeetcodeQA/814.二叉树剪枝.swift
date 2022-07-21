/*
 * @lc app=leetcode.cn id=814 lang=swift
 *
 * [814] 二叉树剪枝
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
    func pruneTree(_ root: TreeNode?) -> TreeNode? {
        if root == nil {
            return nil
        }
        root?.left = pruneTree(root?.left)
        root?.right = pruneTree(root?.right)
        if root?.left == nil && root?.right == nil && root?.val == 0 {
            return nil
        }
        return root
    }
}
// @lc code=end

