
class StockSpanner {
    struct PriceSpan {
        var price: Int
        var span: Int
    }
    
    var stack: [PriceSpan]

    init() {
        stack = [PriceSpan]()
    }
    
    func next(_ price: Int) -> Int {
        if stack.isEmpty {
            stack.append(PriceSpan(price: price, span: 1))
            return 1
        } else if price < stack[stack.count - 1].price {
            stack.append(PriceSpan(price: price, span: 1))
            return 1
        } else {
            var lastPriceSpan = stack.removeLast()
            var curSpan = lastPriceSpan.span + 1
            while stack.isEmpty == false && price >= stack[stack.count-1].price {
                lastPriceSpan = stack.removeLast()
                curSpan += lastPriceSpan.span
            }
            stack.append(PriceSpan(price: price, span: curSpan))
            return curSpan
        }
    }
}

/**
 * Your StockSpanner object will be instantiated and called as such:
 * let obj = StockSpanner()
 * let ret_1: Int = obj.next(price)
 */