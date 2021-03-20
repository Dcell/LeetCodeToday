/**
 150. 逆波兰表达式求值
 根据 逆波兰表示法，求表达式的值。

 有效的算符包括 +、-、*、/ 。每个运算对象可以是整数，也可以是另一个逆波兰表达式。

  

 说明：

 整数除法只保留整数部分。
 给定逆波兰表达式总是有效的。换句话说，表达式总会得出有效数值且不存在除数为 0 的情况。

 */

class Solution {
    func evalRPN(_ tokens: [String]) -> Int {
        var stack:[Int] = []
        for i in 0..<tokens.count{
            let token = tokens[i]
            if token == "+" || token == "-" || token == "*" || token == "/" {
                let v1 = stack.popLast()!
                let v2 = stack.popLast()!
                if token == "+"{
                    stack.append(v2 + v1)
                }else if token == "-"{
                    stack.append(v2 - v1)
                }else if token == "*"{
                    stack.append(v2 * v1)
                }else if token == "/"{
                    stack.append(v2 / v1)
                }
            }else{
                stack.append(Int(token)!)
            }
        }
        return stack.popLast()!
    }
}
