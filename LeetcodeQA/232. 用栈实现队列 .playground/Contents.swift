/**
 
 请你仅使用两个栈实现先入先出队列。队列应当支持一般队列的支持的所有操作（push、pop、peek、empty）：

 实现 MyQueue 类：

 void push(int x) 将元素 x 推到队列的末尾
 int pop() 从队列的开头移除并返回元素
 int peek() 返回队列开头的元素
 boolean empty() 如果队列为空，返回 true ；否则，返回 false
 */
class MyQueue {
    
    var stackA:[Int] = []
    var stackB:[Int] = []

    /** Initialize your data structure here. */
    init() {

    }
    
    /** Push element x to the back of queue. */
    func push(_ x: Int) {
        stackA.append(x)
    }
    
    /** Removes the element from in front of queue and returns that element. */
    func pop() -> Int {
        if stackB.isEmpty {
            while !stackA.isEmpty {
                stackB.append(stackA.popLast()!)
            }
        }
        return stackB.popLast()!
    }
    
    /** Get the front element. */
    func peek() -> Int {
        if stackB.isEmpty {
            while !stackA.isEmpty {
                stackB.append(stackA.popLast()!)
            }
        }
        return stackB.last!
    }
    
    /** Returns whether the queue is empty. */
    func empty() -> Bool {
        return stackA.isEmpty && stackB.isEmpty
    }
}

/**
 * Your MyQueue object will be instantiated and called as such:
 * let obj = MyQueue()
 * obj.push(x)
 * let ret_2: Int = obj.pop()
 * let ret_3: Int = obj.peek()
 * let ret_4: Bool = obj.empty()
 */
