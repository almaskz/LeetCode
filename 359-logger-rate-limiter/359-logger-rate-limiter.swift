
class Logger {
    
    private var dict: [String: Int]
    private let kDelay: Int

    init() {
        dict = [String: Int]()
        kDelay = 10
    }
    
    func shouldPrintMessage(_ timestamp: Int, _ message: String) -> Bool {
        if let nextTime = dict[message], timestamp < nextTime {
            return false
        }
        dict[message] = timestamp + kDelay
        return true
    }
}

/**
 * Your Logger object will be instantiated and called as such:
 * let obj = Logger()
 * let ret_1: Bool = obj.shouldPrintMessage(timestamp, message)
 */