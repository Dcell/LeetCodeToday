/*
 * @lc app=leetcode.cn id=384 lang=swift
 *
 * [384] 打乱数组
 */

// @lc code=start

class Solution {
    let resetNums:[Int]

    init(_ nums: [Int]) {
        self.resetNums = nums
    }
    
    func reset() -> [Int] {
        return resetNums
    }
    
    func shuffle() -> [Int] {
        var shuffleNums = self.resetNums
        var ans:[Int] = []
        while(shuffleNums.count > 0){
            let random = Int.random(in: 0..<shuffleNums.count)
            ans.append(shuffleNums.remove(at: random))
        }
        return ans
    }
}


/**
 * Your Solution object will be instantiated and called as such:
 * let obj = Solution(nums)
 * let ret_1: [Int] = obj.reset()
 * let ret_2: [Int] = obj.shuffle()
 */
// @lc code=end

