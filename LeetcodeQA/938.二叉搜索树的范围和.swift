/*
 * @lc app=leetcode.cn id=938 lang=swift
 *
 * [938] 二叉搜索树的范围和
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
    func rangeSumBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> Int {
        guard let root = root else {
            return 0
        }
        let val = root.val
        if val < low {
            return rangeSumBST(root.right,low,high)
        }else if val > high {
            return rangeSumBST(root.left,low,high)
        }else {
            return val + rangeSumBST(root.right,low,high) + rangeSumBST(root.left,low,high)
        }
    }
}
// @lc code=end

