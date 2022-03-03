/*
 * @lc app=leetcode.cn id=258 lang=swift
 *
 * [258] 各位相加
 */

// @lc code=start
class Solution {
    func addDigits(_ num: Int) -> Int {
        return num < 9 ? num : (num%9 == 0 ? 9 : num%9)
    }
}
// @lc code=end

