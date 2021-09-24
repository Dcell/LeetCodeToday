/*
 * @lc app=leetcode.cn id=342 lang=swift
 *
 * [342] 4的幂
 */

// @lc code=start
class Solution {
    func isPowerOfFour(_ n: Int) -> Bool {
        var ans = false
        var _n:Float80 = 0
        while  Int(powl(4,_n)) < n{
            _n += 1
        }
        return Int(powl(4,_n)) == n
    }
}
// @lc code=end

