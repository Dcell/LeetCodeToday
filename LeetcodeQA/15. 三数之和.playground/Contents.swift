

/**
 给你一个包含 n 个整数的数组 nums，判断 nums 中是否存在三个元素 a，b，c ，使得 a + b + c = 0 ？请你找出所有和为 0 且不重复的三元组。

 注意：答案中不可以包含重复的三元组。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/3sum
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
*/
/**
 排序 然后 双指针
 
 难点在：如何去掉重复答案， 因为已经排序了，如果下一个和当前计算的一样，直接跳过
 */

class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        if nums.count < 3 {
            return []
        }
        let sortNums = nums.sorted()
        var ans:[[Int]] = []
        for i in 0..<sortNums.count {
            if sortNums[i] > 0 {
                break
            }
            if i > 0 && sortNums[i] == sortNums[i - 1] {
                continue
            }
            var left = i + 1
            var right = sortNums.count - 1
            while left < right{
                if sortNums[left] + sortNums[right] == 0 - sortNums[i] {
                    ans.append([sortNums[i],sortNums[left],sortNums[right]])
                    while left < right && sortNums[left + 1] == sortNums[left] {
                        left += 1
                    }
                    while left < right && sortNums[right - 1] == sortNums[right] {
                        right -= 1
                    }
                    left += 1
                    right -= 1
                }else if(sortNums[left] + sortNums[right] >  0 - sortNums[i]){
                    right -= 1
                }else{
                    left += 1
                }
            }
        }
        
        return ans
    }
}

let s =  Solution()
s.threeSum([0,0,0])
