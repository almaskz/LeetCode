class Codec {
    func encode(_ strs: [String]) -> String {
        var encode = ""
        for word in strs {
            encode += "\(word.count)#\(word)"
        }
        return encode
    }
    
    func decode(_ s: String) -> [String] {
        var encoded = [String]()
        var arr = Array(s)
        var l = 0
        // 012345678
        // 5#Hello5#World"
        //   l 
        while l < arr.count {
            var num = 0
            while let digit = arr[l].wholeNumberValue {
                num = num*10 + digit 
                l += 1
            }
            l += 1
            var word = String(arr[l..<(l+num)])
            encoded.append(word)
            l += num
        }
        
        return encoded
    }
}

/**
 * Your Codec object will be instantiated and called as such:
 * let obj = Codec()
 * val s = obj.encode(strs)
 * let ans = obj.decode(s)
*/