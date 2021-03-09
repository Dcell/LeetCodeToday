/**
 提交记录
 1047. 删除字符串中的所有相邻重复项
 给出由小写字母组成的字符串 S，重复项删除操作会选择两个相邻且相同的字母，并删除它们。

 在 S 上反复执行重复项删除操作，直到无法继续删除。

 在完成所有重复项删除操作后返回最终的字符串。答案保证唯一。


 */
class Solution {
    func removeDuplicates(_ S: String) -> String {
        let chars = Array(S)
        var stack:[Character] = []
        for i in 0..<chars.count {
            if !stack.isEmpty && stack.last! == chars[i] {
                stack.popLast()
            }else{
                stack.append(chars[i])
            }
        }
        return String(stack)
    }
}
