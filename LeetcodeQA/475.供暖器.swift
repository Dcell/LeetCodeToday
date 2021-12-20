/*
 * @lc app=leetcode.cn id=475 lang=swift
 *
 * [475] 供暖器
 */

// @lc code=start
class Solution {
    func findRadius(_ houses: [Int], _ heaters: [Int]) -> Int {
        var ans = 0
        let houses = houses.sorted()
        let heaters = heaters.sorted()
        
        var index = 0
        for i in 0..<houses.count {
            let house = houses[i]
            //找到比house 大的 heater点
            while(index < heaters.count && house > heaters[index]){
                index += 1
            }
            if index == 0 {
                ans = max(ans, heaters[0] - house)
            }else if index == heaters.count{
                ans = max(ans, house - heaters[heaters.count - 1])
            }else{
                ans = max(ans, min(heaters[index] - house, house - heaters[index - 1]))
            }
        }
        return ans
    }
}
// @lc code=end

