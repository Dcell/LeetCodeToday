/*
 * @lc app=leetcode.cn id=1720 lang=swift
 *
 * [1720] 解码异或后的数组
 */

// @lc code=start
class Solution {
    func decode(_ encoded: [Int], _ first: Int) -> [Int] {
        var ans = Array(repeating: 0, count: encoded.count + 1)
        ans[0] =  first
        for i in 0..<encoded.count {
            ans[i + 1] =  encoded[i] ^ ans[i]
        }
        return ans
    }
}
// @lc code=end

