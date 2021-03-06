
/**
 1052. 爱生气的书店老板
 今天，书店老板有一家店打算试营业 customers.length 分钟。每分钟都有一些顾客（customers[i]）会进入书店，所有这些顾客都会在那一分钟结束后离开。

 在某些时候，书店老板会生气。 如果书店老板在第 i 分钟生气，那么 grumpy[i] = 1，否则 grumpy[i] = 0。 当书店老板生气时，那一分钟的顾客就会不满意，不生气则他们是满意的。

 书店老板知道一个秘密技巧，能抑制自己的情绪，可以让自己连续 X 分钟不生气，但却只能使用一次。

 请你返回这一天营业下来，最多有多少客户能够感到满意的数量。
  

 示例：

 输入：customers = [1,0,1,2,1,1,7,5], grumpy = [0,1,0,1,0,1,0,1], X = 3
 输出：16
 解释：
 书店老板在最后 3 分钟保持冷静。
 感到满意的最大客户数量 = 1 + 1 + 1 + 1 + 7 + 5 = 16.
 */
class Solution {
    func maxSatisfied(_ customers: [Int], _ grumpy: [Int], _ X: Int) -> Int {
        var left = 0,right = 0;
        var maxSatisfied = Int.min
        var satisfied = 0
        var sum = 0
        for i in 0..<customers.count {
            if grumpy[i] == 0 {
                sum += customers[i]
            }
        }
        while right < customers.count {
            if grumpy[right] == 0 {
                sum -= customers[right]
            }
            satisfied += customers[right]
            while right - left + 1 > X {
                if grumpy[left] == 0 {
                    sum += customers[left]
                }
                satisfied -= customers[left]
                left += 1
            }
            maxSatisfied = max(satisfied + sum, maxSatisfied)
            right += 1
        }
        return maxSatisfied
    }
}

let s = Solution()
s.maxSatisfied([1,0,1,2,1,1,7,5], [0,1,0,1,0,1,0,1], 3)
s.maxSatisfied([4,10,10], [1,1,0], 2)

