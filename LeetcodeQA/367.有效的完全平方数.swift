/*
 * @lc app=leetcode.cn id=367 lang=swift
 *
 * [367] 有效的完全平方数
 */

// @lc code=start
class Solution {
    func isPerfectSquare(_ num: Int) -> Bool {
        var minNumber:Int = 1
        var maxNumber:Int = Int(sqrt(Double(Int.max)))
        while(minNumber <= maxNumber){
            let middle = (maxNumber - minNumber)/2 + minNumber
            let _m = Double(middle)*Double(middle)
            if(_m == Double(num)){
                return true
            }
            if _m > Double(num) {
                maxNumber = middle - 1
            }else{
                minNumber = middle + 1
            }
        }
        return false
    }
}
// @lc code=end

