/*
 * @lc app=leetcode.cn id=179 lang=swift
 *
 * [179] 最大数
 */

// @lc code=start
class Solution {
    func largestNumber(_ nums: [Int]) -> String {
        let sortNums = nums.sorted{ (lv,rv) -> Bool in 
            if lv == rv {
                return lv > rv
            }
            let value1 = Array(String(lv))
            let value2 = Array(String(rv))
            for i in 0..<(max(value1.count, value2.count) * 2){
            // while true{
                let indexValue1 = value1[i%value1.count].wholeNumberValue!
                // if i < value1.count {
                //     indexValue1 = value1[i].wholeNumberValue!
                // }
                let indexValue2 = value2[i%value2.count].wholeNumberValue!
                // if i < value2.count {
                //     indexValue2 = value2[i].wholeNumberValue!
                // }
                if indexValue1 == indexValue2 {
                    continue
                }
                return indexValue1 > indexValue2
            }
            return true 
        }

        return sortNums.reduce("") { (Result, value) -> String in
                    if Result == "0"{
                        return "\(value)"
                    }
                    return Result + "\(value)"
                }     
    }
}
// @lc code=end
let s = Solution()
// print(s.largestNumber([10,2]))
print(s.largestNumber([3,30,34,5,9]))
print(s.largestNumber([432,43243]))
print(s.largestNumber([8308,8308,830]))
print(s.largestNumber([3,43,48,94,85,33,64,32,63,66]))