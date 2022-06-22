/*
 * @lc app=leetcode.cn id=513 lang=swift
 *
 * [513] 找树左下角的值
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
    func findBottomLeftValue(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        var ans = 0
        var queue:[TreeNode] = []
        queue.append(root)
        while !queue.isEmpty {
            let len = queue.count
            for i in 0..<len {
                let node:TreeNode = queue.removeFirst()
                if i == 0 {
                    ans = node.val
                }
                if let leftNode =  node.left {
                    queue.append(leftNode)
                }
                if let rightNode = node.right{
                    queue.append(rightNode)
                }
            }
        }
        return ans
    }
}
// @lc code=end

