/**
 766. 托普利茨矩阵
 给你一个 m x n 的矩阵 matrix 。如果这个矩阵是托普利茨矩阵，返回 true ；否则，返回 false 。

 如果矩阵上每一条由左上到右下的对角线上的元素都相同，那么这个矩阵是 托普利茨矩阵 。
 */
class Solution {
    func isToeplitzMatrix(_ matrix: [[Int]]) -> Bool {
        if matrix.count == 0 {
            return false
        }
        let width = matrix[0].count
        let height = matrix.count
        
        func bfs(_ x:Int,_ y:Int,_ value:Int) -> Bool{
            if x >= width{
                return true
            }
            if y >= height{
                return true
            }
            if matrix[y][x] != value {
                return false
            }
            return bfs(x + 1, y + 1, value)
        }
        
        for i in 0..<width {
            for j in 0..<height {
                let result = bfs(i, j, matrix[j][i])
                if !result {
                    return false
                }
            }
        }
        return true
    }
}


let s =  Solution()
//s.isToeplitzMatrix([[1,2,3,4],[5,1,2,3],[9,5,1,2]])
//s.isToeplitzMatrix([[1,2],[2,2]])
s.isToeplitzMatrix([[36,59,71,15,26,82,87],[56,36,59,71,15,26,82],[15,0,36,59,71,15,26]])
