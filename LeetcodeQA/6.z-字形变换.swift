/*
 * @lc app=leetcode.cn id=6 lang=swift
 *
 * [6] Z 字形变换
 */

// @lc code=start
class Solution {
    func convertSplitString(_ s:String,_ i:Int,_ spliteCount:Int) -> String{
        let array = Array(s)
        let mid = spliteCount/2
        var ans = ""
        if i == mid && i < array.count {
            ans.append(array[i])
            return ans
        }
        if i < array.count {
            ans.append(array[i])
        }
        let right = spliteCount - i
        if right < array.count && right > mid {
            ans.append(array[right])
        }
        return ans
    }
    func convert(_ s: String, _ numRows: Int) -> String {
        if numRows == 1 {
            return s
        }
        let array = Array(s)
        var ans = ""
        let spliteCount =  numRows + numRows - 2
        let splitedivisor =  s.count/spliteCount
//        let spliteresidue =  s.count%spliteCount
        var spliteArray:[String] = []
        for i in 0..<splitedivisor {
            spliteArray.append(String(array[i*spliteCount..<(i+1)*spliteCount]))
        }
        spliteArray.append(String(array[splitedivisor*spliteCount..<s.count]))
        for i in 0..<numRows {
            for tmps in spliteArray {
                ans += self.convertSplitString(tmps, i, spliteCount)
            }
        }
        return ans
    }
}
// @lc code=end

