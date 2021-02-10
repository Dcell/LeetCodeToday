/**
 题解 (204)
 提交记录
 992. K 个不同整数的子数组
 给定一个正整数数组 A，如果 A 的某个子数组中不同整数的个数恰好为 K，则称 A 的这个连续、不一定不同的子数组为好子数组。

 （例如，[1,2,3,1,2] 中有 3 个不同的整数：1，2，以及 3。）

 返回 A 中好子数组的数目。

  

 示例 1：

 输入：A = [1,2,1,2,3], K = 2
 输出：7
 解释：恰好由 2 个不同整数组成的子数组：[1,2], [2,1], [1,2], [2,3], [1,2,1], [2,1,2], [1,2,1,2].
 示例 2：

 输入：A = [1,2,1,3,4], K = 3
 输出：3
 解释：恰好由 3 个不同整数组成的子数组：[1,2,1,3], [2,1,3], [1,3,4].
 */
class Solution {
    func subarraysWithKDistinct(_ A: [Int], _ K: Int) -> Int {
        var left = 0,right = 0
        var subSet:Set<Int> = Set()
        while right < A.count {
            if subSet.contains(A[right]) {
                right += 1
                continue;
            }
            subSet.insert(A[right])
            while subSet.count != K && left >= 0 {
                subSet.remove(A[left])
                left += 1
            }
            right += 1
            if subSet.count == K {
                print(subSet)
            }
            
        }
        return 0
    }
}

let s = Solution()
s.subarraysWithKDistinct([1,2,1,2,3], 2)
