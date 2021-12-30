class Solution {
    func reorganizeString(_ s: String) -> String {
        var map = [Character: Int]()
    
        for i in s {
            map[i, default: 0] += 1
        }
        //print(map)
        var ans = [Character]()
        var usedChar: Character? = nil

        for _ in 0..<s.count {
            if let chToAppend = getCharacter(&map, usedChar) {
                map[chToAppend]! -= 1
                usedChar = chToAppend
                ans.append(chToAppend)
            } else {
                return ""
            }
        }

        return String(ans)
    }

    func getCharacter(_ map: inout [Character: Int], _ usedCh: Character?) -> Character? {
        if let used = usedCh {
            return map.sorted(by: { $0.value > $1.value }).first(where: { $0.key != used && $0.value > 0 })?.key
        } else {
            return map.sorted(by: { $0.value > $1.value }).first(where: { $0.value > 0 })?.key
        }
    }
}