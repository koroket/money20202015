//
//  Item.swift
//  money20202015
//
//  Created by sloot on 10/25/15.
//  Copyright © 2015 sloot. All rights reserved.
//

import Foundation

class Item : NSObject, JSONObject {
    var itemid:String = ""
    var name:String = ""
    var category:String = ""
    var price:String = ""
    
    required init(json:NSDictionary){
        self.name = json.stringValue("item")
        self.price = json.stringValue("price")
        self.category = json.stringValue("price")
        self.itemid = json.stringValue("_id")
    }
}