/*
 * @lc app=leetcode.cn id=153 lang=swift
 *
 * [153] 寻找旋转排序数组中的最小值
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
            mid = (right - left) / 2 + left
            if nums[right] > nums[mid] {
                right = mid
            }else{
                left = mid + 1
            }
        }
        return nums[left]
    }
}
// @lc code=end

let s = Solution()
print(s.findMin([3,4,5,1,2]) == 1)
print(s.findMin([2,1]) == 1)
