class Solution {
    func calculate(_ s: String) -> Int {
        var chars = Array(s)
        chars.append("+")
        var num = 0,res = 0
        var sign:Character = "+"
        var stack:[Int] = []
        for i in 0..<chars.count{
            let char = chars[i]
            if char == " " {
                continue
            }
            if char.isNumber {
                num = num*10 + char.wholeNumberValue!
                continue
            }
            switch sign {
            case "+":
                stack.append(num)
            case "-":
                stack.append(num * -1)
            case "*":
                stack.append(stack.popLast()! * num)
            case "/":
                stack.append(stack.popLast()! /  num)
            default:
                break
            }
            sign = char
            num = 0
        }

        while !stack.isEmpty {
            res += stack.popLast()!
        }
        return res
    }
}
let s  = Solution()
s.calculate("3+2*2")
