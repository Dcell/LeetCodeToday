/*
 * @lc app=leetcode.cn id=859 lang=swift
 *
 * [859] 亲密字符串
 */

// @lc code=start
class Solution {
    func buddyStrings(_ s: String, _ goal: String) -> Bool {
        if s.count != goal.count {
            return false
        }
        let sArray = Array(s)
        let goalArray = Array(goal)
        var changeHash:[Character] = []
        var change2Hash:[Character] = []
        var hashSet:Set<Character> = []
        var isFormat =  false
        for i in 0..<s.count{
            if sArray[i] != goalArray[i] {
                changeHash.append(sArray[i])
                change2Hash.append(goalArray[i])
            }
            if (hashSet.contains(sArray[i])){
                isFormat = true
            }else{
                hashSet.insert(sArray[i])
            }
        }
        if changeHash.isEmpty {
            return isFormat
        }
        if changeHash.count != 2{
            return false
        }
        return changeHash[0] == change2Hash[1] && changeHash[1] == change2Hash[0]
    }
}

// @lc code=end

