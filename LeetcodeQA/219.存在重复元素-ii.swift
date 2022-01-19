/*
 * @lc app=leetcode.cn id=219 lang=swift
 *
 * [219] 存在重复元素 II
 */

// @lc code=start
class Solution {
    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        var tmpMap:[Int:Int] = [:]
        for item in nums.enumerated() {
            if tmpMap[item.element] != nil {
                let oldIndex = tmpMap[item.element]!
                if abs(oldIndex - item.offset) <= k {
                    return true
                }
            }
            tmpMap[item.element] = item.offset
        }
        return false
    }
}
// @lc code=end

