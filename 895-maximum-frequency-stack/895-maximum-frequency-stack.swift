
class FreqStack {
    
    private var freqs = [Int: Int]()    // val  : freq
    private var group = [Int: [Int]]()  // freq : group of freqs
    private var maxFreq = 0
    init() {
        
    }
    
    func push(_ val: Int) {
        let newFreq: Int
        if let freq = freqs[val] {
            newFreq = freq + 1
        } else {
            newFreq = 1
        }
        freqs[val] = newFreq
        maxFreq = max(maxFreq, newFreq)
        group[newFreq, default: [Int]()].append(val)
    }
    
    func pop() -> Int {
        let elem = group[maxFreq]!.removeLast()
        if group[maxFreq]!.isEmpty {
            group[maxFreq] = nil
            maxFreq -= 1
        }
        freqs[elem]! -= 1 
        return elem
    }
}

/**
 * Your FreqStack object will be instantiated and called as such:
 * let obj = FreqStack()
 * obj.push(val)
 * let ret_2: Int = obj.pop()
 */