//
//  LeetcodeQATests.swift
//  LeetcodeQATests
//
//  Created by mac_25648_newMini on 2020/10/13.
//  Copyright © 2020 mac_25648_newMini. All rights reserved.
//

import XCTest

class LeetcodeQATests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    // 给定一个字符串，请你找出其中不含有重复字符的 最长子串 的长度。
    //
    // 示例 1:
    //
    // 输入: "abcabcbb"
    // 输出: 3
    // 解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。
    // 示例 2:
    //
    // 输入: "bbbbb"
    // 输出: 1
    // 解释: 因为无重复字符的最长子串是 "b"，所以其长度为 1。
    // 示例 3:
    //
    // 输入: "pwwkew"
    // 输出: 3
    // 解释: 因为无重复字符的最长子串是 "wke"，所以其长度为 3。
    //      请注意，你的答案必须是 子串 的长度，"pwke" 是一个子序列，不是子串。
    //
    // 来源：力扣（LeetCode）
    // 链接：https://leetcode-cn.com/problems/longest-substring-without-repeating-characters
    // 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
    func lengthOfLongestSubstring(_ s: String) -> Int {
         guard s.count != 0 else {
             return 0
         }
        guard s.count != 1 else {
            return 1
        }
         var start  = 0
         var longestLenght = 0
         var tmpHash:[Character:Int] = [:]
        let characters = Array(s)
        for i in 0..<s.count {
            let char = characters[i]
            if let hasIndex = tmpHash[char] {
                start = max(hasIndex + 1, start)
            }
            tmpHash[char] = i
            longestLenght = max(longestLenght, i - start + 1)
        }
         
         return longestLenght
    }
    
//    5. 最长回文子串
//    给定一个字符串 s，找到 s 中最长的回文子串。你可以假设 s 的最大长度为 1000。
//
//    示例 1：
//
//    输入: "babad"
//    输出: "bab"
//    注意: "aba" 也是一个有效答案。
//    示例 2：
//
//    输入: "cbbd"
//    输出: "bb"
    func longestPalindrome(_ s: String) -> String {
        let characters = Array(s)
        let n = s.count
        var dp = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
        var ans = "";
        for l in 0..<n {
            for i in 0..<(n - l) {
                let j = i + l;
                if (l == 0) {
                    dp[i][j] = true;
                } else if (l == 1) {
                    dp[i][j] = (characters[i] == characters[j]);
                } else {
                    dp[i][j] = (characters[i] == characters[j] && dp[i + 1][j - 1]);
                }
                if (dp[i][j] && l + 1 > ans.count) {
                    ans = String(characters[i..<(i + l + 1)])
                }
            }
        }
        return ans;
    }

    
    func testlengthOfLongestSubstring(){
//        print(lengthOfLongestSubstring("au"))
//        print(lengthOfLongestSubstring(" "))
//        print(lengthOfLongestSubstring("abcabcbb"))
//
//        print(lengthOfLongestSubstring("bbbbbbb"))
    }

}
