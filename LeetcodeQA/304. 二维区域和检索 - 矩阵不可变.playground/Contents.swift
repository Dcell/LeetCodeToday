/**
 给定一个二维矩阵，计算其子矩形范围内元素的总和，该子矩阵的左上角为 (row1, col1) ，右下角为 (row2, col2) 。


 上图子矩阵左上角 (row1, col1) = (2, 1) ，右下角(row2, col2) = (4, 3)，该子矩形内元素的总和为 8。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/range-sum-query-2d-immutable
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 提示：

 你可以假设矩阵不可变。
 会多次调用 sumRegion 方法。
 你可以假设 row1 ≤ row2 且 col1 ≤ col2 。
 */

class NumMatrix {
    let matrix:[[Int]]
    var presum:[[Int]]
    init(_ matrix: [[Int]]) {
        self.matrix = matrix
        let n = matrix.count
        let m = n > 0 ? matrix[0].count : 0
        self.presum = Array(repeating: Array(repeating: 0, count: m + 1), count: n + 1)
        for i in 0..<n {
            for j in 0..<m{
                self.presum[i + 1][j + 1] = self.presum[i][j + 1] + self.presum[i + 1][j] - self.presum[i][j] + self.matrix[i][j]
            }
        }
    }
    
    func sumRegion(_ row1: Int, _ col1: Int, _ row2: Int, _ col2: Int) -> Int {
        return self.presum[row2 + 1][col2 + 1] - self.presum[row1][col2 + 1] - self.presum[row2 + 1][col1] + self.presum[row1][col1]
    }
}

let n = NumMatrix([[3,0,1,4,2],[5,6,3,2,1],[1,2,0,1,5],[4,1,0,1,7],[1,0,3,0,5]])
/**
 * Your NumMatrix object will be instantiated and called as such:
 * let obj = NumMatrix(matrix)
 * let ret_1: Int = obj.sumRegion(row1, col1, row2, col2)
 */
