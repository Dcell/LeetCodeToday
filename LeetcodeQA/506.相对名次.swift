/*
 * @lc app=leetcode.cn id=506 lang=swift
 *
 * [506] 相对名次
 */

// @lc code=start
class Solution {
    func findRelativeRanks(_ score: [Int]) -> [String] {
        var hashMap:[Int:Int] = [:]
        var ans:[String] = Array(repeating: "", count: score.count)
        for item in score.enumerated() {
            hashMap[item.element] = item.offset
        }
        
        let sortScore = score.sorted { lv, rv in
            return lv > rv
        }
        for item in sortScore.enumerated() {
            let i =  item.offset
            if i == 0{
                ans[hashMap[item.element]!] = "Gold Medal"
            }else if i == 1{
                ans[hashMap[item.element]!] = "Silver Medal"
            }else if i == 2{
                ans[hashMap[item.element]!] = "Bronze Medal"
            }else{
                ans[hashMap[item.element]!] = "\(i + 1)"
            }
        }
        return ans
    }
}
// @lc code=end

