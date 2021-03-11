class Solution {
    func calculate(_ s:String) -> Int{
        var res = 0,num = 0,sign = 1
        var stack:[Int] = []
        let chars = Array(s)
        for i in 0..<chars.count {
            if chars[i] == "+" || chars[i] == "-" {
                res = res + num * sign
                num = 0
                sign = chars[i] == "+"  ? 1 : -1
            }else if chars[i] == "(" {
                stack.append(res)
                stack.append(sign)
                res = 0
                sign = 1
            }else if chars[i] == ")" {
                res = res + num * sign
                res = res * stack.popLast()!
                res = res + stack.popLast()!
                num = 0
            }else{
                if chars[i].isNumber {
                    num = num * 10 + Int(String(chars[i]))!
                }
            }
        }
        return res + num * sign
    }
}

let s = Solution()
