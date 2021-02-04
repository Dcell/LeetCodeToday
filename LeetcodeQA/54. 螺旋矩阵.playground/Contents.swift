/*
 提交记录
 54. 螺旋矩阵
 给你一个 m 行 n 列的矩阵 matrix ，请按照 顺时针螺旋顺序 ，返回矩阵中的所有元素。

  

 示例 1：


 输入：matrix = [[1,2,3],[4,5,6],[7,8,9]]
 输出：[1,2,3,6,9,8,7,4,5]
 */


class Solution {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        guard matrix.count > 0 else {
            return []
        }
        var left = 0,right = matrix[0].count - 1,top = 0,bottom = matrix.count - 1
        var ans:[Int] = []
        while left <= right && top <= bottom {
            if left == right {
                for i in stride(from: top, through: bottom, by: 1) {
                    ans.append(matrix[i][left])
                }
                break
            }
            if top == bottom {
                for i in stride(from: left, through: right, by: 1) {
                    ans.append(matrix[top][i])
                }
                break
            }
            for i in stride(from: left, to: right, by: 1) {
                ans.append(matrix[top][i])
            }
            for i in stride(from: top, to: bottom, by: 1) {
                ans.append(matrix[i][right])
            }
            for i in stride(from: right, to: left, by: -1) {
                ans.append(matrix[bottom][i])
            }
            for i in stride(from: bottom, to: top, by: -1) {
                ans.append(matrix[i][left])
            }
            bottom -= 1
            right -= 1
            top += 1
            left += 1
        }
        
        return ans
    }
}


let s = Solution()
s.spiralOrder([[1,2,3,4],[5,6,7,8],[9,10,11,12]])
s.spiralOrder([[1,2,3],[4,5,6],[7,8,9]])
s.spiralOrder([[1,2,3,4],[5,6,7,8],[9,10,11,12]])
