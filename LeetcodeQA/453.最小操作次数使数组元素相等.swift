/*
 * @lc app=leetcode.cn id=453 lang=swift
 *
 * [453] 最小操作次数使数组元素相等
 */

// @lc code=start
class Solution {
    func minMoves(_ nums: [Int]) -> Int {
        var minNumber = nums[0]
        var moveNumber = 0
        for item in nums.enumerated() {
            if item.element < minNumber {
                moveNumber += (item.offset * (minNumber - item.element))
                minNumber = item.element
            }else{
                moveNumber += (item.element - minNumber)
            }
        }
        return moveNumber
    }
}
// @lc code=end

