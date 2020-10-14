//
//  AppDelegate.swift
//  LeetcodeQA
//
//  Created by mac_25648_newMini on 2020/3/30.
//  Copyright © 2020 mac_25648_newMini. All rights reserved.
//

import UIKit

class A {
    
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        func plusOnePro(_ digits: inout [Int], _ index:Int) {
            if(index == -1){
                digits.insert(1, at: 0)
                return
            }
            if(digits[index] != 9){
                digits[index] = digits[index] + 1
            }else{
                digits[index] = 0
                plusOnePro(&digits,index - 1)
            }
        }

        func plusOne(_ digits: [Int]) -> [Int] {
            var digits = digits
            let i = digits.count - 1
            plusOnePro(&digits,i)
            return digits
        }
        
        
        
        class ListNode {
             public var val: Int
             public var next: ListNode?
             public init(_ val: Int) {
                 self.val = val
                 self.next = nil
             }
        }

        func deleteDuplicates(_ head: ListNode?) -> ListNode? {
            var node = ListNode(0)
            var n2 = head
            while n2 != nil {
                if(n2!.val != node.val){
                    node.next = n2
                    node = n2!
                }
                n2 = n2!.next
            }
            return node.next
        }
        
        
        let ab = ""
        ab.replacingOccurrences(of: "", with: "")
        
        let a =  A()
        let b = A()
        a === b
        
        let trtt  = ""
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

