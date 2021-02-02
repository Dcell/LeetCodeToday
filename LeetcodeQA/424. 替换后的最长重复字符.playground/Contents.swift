/**
 424. 替换后的最长重复字符
 给你一个仅由大写英文字母组成的字符串，你可以将任意位置上的字符替换成另外的字符，总共可最多替换 k 次。在执行上述操作后，找到包含重复字母的最长子串的长度。

 注意：字符串长度 和 k 不会超过 104。

  

 示例 1：

 输入：s = "ABAB", k = 2
 输出：4
 解释：用两个'A'替换为两个'B',反之亦然。
 示例 2：

 输入：s = "AABABBA", k = 1
 输出：4
 解释：
 将中间的一个'A'替换为'B',字符串变为 "AABBBBA"。
 子串 "BBBB" 有最长重复字母, 答案为 4。
 */

/**
 思路：
 1.滑动窗口，你想下，如果k=0 你怎么计算最长的字符串？
 2.如果字符串重复的字母 + k > 字符串长度，是不是可以确定可以转化呢
 */
class Solution {
    func characterReplacement(_ s: String, _ k: Int) -> Int {
        if s.count <= 1 {
            return s.count
        }
        let charArray = Array(s)
        var left = 0
        var charMap:[Character:Int] = [:]
        for right in 0..<charArray.count {
            var chatNums = 0
            if charMap.keys.contains(charArray[right]) {
                chatNums = charMap[charArray[right]]!
            }
            charMap[charArray[right]] = chatNums + 1
            let maxCharNums =  charMap.values.max()!
            if right - left + 1 > maxCharNums + k {
                let chatNums = charMap[charArray[left]]!
                charMap[charArray[left]] = chatNums - 1
                left += 1
            }
        }
        return charArray.count - left
    }
}

let s = Solution()
s.characterReplacement("ABAB", 2)
s.characterReplacement("AABABBA", 1)
