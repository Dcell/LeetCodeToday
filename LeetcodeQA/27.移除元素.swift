/*
 * @lc app=leetcode.cn id=27 lang=swift
 *
 * [27] 移除元素
 */

// @lc code=start
class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        if nums.count == 0{return 0}
        var left = 0
        var right = nums.count - 1
        while left < right {
            if nums[right] != val {
                while nums[left] != val && left < right {
                    left += 1
                }
                nums.swapAt(left, right)
            }
            right -= 1
        }
        while nums.last == val{
            nums.popLast()
        }
        return nums.count
        
    }
}
// @lc code=end
var nums:[Int] = [2], val = 3
let s = Solution()
s.removeElement(&nums, val)
