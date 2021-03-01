
/**
 提交记录
 303. 区域和检索 - 数组不可变
 给定一个整数数组  nums，求出数组从索引 i 到 j（i ≤ j）范围内元素的总和，包含 i、j 两点。

 实现 NumArray 类：

 NumArray(int[] nums) 使用数组 nums 初始化对象
 int sumRange(int i, int j) 返回数组 nums 从索引 i 到 j（i ≤ j）范围内元素的总和，包含 i、j 两点（也就是 sum(nums[i], nums[i + 1], ... , nums[j])）

 */
class NumArray {
    let nums:[Int]
    init(_ nums: [Int]) {
        self.nums = nums
    }
    
    func sumRange(_ i: Int, _ j: Int) -> Int {
        if (i == j) { return nums[i]}
        var ans = 0
        for n in i...j{
            ans += nums[n]
        }
        return ans
    }
}

/**
 * Your NumArray object will be instantiated and called as such:
 * let obj = NumArray(nums)
 * let ret_1: Int = obj.sumRange(i, j)
 */
