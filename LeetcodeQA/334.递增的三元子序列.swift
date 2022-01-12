/*
 * @lc app=leetcode.cn id=334 lang=swift
 *
 * [334] 递增的三元子序列
 */

// @lc code=start
class Solution {
    func increasingTriplet(_ nums: [Int]) -> Bool {
        var i = Int.max
        var k = Int.max
        for j in nums {
            if j <= i {
                i = j
            }else if j <= k {
                k = j
            }else{
                return true
            }
        }
        
        return false
    }
}
// @lc code=end

