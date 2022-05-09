/*
 * @lc app=leetcode.cn id=686 lang=swift
 *
 * [686] 重复叠加字符串匹配
 */

// @lc code=start
class Solution {
    func repeatedStringMatch(_ a: String, _ b: String) -> Int {
        var repeatedCount =  b.count/a.count + (b.count%a.count == 0 ? 0 : 1)
        repeatedCount  = repeatedCount * 2
        var newA = ""
        for i in 0..<repeatedCount {
            newA += a
            if newA.contains(b) {
                return i + 1
            }
        }
        return -1
    }
}
// @lc code=end

