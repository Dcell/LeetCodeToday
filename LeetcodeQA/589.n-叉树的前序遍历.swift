/*
 * @lc app=leetcode.cn id=589 lang=swift
 *
 * [589] N 叉树的前序遍历
 */

// @lc code=start
/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var children: [Node]
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.children = []
 *     }
 * }
 */

class Solution {
    func preorder(_ root: Node?) -> [Int] {
        var ans:[Int] = []
        guard let root = root else {
            return []
        }
        ans.append(root.val)
        for node in root.children {
            let tmp = preorder(node)
            ans.append(contentsOf: tmp)
        }
        return ans
    }
}
// @lc code=end

