/*
 * @lc app=leetcode.cn id=1518 lang=swift
 *
 * [1518] 换酒问题
 */

// @lc code=start
class Solution {
    func numWaterBottles(_ numBottles: Int, _ numExchange: Int) -> Int {
        var ans = numBottles
        var surplusBottles = numBottles //空瓶
        while surplusBottles >= numExchange{
            let newBottles = surplusBottles/numExchange
            ans += newBottles
            surplusBottles = surplusBottles%numExchange + newBottles
        }
        return ans
    }
}
// @lc code=end

