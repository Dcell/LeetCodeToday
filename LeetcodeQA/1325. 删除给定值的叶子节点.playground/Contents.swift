import UIKit

var str = "Hello, playground"


 //Definition for a binary tree node.
 public class TreeNode {
      public var val: Int
      public var left: TreeNode?
      public var right: TreeNode?
      public init() { self.val = 0; self.left = nil; self.right = nil; }
      public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
      public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
          self.val = val
          self.left = left
          self.right = right
      }
 }
 
/**
 1325. 删除给定值的叶子节点
 给你一棵以 root 为根的二叉树和一个整数 target ，请你删除所有值为 target 的 叶子节点 。

 注意，一旦删除值为 target 的叶子节点，它的父节点就可能变成叶子节点；如果新叶子节点的值恰好也是 target ，那么这个节点也应该被删除。

 也就是说，你需要重复此过程直到不能继续删除。
 */


/**
 解题思路，如果删除后原来的父亲节点 也满足条件也需要删除，明显就是用后序遍历
 */
class Solution {
    func removeLeafNodes(_ root: TreeNode?, _ target: Int) -> TreeNode? {
        guard let node = root else {
            return nil
        }
        let left =  removeLeafNodes(node.left, target)
        let right = removeLeafNodes(node.right, target)
        if left == nil && right == nil && node.val == target {
            return nil
        }
        node.left = left
        node.right = right
        return root
    }
}
