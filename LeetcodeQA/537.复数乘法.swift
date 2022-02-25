/*
 * @lc app=leetcode.cn id=537 lang=swift
 *
 * [537] 复数乘法
 */

// @lc code=start
class Solution {
    func complexNumberMultiply(_ num1: String, _ num2: String) -> String {
        func numberMultiply(_ num: String) -> (Int,Int){
            let numSplite =  num.split(separator: "+")
            let realNumber = Int(numSplite[0])!
            let imaginarynumber = Int(numSplite[1].replacingOccurrences(of: "i", with: ""))!
            return (realNumber,imaginarynumber)
        }
        let left = numberMultiply(num1)
        let right = numberMultiply(num2)
        let realNumber = left.0 * right.0 - left.1 * right.1
        let imaginarynumber = left.0 * right.1 + left.1 * right.0
        return "\(realNumber)+\(imaginarynumber)i"
    }
}
// @lc code=end

