/*
 * @lc app=leetcode.cn id=154 lang=swift
 *
 * [154] 寻找旋转排序数组中的最小值 II
 */

// @lc code=start
class Solution {
    func findMin(_ nums: [Int]) -> Int {
        let count = nums.count
        if count == 1 || nums[count - 1] > nums[0] {
            return nums[0]
        }
        var left = 0,right = count - 1,mid = 0
        while(right > left){
            
        }
        return nums[left]
    }
}
// @lc code=end
let s = Solution()
print(s.findMin([10,1,10,10,10]) == 1)
print(s.findMin([3,3,1,3]) == 1)
