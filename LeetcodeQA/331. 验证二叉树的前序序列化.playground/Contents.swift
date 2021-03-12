class Solution {
    func isValidSerialization(_ preorder: String) -> Bool {
        let subStrings = preorder.split(separator: ",")
        var stack:[String] = []
        for i in 0..<subStrings.count {
            stack.append(String(subStrings[i]))
            var count = stack.count
            while count >= 3 && stack[count - 1] == "#" && stack[count - 2] == "#" && stack[count - 3] != "#"{
                stack.popLast()
                stack.popLast()
                stack.popLast()
                stack.append("#")
                count = stack.count
            }
        }
        return stack.count == 1  && stack.last == "#"
    }
}

let s = Solution()
s.isValidSerialization("9,3,4,#,#,1,#,#,2,#,6,#,#")
