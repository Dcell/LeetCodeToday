/*
 * @lc app=leetcode.cn id=525 lang=swift
 *
 * [525] 连续数组
 */

// @lc code=start
class Solution {
    func findMaxLength(_ nums: [Int]) -> Int {
        var ans = 0
        var sum = 0
        var sumhash:[Int:Int] = [:]
        sumhash[0] = -1
        for i in 0..<nums.count {
            if nums[i] == 0 {
                sum -= 1
            }else{
                sum += 1
            }
            if sumhash[sum] == nil {
                sumhash[sum] = i
            }else{
                ans = max(ans,i - sumhash[sum]!)
            }
        }
        return ans
    }
}
// @lc code=end

