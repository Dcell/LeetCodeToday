/**
 480. 滑动窗口中位数
 中位数是有序序列最中间的那个数。如果序列的大小是偶数，则没有最中间的数；此时中位数是最中间的两个数的平均数。

 例如：

 [2,3,4]，中位数是 3
 [2,3]，中位数是 (2 + 3) / 2 = 2.5
 给你一个数组 nums，有一个大小为 k 的窗口从最左端滑动到最右端。窗口中有 k 个数，每次窗口向右移动 1 位。你的任务是找出每次窗口移动后得到的新窗口中元素的中位数，并输出由它们组成的数组。

  

 示例：

 给出 nums = [1,3,-1,-3,5,3,6,7]，以及 k = 3。

 窗口位置                      中位数
 ---------------               -----
 [1  3  -1] -3  5  3  6  7       1
  1 [3  -1  -3] 5  3  6  7      -1
  1  3 [-1  -3  5] 3  6  7      -1
  1  3  -1 [-3  5  3] 6  7       3
  1  3  -1  -3 [5  3  6] 7       5
  1  3  -1  -3  5 [3  6  7]      6
  因此，返回该滑动窗口的中位数数组 [1,-1,-1,3,5,6]。

  

 提示：

 你可以假设 k 始终有效，即：k 始终小于输入的非空数组的元素个数。
 与真实值误差在 10 ^ -5 以内的答案将被视作正确答案。

 */

/**
 思路：双维护一个平衡的 双优先队列，这样中间值，就是2个队列的peek，然后就是处理，怎么插入一个新值，然后删除一个老值的问题
 */


public struct Heap<T> {
  
  /** The array that stores the heap's nodes. */
  var nodes = [T]()
  
  /**
   * Determines how to compare two nodes in the heap.
   * Use '>' for a max-heap or '<' for a min-heap,
   * or provide a comparing method if the heap is made
   * of custom elements, for example tuples.
   */
  private var orderCriteria: (T, T) -> Bool
  
  /**
   * Creates an empty heap.
   * The sort function determines whether this is a min-heap or max-heap.
   * For comparable data types, > makes a max-heap, < makes a min-heap.
   */
  public init(sort: @escaping (T, T) -> Bool) {
    self.orderCriteria = sort
  }
  
  /**
   * Creates a heap from an array. The order of the array does not matter;
   * the elements are inserted into the heap in the order determined by the
   * sort function. For comparable data types, '>' makes a max-heap,
   * '<' makes a min-heap.
   */
  public init(array: [T], sort: @escaping (T, T) -> Bool) {
    self.orderCriteria = sort
    configureHeap(from: array)
  }
  
  /**
   * Configures the max-heap or min-heap from an array, in a bottom-up manner.
   * Performance: This runs pretty much in O(n).
   */
  private mutating func configureHeap(from array: [T]) {
    nodes = array
    for i in stride(from: (nodes.count/2-1), through: 0, by: -1) {
      shiftDown(i)
    }
  }
  
  public var isEmpty: Bool {
    return nodes.isEmpty
  }
  
  public var count: Int {
    return nodes.count
  }
  
  /**
   * Returns the index of the parent of the element at index i.
   * The element at index 0 is the root of the tree and has no parent.
   */
  @inline(__always) internal func parentIndex(ofIndex i: Int) -> Int {
    return (i - 1) / 2
  }
  
  /**
   * Returns the index of the left child of the element at index i.
   * Note that this index can be greater than the heap size, in which case
   * there is no left child.
   */
  @inline(__always) internal func leftChildIndex(ofIndex i: Int) -> Int {
    return 2*i + 1
  }
  
  /**
   * Returns the index of the right child of the element at index i.
   * Note that this index can be greater than the heap size, in which case
   * there is no right child.
   */
  @inline(__always) internal func rightChildIndex(ofIndex i: Int) -> Int {
    return 2*i + 2
  }
  
  /**
   * Returns the maximum value in the heap (for a max-heap) or the minimum
   * value (for a min-heap).
   */
  public func peek() -> T? {
    return nodes.first
  }
  
  /**
   * Adds a new value to the heap. This reorders the heap so that the max-heap
   * or min-heap property still holds. Performance: O(log n).
   */
  public mutating func insert(_ value: T) {
    nodes.append(value)
    shiftUp(nodes.count - 1)
  }
  
  /**
   * Adds a sequence of values to the heap. This reorders the heap so that
   * the max-heap or min-heap property still holds. Performance: O(log n).
   */
  public mutating func insert<S: Sequence>(_ sequence: S) where S.Iterator.Element == T {
    for value in sequence {
      insert(value)
    }
  }
  
  /**
   * Allows you to change an element. This reorders the heap so that
   * the max-heap or min-heap property still holds.
   */
  public mutating func replace(index i: Int, value: T) {
    guard i < nodes.count else { return }
    
    remove(at: i)
    insert(value)
  }
  
  /**
   * Removes the root node from the heap. For a max-heap, this is the maximum
   * value; for a min-heap it is the minimum value. Performance: O(log n).
   */
  @discardableResult public mutating func remove() -> T? {
    guard !nodes.isEmpty else { return nil }
    
    if nodes.count == 1 {
      return nodes.removeLast()
    } else {
      // Use the last node to replace the first one, then fix the heap by
      // shifting this new first node into its proper position.
      let value = nodes[0]
      nodes[0] = nodes.removeLast()
      shiftDown(0)
      return value
    }
  }
  
  /**
   * Removes an arbitrary node from the heap. Performance: O(log n).
   * Note that you need to know the node's index.
   */
  @discardableResult public mutating func remove(at index: Int) -> T? {
    guard index < nodes.count else { return nil }
    
    let size = nodes.count - 1
    if index != size {
      nodes.swapAt(index, size)
      shiftDown(from: index, until: size)
      shiftUp(index)
    }
    return nodes.removeLast()
  }
  
  /**
   * Takes a child node and looks at its parents; if a parent is not larger
   * (max-heap) or not smaller (min-heap) than the child, we exchange them.
   */
  internal mutating func shiftUp(_ index: Int) {
    var childIndex = index
    let child = nodes[childIndex]
    var parentIndex = self.parentIndex(ofIndex: childIndex)
    
    while childIndex > 0 && orderCriteria(child, nodes[parentIndex]) {
      nodes[childIndex] = nodes[parentIndex]
      childIndex = parentIndex
      parentIndex = self.parentIndex(ofIndex: childIndex)
    }
    
    nodes[childIndex] = child
  }
  
  /**
   * Looks at a parent node and makes sure it is still larger (max-heap) or
   * smaller (min-heap) than its childeren.
   */
  internal mutating func shiftDown(from index: Int, until endIndex: Int) {
    let leftChildIndex = self.leftChildIndex(ofIndex: index)
    let rightChildIndex = leftChildIndex + 1
    
    // Figure out which comes first if we order them by the sort function:
    // the parent, the left child, or the right child. If the parent comes
    // first, we're done. If not, that element is out-of-place and we make
    // it "float down" the tree until the heap property is restored.
    var first = index
    if leftChildIndex < endIndex && orderCriteria(nodes[leftChildIndex], nodes[first]) {
      first = leftChildIndex
    }
    if rightChildIndex < endIndex && orderCriteria(nodes[rightChildIndex], nodes[first]) {
      first = rightChildIndex
    }
    if first == index { return }
    
    nodes.swapAt(index, first)
    shiftDown(from: first, until: endIndex)
  }
  
  internal mutating func shiftDown(_ index: Int) {
    shiftDown(from: index, until: nodes.count)
  }
  
}

// MARK: - Searching

extension Heap where T: Equatable {
  
  /** Get the index of a node in the heap. Performance: O(n). */
  public func index(of node: T) -> Int? {
    return nodes.index(where: { $0 == node })
  }
  
  /** Removes the first occurrence of a node from the heap. Performance: O(n). */
  @discardableResult public mutating func remove(node: T) -> T? {
    if let index = index(of: node) {
      return remove(at: index)
    }
    return nil
  }
  
}


public struct PriorityQueue<T> {
  fileprivate var heap: Heap<T>

  /*
    To create a max-priority queue, supply a > sort function. For a min-priority
    queue, use <.
  */
  public init(sort: @escaping (T, T) -> Bool) {
    heap = Heap(sort: sort)
  }

  public var isEmpty: Bool {
    return heap.isEmpty
  }

  public var count: Int {
    return heap.count
  }

  public func peek() -> T? {
    return heap.peek()
  }

  public mutating func enqueue(_ element: T) {
    heap.insert(element)
  }

  public mutating func dequeue() -> T? {
    return heap.remove()
  }
    
    public mutating func remove(_ index:Int) -> T?{
        return heap.remove(at: index)
    }

  /*
    Allows you to change the priority of an element. In a max-priority queue,
    the new priority should be larger than the old one; in a min-priority queue
    it should be smaller.
  */
  public mutating func changePriority(index i: Int, value: T) {
    return heap.replace(index: i, value: value)
  }
}

extension PriorityQueue where T: Equatable {
  public func index(of element: T) -> Int? {
    return heap.index(of: element)
  }

}



class Solution {
    func sort(lv:Int,rv:Int) -> Bool{
        return lv > rv
    }
    var pqmin:PriorityQueue<Int>!
    var pqmax:PriorityQueue<Int>!
    /** initialize your data structure here. */
    init() {
        pqmin = PriorityQueue<Int> { (lv, rv) -> Bool in
            return lv > rv
        }
        pqmax = PriorityQueue<Int> { (lv, rv) -> Bool in
            return lv < rv
        }
    }
    func change(_ num: Int) {
        if let index = pqmax.index(of: num){
            let result = pqmax.remove(index)
            print("删除元素：\(result)")
        }else{
            let result = pqmin.remove(pqmin.index(of: num)!)
            print("删除元素：\(result)")
        }
    }
    
    func addNum(_ num: Int) {
        print("添加元素：\(num)")
        if pqmax.count > pqmin.count {
            pqmax.enqueue(num)
            pqmin.enqueue(pqmax.dequeue()!)
        }else{
            pqmin.enqueue(num)
            pqmax.enqueue(pqmin.dequeue()!)
        }
    }
    
    func findMedian() -> Double {
        if pqmax.count > pqmin.count {
            return Double(pqmax.peek()!)
        }else if(pqmax.count < pqmin.count){
            return Double(pqmin.peek()!)
        }else{
            return Double(pqmin.peek()! + pqmax.peek()!)/2
        }
    }
    
    func medianSlidingWindow(_ nums: [Int], _ k: Int) -> [Double] {
        var ans:[Double] = []
        for i in 0..<k {
            addNum(nums[i])
        }
        ans.append(self.findMedian())
        var left = 0
        var right = k - 1
        
        while right < nums.count - 1 {
            self.change(nums[left])
            self.addNum(nums[right + 1])
            ans.append(self.findMedian())
            left += 1
            right += 1
        }
        return ans
    }
}

let s = Solution()
s.medianSlidingWindow([1,3,-1,-3,5,3,6,7], 3)
