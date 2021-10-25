/*
 * @lc app=leetcode.cn id=492 lang=swift
 *
 * [492] 构造矩形
 */

// @lc code=start
class Solution {
    func constructRectangle(_ area: Int) -> [Int] {
        let s = Int(sqrt(Double(area)))
        var l = s
        var w = s
        var cArea = l * w
        while(cArea != area){
            if cArea > area {
                w -= 1
            }else{
                l += 1
            }
            cArea = l * w
        }
        return [l,w]
    }
}
// @lc code=end

