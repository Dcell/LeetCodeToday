/*
 * @lc app=leetcode.cn id=1005 lang=swift
 *
 * [1005] K 次取反后最大化的数组和
 */

// @lc code=start
class Solution {
    func largestSumAfterKNegations(_ nums: [Int], _ k: Int) -> Int {
        var sortNums = nums.sorted()
        for i in 0..<k {
            sortNums[0] = -sortNums[0]
            sortNums = sortNums.sorted()
        }
        return sortNums.reduce(0) { partialResult, value in
            return partialResult + value
        }
    }
}
// @lc code=end

