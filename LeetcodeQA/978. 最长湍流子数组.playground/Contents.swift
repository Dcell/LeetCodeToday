/**
 978. 最长湍流子数组
 当 A 的子数组 A[i], A[i+1], ..., A[j] 满足下列条件时，我们称其为湍流子数组：

 若 i <= k < j，当 k 为奇数时， A[k] > A[k+1]，且当 k 为偶数时，A[k] < A[k+1]；
 或 若 i <= k < j，当 k 为偶数时，A[k] > A[k+1] ，且当 k 为奇数时， A[k] < A[k+1]。
 也就是说，如果比较符号在子数组中的每个相邻元素对之间翻转，则该子数组是湍流子数组。

 返回 A 的最大湍流子数组的长度。

  

 示例 1：

 输入：[9,4,2,10,7,8,8,1,9]
 输出：5
 解释：(A[1] > A[2] < A[3] > A[4] < A[5])
 示例 2：

 输入：[4,8,12,16]
 输出：2
 示例 3：

 输入：[100]
 输出：1
 */
class Solution {
    func maxTurbulenceSize(_ arr: [Int]) -> Int {
        if arr.count <= 1 {
            return arr.count
        }
        var up = Array(repeating: 1, count: arr.count)
        var down = Array(repeating: 1, count: arr.count)
        var res = 1
        for i in 1..<arr.count {
            if arr[i] > arr[i - 1] {
                up[i] = down[i - 1] + 1
                down[i] = 1
            }else if arr[i] < arr[i - 1] {
                down[i] = up[i - 1] + 1
                up[i] = 1
            }else{
                up[i] = 1
                down[i] = 1
            }
            res = max(res, max(up[i], down[i]))
        }
        return res
    }
}

let s = Solution()
s.maxTurbulenceSize([9,4,2,10,7,8,8,1,9])
