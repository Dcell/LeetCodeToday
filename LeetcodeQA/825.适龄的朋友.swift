/*
 * @lc app=leetcode.cn id=825 lang=swift
 *
 * [825] 适龄的朋友
 */

// @lc code=start
class Solution {
    func numFriendRequests(_ ages: [Int]) -> Int {
        var ans = 0
        let ages = ages.sorted()
        var i = 0
        var j = 0
        for k in 0..<ages.count {
            while (i < k && !check(ages[i], ages[k])){
                i+=1;
            }
                    
            if (j < k){
                j = k;
            }
               
            while (j < ages.count && check(ages[j], ages[k])){
                j+=1;
            }
            if (j > i){
                ans += j - i - 1;
            }
        }
        return ans
    }
    
    func check(_ x:Int,_ y:Int) -> Bool{
        if (y <= x/2 + 7) {return false}
        if (y > x) {return false}
        if (y > 100 && x < 100) {return false}
        return true
    }
}
// @lc code=end

