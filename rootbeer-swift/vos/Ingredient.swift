//
//  Ingredient.swift
//  rootbeer-swift
//
//  Created by eidoshack on 11/20/18.
//  Copyright © 2018 PADC. All rights reserved.
//

import Foundation
import SwiftyJSON

class Ingredient {
    
    var name: String? = nil
    
    var amount: Amount? = nil
    
    var add: String? = nil
    
    var attribute: String? = nil
    
    static func paresToIngredient(_ data: JSON) -> Ingredient {
        
        let ingredient = Ingredient()
        
        ingredient.name = data["name"].string
        ingredient.amount = data["amount"].object as? Amount
        ingredient.add = data["add"].string
        ingredient.attribute = data["attribute"].string
        
        return ingredient
        
    }
    
}
