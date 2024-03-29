/*
 * @lc app=leetcode.cn id=397 lang=swift
 *
 * [397] 整数替换
 */

// @lc code=start
class Solution {
    var hashMap:[Int:Int] = [:]
    
    init() {
        for i in 0..<31 {
            hashMap[1<<i] = i
        }
    }
    
    func integerReplacement(_ n: Int) -> Int {
        print(n)
        if self.hashMap.keys.contains(n) {
            return self.hashMap[n]!
        }
        var ans = 0
        if n%2 == 0 {
            ans = integerReplacement(n/2) + 1
        }else{
            ans = min(integerReplacement(n-1),integerReplacement((n + 1)/2) + 1)+1
        }
        hashMap[n] = ans
        return ans
    }
}
// @lc code=end

