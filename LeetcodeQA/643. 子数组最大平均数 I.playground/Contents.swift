/*
 643. 子数组最大平均数 I
 给定 n 个整数，找出平均数最大且长度为 k 的连续子数组，并输出该最大平均数。

  

 示例：

 输入：[1,12,-5,-6,50,3], k = 4
 输出：12.75
 解释：最大平均数 (12-5-6+50)/4 = 51/4 = 12.75
 */

class Solution {
    func findMaxAverage(_ nums: [Int], _ k: Int) -> Double {
        var sum = nums.prefix(k).reduce(0) { (result, value) -> Int in
            return result + value
        }
        var ans:Double = Double(sum)/Double(k)
        var left = 0
        var rigth = k - 1
        for _ in rigth..<(nums.count - 1) {
            sum -= nums[left]
            left += 1
            rigth += 1
            sum += nums[rigth]
            ans = max(ans, Double(sum)/Double(k))

        }
        return ans
    }
}

let s = Solution()
s.findMaxAverage([1,12,-5,-6,50,3], 4)
