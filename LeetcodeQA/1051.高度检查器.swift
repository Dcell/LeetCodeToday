/*
 * @lc app=leetcode.cn id=1051 lang=swift
 *
 * [1051] 高度检查器
 */

// @lc code=start
class Solution {
    func heightChecker(_ heights: [Int]) -> Int {
        let sortHeights = heights.sorted()
        var ans = 0
        heights.enumerated().forEach {
            if heights[$0.offset] != sortHeights[$0.offset] {
                ans += 1
            }
        }
        return ans
    }
}
// @lc code=end

