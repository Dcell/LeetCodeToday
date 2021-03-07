/**
 131. 分割回文串
 给定一个字符串 s，将 s 分割成一些子串，使每个子串都是回文串。

 返回 s 所有可能的分割方案。

 示例:

 输入: "aab"
 输出:
 [
   ["aa","b"],
   ["a","a","b"]
 ]
 */



class Solution {
    
    
    var ans:[[String]] = []
    func partition(_ s: String) -> [[String]] {
        let chars = Array(s)
        bfs(chars, 0, [])
        return ans
    }
    
    func bfs(_ source:[Character],_ index:Int,_ result:[String]){
        if index == source.count {
            ans.append(result)
            return
        }
        for i in index..<source.count {
            let preString = source[index...i]
            if !checkPartition(String(preString)) {
                continue
            }
            var result = result
            result.append(String(preString))
            bfs(source, i + 1, result)
        }
        
    }
    
    func checkPartition(_ s: String) -> Bool{
        if s.count == 1 {
            return true
        }
        let lenght = s.count
        let midLength = lenght/2
        let chars = Array(s)
        for i in 0..<midLength {
            if chars[i] != chars[lenght - i - 1] {
                return false
            }
        }
        return true
    }
}

let s = Solution()
s.partition("aab")
