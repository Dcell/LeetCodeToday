/**
 567. 字符串的排列
 给定两个字符串 s1 和 s2，写一个函数来判断 s2 是否包含 s1 的排列。

 换句话说，第一个字符串的排列之一是第二个字符串的子串。

  

 示例 1：

 输入: s1 = "ab" s2 = "eidbaooo"
 输出: True
 解释: s2 包含 s1 的排列之一 ("ba").
 示例 2：

 输入: s1= "ab" s2 = "eidboaoo"
 输出: False
 */
class Solution {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        if s1.count > s2.count {
            return false
        }
        var s1HashMap:[Character:Int] = [:]

        let s2Chars = Array(s2)
        let s1Chars = Array(s1)
        for i in 0..<s1Chars.count {
            var charNums = 0
            if s1HashMap.keys.contains(s1Chars[i]) {
                charNums = s1HashMap[s1Chars[i]]!
            }
            s1HashMap[s1Chars[i]] = (charNums + 1)
        }
        var s2HashMap:[Character:Int] = [:]
        var left = 0,right = s1Chars.count
        for i in 0..<right {
            var charNums = 0
            if s2HashMap.keys.contains(s2Chars[i]) {
                charNums = s2HashMap[s2Chars[i]]!
            }
            s2HashMap[s2Chars[i]] = (charNums + 1)
        }
        if s1HashMap == s2HashMap {
            return true
        }
        
        while right < s2Chars.count {
            var charNums = 0
            if s2HashMap.keys.contains(s2Chars[right]) {
                charNums = s2HashMap[s2Chars[right]]!
            }
            s2HashMap[s2Chars[right]] = (charNums + 1)
            while right - left + 1 > s1Chars.count {
                let leftChar = s2Chars[left]
                let charNums = s2HashMap[leftChar]! - 1
                if charNums == 0 {
                    s2HashMap.removeValue(forKey: leftChar)
                }else{
                    s2HashMap[leftChar] = charNums
                }
                left += 1
            }
            print(s2HashMap.debugDescription)
            if s1HashMap == s2HashMap {
                return true
            }
            right += 1
        }
        return false
    }
}

let s = Solution()
//s.checkInclusion("ab", "eidbaooo")
//s.checkInclusion("ab", "eidboaoo")
s.checkInclusion("a", "ab")
