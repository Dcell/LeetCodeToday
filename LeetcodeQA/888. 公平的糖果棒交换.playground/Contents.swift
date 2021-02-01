import UIKit

var str = "Hello, playground"


/**
 888. 公平的糖果棒交换
 爱丽丝和鲍勃有不同大小的糖果棒：A[i] 是爱丽丝拥有的第 i 根糖果棒的大小，B[j] 是鲍勃拥有的第 j 根糖果棒的大小。

 因为他们是朋友，所以他们想交换一根糖果棒，这样交换后，他们都有相同的糖果总量。（一个人拥有的糖果总量是他们拥有的糖果棒大小的总和。）

 返回一个整数数组 ans，其中 ans[0] 是爱丽丝必须交换的糖果棒的大小，ans[1] 是 Bob 必须交换的糖果棒的大小。

 如果有多个答案，你可以返回其中任何一个。保证答案存在。
 */

/**
 思路：a - b = (sumA - sumB)/2
 为了快速定位：直接使用 HashMap
 */

class Solution {
    func fairCandySwap(_ A: [Int], _ B: [Int]) -> [Int] {
        var sumA = 0
        var mapA:[Int:Int] = [:]
        for i in 0..<A.count {
            sumA += A[i]
            mapA[A[i]] = i
        }
        var sumB = 0
        var mapB:[Int:Int] = [:]
        for i in 0..<B.count {
            sumB += B[i]
            mapB[B[i]] = i
        }
        let sumd = sumA - sumB
        for i in 0..<B.count {
            let a = sumd/2 + B[i]
            if mapA.keys.contains(a) {
                return [a,B[i]]
            }
        }
        return []
    }
}

let s = Solution()
s.fairCandySwap([1,1], [2,2])
