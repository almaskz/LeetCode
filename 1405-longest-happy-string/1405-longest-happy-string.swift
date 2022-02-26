class Solution {
    func longestDiverseString(_ a: Int, _ b: Int, _ c: Int) -> String {
        //a = 1, b = 1, c = 7
        // ccaccbcc
        //
        // a = 7, b = 1, c = 0
        // aabaa
        var str = [Character]()
        
        var aCount = a
        var bCount = b
        var cCount = c
        
        var cantUse: Character? = nil
        while let next = getNext(&aCount, &bCount, &cCount, cantUse) {
            str.append(next)
            if str.count > 1 && str[str.count-1] == str[str.count-2] {
                cantUse = next
            } else {
                cantUse = nil
            }
        }
        return String(str)
    }
    
    func getNext(_ a: inout Int, _ b: inout Int, _ c: inout Int, _ cantUse: Character?) -> Character? {
        guard a > 0 || b > 0 || c > 0 else { return nil }
        if a >= b && a >= c {
            if a > 0 && "a" != cantUse {
                a -= 1
                return "a"
            } else if b > 0 && b >= c {
                b -= 1
                return "b"
            } else if c > 0 {
                c -= 1
                return "c"
            } else {
                return nil
            }
        } else if b >= a && b >= c {
            if b > 0 && "b" != cantUse {
                b -= 1
                return "b"
            } else if a > 0 && a >= c {
                a -= 1
                return "a"
            } else if c > 0 {
                c -= 1
                return "c"
            } else {
                return nil
            }
        } else if c >= a && c >= b {
            if c > 0 && "c" != cantUse {
                c -= 1
                return "c"
            } else if a > 0 && a >= b {
                a -= 1
                return "a"
            } else if b > 0 {
                b -= 1
                return "b"
            } else {
                 return nil
            }
        } else {
            return nil
        }
    }
}