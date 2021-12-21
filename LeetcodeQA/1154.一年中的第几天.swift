/*
 * @lc app=leetcode.cn id=1154 lang=swift
 *
 * [1154] 一年中的第几天
 */

// @lc code=start
class Solution {
func dayOfYear(_ date: String) -> Int {
    let dateArray =  Array(date)
    let year = Int(String(dateArray[0..<4]))!
    let month = Int(String(dateArray[5..<7]))!
    let day = Int(String(dateArray[8...]))!
    var ans = day
    
    for i in 1..<month {
        if i == 1 || i == 3 || i == 5 || i == 7 || i == 8 || i == 10 || i == 12{
            ans += 31
        }
        if i == 4 || i == 6 || i == 9 || i == 11 {
            ans += 30
        }
        if i == 2 {
            if (year%4==0 && year%100 != 0) || year%400 == 0{
                ans += 29
            }else{
                ans += 28
            }
        }
    }
    
    return ans
}
}
// @lc code=end

