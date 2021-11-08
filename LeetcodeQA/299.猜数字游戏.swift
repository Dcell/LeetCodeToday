/*
 * @lc app=leetcode.cn id=299 lang=swift
 *
 * [299] 猜数字游戏
 */

// @lc code=start
class Solution {
    func getHint(_ secret: String, _ guess: String) -> String {
        var secretArray =  Array(secret)
        var guessArray = Array(guess)
        var secretHastMap:[Character:Int] = [:]
        var guessHastMap:[Character:Int] = [:]
        var aacount = 0
        for i in 0..<secretArray.count {
            if secretArray[i] == guessArray[i] {
                aacount += 1
            }else{
                let s = secretArray[i]
                if secretHastMap.keys.contains(s) {
                    secretHastMap[s] = secretHastMap[s]! + 1
                }else{
                    secretHastMap[s] = 1
                }
                
                let g = guessArray[i]
                if guessHastMap.keys.contains(g) {
                    guessHastMap[g] = guessHastMap[g]! + 1
                }else{
                    guessHastMap[g] = 1
                }
            }
        }
        var bcount = 0
        for item in guessHastMap {
            if secretHastMap.keys.contains(item.key) {
                let gcount = guessHastMap[item.key]!
                let scount = secretHastMap[item.key]!
                bcount += min(gcount, scount)
            }
        }
        
        return "\(aacount)A\(bcount)B"
    }
}
// @lc code=end

