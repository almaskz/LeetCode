class Solution {
    func trap(_ height: [Int]) -> Int {
        var maxFromLeft = [0]
        var maxSoFar = height[0]
        for i in 1..<height.count {
            maxFromLeft.append(maxSoFar)
            maxSoFar = max(maxSoFar, height[i])
        }
        //print("maxFromLeft:\n\(maxFromLeft)")
        var maxFromRight = Array(repeating: 0, count: height.count)
        maxSoFar = height[height.count-1]
        for i in stride(from: height.count-2, through: 0, by: -1) {
            maxFromRight[i] = maxSoFar
            maxSoFar = max(maxSoFar, height[i])
        }
        //print("maxFromRight:\n\(maxFromRight)")
        
        var count = 0
        for i in 0..<maxFromLeft.count {
            let canTrap = min(maxFromLeft[i], maxFromRight[i]) - height[i]
            if canTrap > 0 {
                count += canTrap
            }
        }
        return count
    }
}