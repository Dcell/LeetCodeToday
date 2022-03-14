/*
 * @lc app=leetcode.cn id=599 lang=swift
 *
 * [599] 两个列表的最小索引总和
 */

// @lc code=start
class Solution {
    func findRestaurant(_ list1: [String], _ list2: [String]) -> [String] {
        var ans:[String] = []
        var restaurantSet:[String:Int] = [:]
        for item in list1.enumerated() {
            restaurantSet[item.element] = item.offset
        }
        var minIndex = Int.max
        for item in list2.enumerated() {
            if let list1index = restaurantSet[item.element] {
                let indexSun = list1index + item.offset
                if indexSun < minIndex{
                    ans.removeAll()
                    ans.append(item.element)
                    minIndex = indexSun
                }else if indexSun == minIndex{
                    ans.append(item.element)
                }
            }
        }
        return ans
    }
}

// @lc code=end

