/*
 * @lc app=leetcode.cn id=326 lang=swift
 *
 * [326] 3的幂
 */

// @lc code=start
class Solution {
    func isPowerOfThree(_ n: Int) -> Bool {
        if n == 0{
            return false
        }
        var n = n
        while n % 3 == 0{
            n = n/3
        }
        return n == 1
    }
}
// @lc code=end

