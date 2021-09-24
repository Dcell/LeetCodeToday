/*
 * @lc app=leetcode.cn id=77 lang=swift
 *
 * [77] 组合
 */

// @lc code=start
class Solution {
    var k = 0
    var num = 0
    var ans:[[Int]] = []
    func dfs(_ nums:[Int],_ index:Int){
        if index >= num {
            return
        }
        var nums = nums
        nums.append(index + 1)
        if nums.count == k {
            ans.append(nums)
            return
        }
        for i in index+1...num {
            dfs(nums,i)
        }
    }

    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        self.num = n
        self.k = k
        for i in 0...n {
            dfs([], i)
        }
        return ans
    }
}
// @lc code=end
let s = Solution()
print(s.combine(4, 2))
