/*
 * @lc app=leetcode.cn id=495 lang=swift
 *
 * [495] 提莫攻击
 */

// @lc code=start
class Solution {
    func findPoisonedDuration(_ timeSeries: [Int], _ duration: Int) -> Int {
        var times = duration
        for i in 0..<timeSeries.count-1 {
            times += min(timeSeries[i+1] - timeSeries[i], duration)
        }
        return times
    }
}
// @lc code=end

