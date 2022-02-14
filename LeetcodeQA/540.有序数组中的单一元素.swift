/*
 * @lc app=leetcode.cn id=540 lang=swift
 *
 * [540] 有序数组中的单一元素
 */

// @lc code=start
class Solution {
    func singleNonDuplicate(_ nums: [Int]) -> Int {
        var left = 0
        var right = nums.count - 1
        while(left < right){
            let mid = (left + right) >> 1
            if mid == 0 || mid == nums.count - 1 {
                return nums[mid]
            }
            if (mid%2 == 1 && nums[mid] != nums[mid - 1]) || (mid%2 == 0 && nums[mid] != nums[mid + 1])  {
                right = mid
            }else{
                left =  mid + 1
            }
        }
        return nums[left]
    }
}
// @lc code=end

