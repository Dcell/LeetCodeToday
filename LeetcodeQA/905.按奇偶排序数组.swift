/*
 * @lc app=leetcode.cn id=905 lang=swift
 *
 * [905] 按奇偶排序数组
 */

// @lc code=start
class Solution {
    func sortArrayByParity(_ nums: [Int]) -> [Int] {
        var ans:[Int] = Array(repeating: 0, count: nums.count)
        var left = 0
        var right = nums.count - 1
        for num in nums{
            if num % 2 == 0 {
                ans[left] = num
                left += 1
            }else{
                ans[right] = num
                right -= 1
            }
        }
        return ans
    }
}
// @lc code=end

