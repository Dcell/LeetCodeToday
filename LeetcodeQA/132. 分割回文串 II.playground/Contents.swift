/**
 132. 分割回文串 II
 给你一个字符串 s，请你将 s 分割成一些子串，使每个子串都是回文。

 返回符合要求的 最少分割次数 。
 */
class Solution {
    func minCut(_ s: String) -> Int {
        let count = s.count
        
        if count <= 1{
            return 0
        }
        
        var dp = Array(0..<count)
        
        let sArray = Array(s)
        
        var checkPalindrome = Array(repeating: Array(repeating: false, count: count), count: count)
        for right in 0..<count {
            for left in 0...right {
                if sArray[left] == sArray[right] && ( right - left <= 2 || checkPalindrome[left + 1][right - 1] == true) {//0,1,2距离的都可以直接判断
                    checkPalindrome[left][right] = true
                }
            }
        }
        
        for right in 0..<count {
            if checkPalindrome[0][right] {
                dp[right] = 0
                continue
            }
            for left in 0..<right {
                if checkPalindrome[left + 1][right] {
                    dp[right] = min(dp[right], dp[left] + 1);
                }
            }
        }
        return dp[count - 1]
    }
}
