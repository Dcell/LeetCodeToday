/*
 * @lc app=leetcode.cn id=162 lang=swift
 *
 * [162] 寻找峰值
 */

// @lc code=start
class Solution {
    func findPeakElement(_ nums: [Int]) -> Int {
        return search(nums, 0, nums.count - 1)
    }
    
    func search(_ nums: [Int], _ l: Int, _ r: Int) -> Int {
        if l == r {
            return l
        }
        let mid = (l + r) >> 1
        if nums[mid] > nums[mid + 1] {
            return search(nums, l, mid)
        } else {
            return search(nums, mid + 1, r)
        }
    }
}
// @lc code=end

