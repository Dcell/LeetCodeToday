/**
 354. 俄罗斯套娃信封问题
 给你一个二维整数数组 envelopes ，其中 envelopes[i] = [wi, hi] ，表示第 i 个信封的宽度和高度。

 当另一个信封的宽度和高度都比这个信封大的时候，这个信封就可以放进另一个信封里，如同俄罗斯套娃一样。

 请计算 最多能有多少个 信封能组成一组“俄罗斯套娃”信封（即可以把一个信封放到另一个信封里面）。

 注意：不允许旋转信封。

  
 示例 1：

 输入：envelopes = [[5,4],[6,4],[6,7],[2,3]]
 输出：3
 解释：最多信封的个数为 3, 组合为: [2,3] => [5,4] => [6,7]。
 示例 2：

 输入：envelopes = [[1,1],[1,1],[1,1]]
 输出：1
 */
class Solution {
    func maxEnvelopes(_ envelopes: [[Int]]) -> Int {
        var envelopes = envelopes
        var dp:[Int] = Array(repeating: 1, count: envelopes.count)
        envelopes.sort { (lv, rv) -> Bool in
            if lv[0] == rv[0] {
                return lv[1] > rv[1]
            }
            return lv[0] < rv[0]
        }
        print(envelopes)
        for i in 0..<envelopes.count {
            for j in 0..<i {
                if envelopes[j][1] < envelopes[i][1] {
                    dp[i] = max(dp[i], dp[j] + 1)
                }
            }
        }
        
        return dp.max()!
    }
}

let s = Solution()
s.maxEnvelopes([[5,4],[6,4],[6,7],[2,3]])
