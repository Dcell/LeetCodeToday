/*
 * @lc app=leetcode.cn id=306 lang=swift
 *
 * [306] 累加数
 */

// @lc code=start
class Solution {
    func isAdditiveNumber(_ num: String) -> Bool {
        if num.count < 3 {
            return false
        }
        let right = num.count * 2 / 3 + 1
        for i in 2...right {
            for j in 1...i {
                if check(j, i, num) {
                    return true
                }
            }
        }
        return false
    }
    func check(_ left:Int,_ right:Int,_ num:String) -> Bool{
        if left >= right {
            return false
        }
        if right >= num.count{
            return false
        }
        let numArr = Array(num)
        if numArr[left] == "0" && right - left > 1{
            return false
        }
         if numArr[0] == "0" && left > 1{
            return false
        }
        var index = right
        var first = Int64(String(numArr[0..<left]))!
        var secend = Int64(String(numArr[left..<right]))!
        while(index < num.count){
            let result = first + secend
            let resultString =  "\(result)"
            if((resultString.count + index) > num.count || String(numArr[index..<resultString.count + index]) != resultString){
                return false
            }
            first = secend
            secend = result
            index += resultString.count
        }
        return index == num.count
    }
}
// @lc code=end

