/*
 * @lc app=leetcode.cn id=993 lang=swift
 *
 * [993] 二叉树的堂兄弟节点
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

    func isCousins(_ root: TreeNode?, _ x: Int, _ y: Int) -> Bool {
        func dfs(_ root: TreeNode?, _ depth: Int, _ val: Int, _ parent: Int) -> (Int, Int)? {
            guard let _ = root else { return nil }
            if val == root?.val { return (depth, parent) }

            return dfs(root!.left, depth + 1, val, root!.val) ?? dfs(root!.right, depth + 1, val, root!.val)
            
        }

        let x_res = dfs(root, 0, x, 0)!
        let y_res = dfs(root, 0, y, 0)!
        return (x_res.0 == y_res.0) && (x_res.1 != y_res.1)
    }
}
// @lc code=end

