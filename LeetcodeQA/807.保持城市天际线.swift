/*
 * @lc app=leetcode.cn id=807 lang=swift
 *
 * [807] 保持城市天际线
 */

// @lc code=start
class Solution {
    func maxIncreaseKeepingSkyline(_ grid: [[Int]]) -> Int {
        let rowCount = grid[0].count
        let columnCount = grid.count
        var maxRow:[Int] = [] //每一行的最大数
        var maxColumn:[Int] = []//每一列的最大数
        
        for i in 0..<columnCount {
            maxRow.append(grid[i].max()!)
        }
        for i in 0..<rowCount {
            var tmp:[Int] = []
            for j in 0..<columnCount {
                tmp.append(grid[j][i])
            }
            maxColumn.append(tmp.max()!)
        }
        
        var ans = 0
        for i in 0..<columnCount {
            for j in 0..<rowCount{
                ans += (min(maxColumn[i], maxRow[j]) - grid[i][j])
            }
        }
        return ans
    }
}
// @lc code=end

