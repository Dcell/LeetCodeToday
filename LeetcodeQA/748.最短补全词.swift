/*
 * @lc app=leetcode.cn id=748 lang=swift
 *
 * [748] 最短补全词
 */

// @lc code=start
class Solution {
    func shortestCompletingWord(_ licensePlate: String, _ words: [String]) -> String {
        var licensePlateArray = Array(licensePlate.lowercased())
        licensePlateArray = licensePlateArray.filter { char in
            return CharacterSet.letters.contains(char.unicodeScalars.first!)
        }
        var ans = "1111111111111111111111111111111111111111"
        for i in 0..<words.count {
            var chars = Array(words[i].lowercased())
            var tmp = licensePlateArray
            while tmp.count != 0 {
                if let index =  chars.firstIndex(of: tmp.first!){
                    chars.remove(at: index)
                    tmp.remove(at: 0)
                }else{
                    break
                }
            }
            if tmp.isEmpty {
                if(words[i].count < ans.count){
                    ans = words[i]
                }
            }
        }
        
        return ans
    }
}
// @lc code=end

