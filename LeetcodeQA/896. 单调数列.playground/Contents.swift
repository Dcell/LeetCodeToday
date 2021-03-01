/**
 如果数组是单调递增或单调递减的，那么它是单调的。

 如果对于所有 i <= j，A[i] <= A[j]，那么数组 A 是单调递增的。 如果对于所有 i <= j，A[i]> = A[j]，那么数组 A 是单调递减的。

 当给定的数组 A 是单调数组时返回 true，否则返回 false。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/monotonic-array
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution {
    func isMonotonic(_ A: [Int]) -> Bool {
        var aes = false,des = false
        for i in 0..<A.count - 1 {
            if (A[i] > A[i + 1]) {aes = true}
            if (A[i] < A[i + 1]) {des = true}
        }
        return !(aes && des)
    }
}
