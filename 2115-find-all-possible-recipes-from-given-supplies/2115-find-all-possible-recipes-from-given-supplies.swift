class Solution {
    func findAllRecipes(_ recipes: [String], _ ingredients: [[String]], _ supplies: [String]) -> [String] {
        /*
        recipes = ["bread","sandwich"], 
        ingredients = [["yeast","flour"],["bread","meat"]], 
        supplies = ["yeast","flour","meat"]
        Output: ["bread","sandwich"]

        1) put all supplies in a hashset
        2) do while (we add somthing to the supplies)
            if set of my supplies contains ingredients for this we add it to the supplies
        */
        
        var mySupplies = Set(supplies)
        var didAddNewSupply = false
        repeat {
            didAddNewSupply = false   
            for i in 0..<ingredients.count {
                guard mySupplies.contains(recipes[i]) == false else { continue }
                let oneRecipeIngredients = Set(ingredients[i])
                if oneRecipeIngredients.isSubset(of: mySupplies) {
                    mySupplies.insert(recipes[i])
                    didAddNewSupply = true
                } 
            }
        } while didAddNewSupply 
    
        let answer = mySupplies.intersection(Set(recipes))
        return Array(answer)
    }
}