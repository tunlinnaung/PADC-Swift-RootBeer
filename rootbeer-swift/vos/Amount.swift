//
//  Amount.swift
//  rootbeer-swift
//
//  Created by eidoshack on 11/20/18.
//  Copyright © 2018 PADC. All rights reserved.
//

import Foundation
import SwiftyJSON

class Amount {
    
    var value: Double? = 0.0
    
    var unit: String? = nil
    
    static func parseToAmount(_ data: JSON) -> Amount {
        
        let amount = Amount()
        
        amount.value = data["value"].double
        amount.unit = data["unit"].string
        
        return amount
        
    }
    
}
