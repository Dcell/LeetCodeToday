/*
 * @lc app=leetcode.cn id=633 lang=swift
 *
 * [633] 平方数之和
 */

// @lc code=start
class Solution {
    func judgeSquareSum(_ c: Int) -> Bool {
        let maxNum = Double(c).squareRoot()
        var left = 0
        var right = Int(maxNum)
        while left <= right {
            let val = left * left  + right * right
            if val == c {
                return true
            }
            if val < c {
                left += 1
            }else{
                right -= 1
            }
        }
        return false
    }
}
// @lc code=end

