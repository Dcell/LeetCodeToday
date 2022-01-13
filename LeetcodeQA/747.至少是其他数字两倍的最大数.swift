/*
 * @lc app=leetcode.cn id=747 lang=swift
 *
 * [747] 至少是其他数字两倍的最大数
 */

// @lc code=start
class Solution {
    func dominantIndex(_ nums: [Int]) -> Int {
        var index = -1
        var max = -1
        var secendMax = -1
        for i in 0..<nums.count {
            let value = nums[i]
            if value > max {
                index = i
                secendMax = max
                max = value
            }else if value > secendMax{
                secendMax = value
            }
        }
        if max >= secendMax * 2 {
            return index
        }
        return -1
    }
}
// @lc code=end

