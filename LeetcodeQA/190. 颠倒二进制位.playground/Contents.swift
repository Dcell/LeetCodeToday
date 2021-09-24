class Solution {
    func reverseBits(_ n: Int) -> Int {
        let left = n << 16
        let right = n >> 16
        return left | right
    }
}

let s = Solution()
s.reverseBits(43261596)
