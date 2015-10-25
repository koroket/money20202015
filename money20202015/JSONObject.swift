//
//  JSONObject.swift
//  money20202015
//
//  Created by sloot on 10/24/15.
//  Copyright © 2015 sloot. All rights reserved.
//

import Foundation

protocol JSONObject {
    init(json:NSDictionary)
}

/**
Extension of NSDictionary to help parse json
*/
extension NSDictionary {

    func boolValue(key:String) -> Bool {
        if let value = self[key] as? Bool {
            return value
        } else {
            return (self[key] as? String ?? "false") == "true"
        }
    }
    
    func stringValue(key:String) -> String {
        if let value = self[key] as? String {
            return value
        } else {
            let anyObj:AnyObject = self[key] ?? ""
            let str:String = "\(anyObj)"
            return str
        }
    }
}
