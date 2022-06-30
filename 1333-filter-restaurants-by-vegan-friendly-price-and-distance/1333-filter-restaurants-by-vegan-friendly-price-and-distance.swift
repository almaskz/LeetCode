class Solution {
    struct Resturant: Comparable  {
        let id: Int
        let rating: Int
        let veganFriendly: Int
        let price: Int
        let distance: Int
        
        static func < (lhs: Resturant, rhs: Resturant) -> Bool {
            if lhs.rating != rhs.rating {
                return lhs.rating > rhs.rating
            } else {
                return lhs.id > rhs.id
            }
        }
    } 
    
    func filterRestaurants(_ restaurants: [[Int]], _ veganFriendly: Int, _ maxPrice: Int, _ maxDistance: Int) -> [Int] {
        
        var filted = [Resturant]()
        for item in restaurants {
            let rest = Resturant(
                id: item[0], 
                rating: item[1],
                veganFriendly: item[2],
                price: item[3],
                distance: item[4]
            )
            if (veganFriendly == 0 || rest.veganFriendly == veganFriendly) && 
                rest.price <= maxPrice && rest.distance <= maxDistance {    
                filted.append(rest)      
            }
        }
        
        let sorted = filted.sorted { $0 < $1 }
        return sorted.map { $0.id }
    }
}