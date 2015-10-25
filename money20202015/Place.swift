//
//  Bar.swift
//  money20202015
//
//  Created by sloot on 10/24/15.
//  Copyright © 2015 sloot. All rights reserved.
//

import Foundation
import MapKit
import CoreLocation

class Place : NSObject, JSONObject {
    var name:String = ""
    var isOpened:Bool = false
    var longitude:CGFloat = 0
    var latitude:CGFloat = 0
    var icon_url:String = ""
    var photoRef:String = ""
    var pid:String = ""
    
    required init(json:NSDictionary){
        self.name = json.stringValue("name")
        if let openingHours = json["opening_hours"] as? NSDictionary {
            self.isOpened = openingHours.boolValue("open_now")
        }
        if let geometry = json["geometry"] as? NSDictionary, location = geometry["location"] as? NSDictionary {
            self.longitude = location["lng"] as? CGFloat ?? 0
            self.latitude = location["lat"] as? CGFloat ?? 0
        }
        self.icon_url = json.stringValue("icon")
        self.pid = json.stringValue("id")
        if let photos = json["photos"] as? [NSDictionary], photo = photos.first {
            self.photoRef = photo.stringValue("photo_reference")
        }
    }
    
    class func getPlaces(latitude:CGFloat, longitude:CGFloat, completionHandler: (([Place]?) -> Void)) {
        //Examples https://maps.googleapis.com/maps/api/place/search/json?radius=1000&key=AIzaSyA8aOqbScPCFE1VEEf5ZsfCG8bECYi78Y0&keyword=store&location=37.7,-122.4
        let url:String = "https://maps.googleapis.com/maps/api/place/search/json?radius=1000&key=AIzaSyA8aOqbScPCFE1VEEf5ZsfCG8bECYi78Y0&keyword=store&location=\(latitude),\(longitude)"
        Tool.callREST(nil, url: url, method: "GET") { (response) -> Void in
            if let json = response as? NSDictionary, barsDict = json["results"] as? [NSDictionary] {
                var newBars:[Place] = []
                for barDict in barsDict {
                    let newBar = Place(json:barDict)
                    newBars.append(newBar)
                }
                completionHandler(newBars)
            } else {
                completionHandler(nil)
            }
        }
    }
    
    func placePhotoURL() -> String {
        if (self.photoRef as NSString).length > 0 {
            let photoURL = "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=\(self.photoRef)&sensor=false&key=AIzaSyA8aOqbScPCFE1VEEf5ZsfCG8bECYi78Y0"
            return photoURL
        } else {
            return ""
        }
    }
}