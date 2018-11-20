//
//  Beer.swift
//  rootbeer-swift
//
//  Created by eidoshack on 11/20/18.
//  Copyright © 2018 PADC. All rights reserved.
//

import Foundation
import SwiftyJSON

class Beer {
    
    var image: String? = nil
    
    var name: String? = nil
    
    var tagline: String? = nil
    
    var firstBrewed: String? = nil
    
    var desc: String? = nil
    
    var ingredients: Ingredients? = nil
    
    var foodPairing: [String] = []
    
    var brewersTips: String? = nil
    
    var contributedBy: String? = nil
    
    static func parseToBeer(_ data: JSON) -> Beer {
        
        let beer = Beer()
        
        beer.image = data["image_url"].string
        beer.name = data["name"].string
        beer.tagline = data["tagline"].string
        beer.firstBrewed = data["first_brewed"].string
        beer.desc = data["description"].string
        beer.ingredients = data["ingredients"].object as? Ingredients
        beer.foodPairing = data["food_pairing"].object as! [String]
        beer.brewersTips = data["brewers_tips"].string
        beer.contributedBy = data["contributed_by"].string
        
        return beer
    }
    
}
