/*
 * @lc app=leetcode.cn id=1011 lang=swift
 *
 * [1011] 在 D 天内送达包裹的能力
 */

// @lc code=start
class Solution {
    func shipWithinDays(_ weights: [Int], _ D: Int) -> Int {
        var maxWeight = 0
        var sum = 0
        for item in weights {
            sum += item
            maxWeight = max(maxWeight,item)
        }
        var l = maxWeight
        var r = sum

        while l < r {
            let mid = l + (r - l)/2
            if check(weights,D,mid) {
                r = mid
            }else{
                l = mid + 1
            }
        }
        return l
    }

    func check(_ weights: [Int], _ D: Int, _ W:Int) -> Bool{
        var days = 1
        var curCount = 0
        for i in 0..<weights.count {
            if curCount + weights[i] > W {
                curCount = 0
                days += 1
            }
            curCount += weights[i]
        }
        return days <= D
    }
}
// @lc code=end
let s = Solution()
s.shipWithinDays([1,2,3,4,5,6,7,8,9,10],5)

