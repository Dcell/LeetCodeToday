/**
 697. 数组的度
 给定一个非空且只包含非负数的整数数组 nums，数组的度的定义是指数组里任一元素出现频数的最大值。

 你的任务是在 nums 中找到与 nums 拥有相同大小的度的最短连续子数组，返回其长度。

  

 示例 1：

 输入：[1, 2, 2, 3, 1]
 输出：2
 解释：
 输入数组的度是2，因为元素1和2的出现频数最大，均为2.
 连续子数组里面拥有相同度的有如下所示:
 [1, 2, 2, 3, 1], [1, 2, 2, 3], [2, 2, 3, 1], [1, 2, 2], [2, 2, 3], [2, 2]
 最短连续子数组[2, 2]的长度为2，所以返回2.
 示例 2：

 输入：[1,2,2,3,1,4,2]
 输出：6
  

 提示：

 nums.length 在1到 50,000 区间范围内。
 nums[i] 是一个在 0 到 49,999 范围内的整数。
 */
class Solution {
    func findShortestSubArray(_ nums: [Int]) -> Int {
        if nums.count <= 1 {
            return nums.count
        }
        var numGroup:[Int:Int] = [:]
        for i in 0..<nums.count {
            var count = 0
            let key = nums[i]
            if numGroup.keys.contains(key) {
                count = numGroup[key]!
            }
            numGroup[key] = count + 1
        }
        let sortNumGroup = numGroup.sorted { (lv, rv) -> Bool in
            return lv.value > rv.value
        }
        let du = sortNumGroup.first!.value
        let filterNumGroup =  sortNumGroup.filter { (value) -> Bool in
            return value.value == du
        }
        var ans = Int.max
        for item in filterNumGroup {
            let len = nums.lastIndex(of: item.key)! - nums.firstIndex(of: item.key)! + 1
            ans = min(ans, len)
        }
        
        return ans
    }
}

let s = Solution()
s.findShortestSubArray([1, 2, 2, 3, 1])
s.findShortestSubArray([1,2,2,3,1,4,2])
