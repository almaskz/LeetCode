/**
 * // This is the robot's control interface.
 * // You should not implement it, or speculate about its implementation
 * public class Robot {
 *     // Returns true if the cell in front is open and robot moves into the cell.
 *     // Returns false if the cell in front is blocked and robot stays in the current cell.
 *     public func move() -> Bool {}
 *
 *     // Robot will stay in the same cell after calling turnLeft/turnRight.
 *     // Each turn will be 90 degrees.
 *     public func turnLeft() {}
 *     public func turnRight() {}
 *
 *     // Clean the current cell.
 *     public func clean() {}
 * }
 */

class Solution {
    var robot: Robot!
    var dirs = [(-1,0), (0,1), (1,0), (0,-1)]
    var visited = Set<[Int]>()
    
    func goBack() {
        robot.turnRight()
        robot.turnRight()
        robot.move()
        robot.turnRight()
        robot.turnRight()
    }
    
    func backtrack(_ row: Int, _ col: Int, _ d: Int) {
        visited.insert([row, col])
        robot.clean()
        // going clocksiwe
        
        for i in 0..<4 {
            var newD = (d+i) % 4
            var newRow = row + dirs[newD].0
            var newCol = col + dirs[newD].1
            
            if !visited.contains([newRow, newCol]) && robot.move() {
                backtrack(newRow, newCol, newD)
                goBack()
            }
            
            robot.turnRight()
        }
    }
    
    func cleanRoom(_ robot: Robot) {
        self.robot = robot
        backtrack(0, 0, 0)
    }
}