/*
 * @lc app=leetcode.cn id=1446 lang=swift
 *
 * [1446] 连续字符
 */

// @lc code=start
class Solution {
    func maxPower(_ s: String) -> Int {
        let sArray = Array(s)
        var maxP = 1
        var tmp = sArray[0]
        var tmpCount = 1
        for i in 1..<sArray.count {
            if tmp == sArray[i] {
                tmpCount += 1
                maxP = max(maxP,tmpCount)
            }else{
                maxP = max(maxP,tmpCount)
                tmpCount = 1
                tmp = sArray[i]
            }
        }
        return maxP
    }
}
// @lc code=end

