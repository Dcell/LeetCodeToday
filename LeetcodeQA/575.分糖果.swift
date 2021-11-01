/*
 * @lc app=leetcode.cn id=575 lang=swift
 *
 * [575] 分糖果
 */

// @lc code=start
class Solution {
    func distributeCandies(_ candyType: [Int]) -> Int {
        var x:Set<Int> = []
        var y:[Int] = []
        for item in candyType {
            if !x.contains(item) {
                x.insert(item)
            }else{
                y.append(item)
            }
        }
        if y.count < candyType.count/2 {
            return x.count - (candyType.count/2 - y.count)
        }
        return x.count
    }
}
// @lc code=end

