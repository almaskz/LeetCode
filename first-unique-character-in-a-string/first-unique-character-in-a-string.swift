class Solution {
    struct MyChar {
        var count: Int
        var index: Int
    }
    
    func firstUniqChar(_ s: String) -> Int {
        var map = [Character: MyChar]()
        var arr = Array(s)
        for i in 0..<arr.count {
            map[arr[i], default: MyChar(count: 0, index: i)].count += 1
            map[arr[i], default: MyChar(count: 0, index: i)].index = i
        }
        
        return map.sorted(by: { $0.value.index < $1.value.index }).first(where: { $0.value.count == 1 })?.value.index ?? -1
    }
}