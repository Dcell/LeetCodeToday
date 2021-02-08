/**
 665. 非递减数列
 给你一个长度为 n 的整数数组，请你判断在 最多 改变 1 个元素的情况下，该数组能否变成一个非递减数列。

 我们是这样定义一个非递减数列的： 对于数组中所有的 i (0 <= i <= n-2)，总满足 nums[i] <= nums[i + 1]。

  

 示例 1:

 输入: nums = [4,2,3]
 输出: true
 解释: 你可以通过把第一个4变成1来使得它成为一个非递减数列。
 示例 2:

 输入: nums = [4,2,1]
 输出: false
 解释: 你不能在只改变一个元素的情况下将其变为非递减数列。
  

 说明：

 1 <= n <= 10 ^ 4
 - 10 ^ 5 <= nums[i] <= 10 ^ 5
 */


/**
 public boolean checkPossibility(int[] nums) {
     if (nums == null || nums.length <= 1) {
         return true;
     }
     int cnt = 0;
     for (int i = 1; i < nums.length && cnt < 2; i++) {
         if (nums[i-1] <= nums[i]) {
             continue;
         }
         cnt++;
         if (i-2>=0 && nums[i-2] > nums[i]) {
             nums[i] = nums[i-1];
         }else {
             nums[i-1] = nums[i];
         }
     }
     return cnt <= 1;
 }
 */

class Solution {
    
    func checkPossibility(_ nums: [Int]) -> Bool {
        if nums.count <= 1 {
            return true
        }
        var nums = nums
        var cnt = 0
        var right = 1
        while right < nums.count && cnt < 2 {
            if (nums[right-1] <= nums[right]) {
                right += 1
                continue;
            }
            cnt += 1
            if (right-2>=0 && nums[right-2] > nums[right]) {
                nums[right] = nums[right-1];
            }else {
                nums[right-1] = nums[right];
            }
            right += 1
        }
        return cnt <= 1
        
    }
    
}

let s = Solution()
s.checkPossibility([4,2,3])
s.checkPossibility([4,2,1])
s.checkPossibility([1,1,1])
s.checkPossibility([3,4,2,3])
