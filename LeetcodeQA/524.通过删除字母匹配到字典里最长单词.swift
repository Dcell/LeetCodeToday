/*
 * @lc app=leetcode.cn id=524 lang=swift
 *
 * [524] 通过删除字母匹配到字典里最长单词
 */

// @lc code=start
class Solution {
    func matchWord(_ lv:String,_ rv:String) -> Bool{
        var fp = 0
        var sp = 0
        let lvChars = lv.utf8CString
        let rvChars = rv.utf8CString
        while(fp < lvChars.count && sp < rvChars.count){
            if rvChars[sp] == lvChars[fp]{
                sp += 1
            }
            fp += 1
        }
        return sp == rvChars.count
    }
    func findLongestWord(_ s: String, _ dictionary: [String]) -> String {
        var result = ""
        dictionary.forEach{item in
            let word =  matchWord(s,item)
            if word {
                if item.count > result.count{
                    result = item
                }else if item.count == result.count{
                    result = compareWord(item,result) ? result : item
                }
            }
        }
        return result
    }
    
    func compareWord(_ lv:String,_ rv:String) -> Bool{
        let lvChars = lv.utf8CString
        let rvChars = rv.utf8CString
        for index in 0..<lv.count {
            if lvChars[index] == rvChars[index]{
                continue
            }
            return lvChars[index] > rvChars[index]
        }
        return false
    }
}
// @lc code=end

