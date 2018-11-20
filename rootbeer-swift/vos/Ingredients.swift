//
//  Ingredient.swift
//  rootbeer-swift
//
//  Created by eidoshack on 11/20/18.
//  Copyright © 2018 PADC. All rights reserved.
//

import Foundation
import SwiftyJSON

class Ingredients {
    
    var malt: [Ingredient] = []
    
    var hops: [Ingredient] = []
    
    static func parseToIngredients(_ data: JSON) -> Ingredients {
        
        let ingredients = Ingredients()
        
        ingredients.malt = [data["malt"].object as! Ingredient]
        ingredients.hops = [data["hops"].object as! Ingredient]
        
        return ingredients
        
    }
    
}
