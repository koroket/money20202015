//
//  Tool.swift
//  money20202015
//
//  Created by sloot on 10/24/15.
//  Copyright © 2015 sloot. All rights reserved.
//

import UIKit
import Foundation

private let _ToolSharedInstance = Tool()
private let _StandardUserDefaultsInstance = NSUserDefaults.standardUserDefaults()
private let SESSION_NAME:String = "_session"
var SERVERNAME = "localhost:8080"
//var SERVER = "http://localhost:8080"
var SERVER = "https://dutrprzhcf.localtunnel.me"


class Tool {
    class var sharedInstance: Tool {
        return _ToolSharedInstance
    }
    
    class func callREST(params : NSDictionary?, url : String, method: String, completionHandler: ((AnyObject?) -> Void)?) {
        let request = NSMutableURLRequest(URL: NSURL(string: url)!)
        request.URL = NSURL(string: url)!
        let session = NSURLSession.sharedSession()
        request.HTTPMethod = method
        if(params != nil){
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            do {
                request.HTTPBody = try NSJSONSerialization.dataWithJSONObject(params!, options: [])
            } catch let parseError {
                print(parseError)
            }
        }
        let task = session.dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
            do {
                if let completion = completionHandler {
                    if let data = data {
                        let json: AnyObject? = try NSJSONSerialization.JSONObjectWithData(data, options: .MutableLeaves)
                        dispatch_async(dispatch_get_main_queue()){
                            if let parseJSON: AnyObject = json {
                                completion(parseJSON)
                            } else {
                                completion(nil)
                            }
                        }
                    } else {
                        completion(nil)
                    }
                }
            } catch let parseError {
                print(parseError)
            }
        })
        task.resume()
    }
    
    class func userDefaults() -> NSUserDefaults {
        return _StandardUserDefaultsInstance
    }
}

func setUpCookie() -> Bool {
    let userProfile = Tool.userDefaults()
    var cookieProperties:[String : AnyObject] = [:]
    cookieProperties[NSHTTPCookieDomain] = SERVERNAME
    cookieProperties[NSHTTPCookiePath] = "/"
    if(userProfile.stringForKey(SESSION_NAME) != nil){
        cookieProperties[NSHTTPCookieValue] = userProfile.stringForKey(SESSION_NAME)
        cookieProperties[NSHTTPCookieName] = SESSION_NAME
        
        if let cookie:NSHTTPCookie = NSHTTPCookie(properties: cookieProperties) {
            NSHTTPCookieStorage.sharedHTTPCookieStorage().setCookie(cookie)
        }
        return true
    } else {
        return false
    }
}

func saveCookies() {
    let storage:NSHTTPCookieStorage = NSHTTPCookieStorage.sharedHTTPCookieStorage()
    
    let cookieArray:NSArray = storage.cookies!
    
    let userProfile = Tool.userDefaults()
    
    for cookie in cookieArray{
        if(cookie.name == SESSION_NAME){
            userProfile.setObject((cookie as! NSHTTPCookie).value, forKey: SESSION_NAME)
        }
    }
    Tool.userDefaults().synchronize()
}

func clearCookies(){
    let storage:NSHTTPCookieStorage = NSHTTPCookieStorage.sharedHTTPCookieStorage()
    let cookieArray:NSArray = storage.cookies!
    for cookie in cookieArray{
        storage.deleteCookie(cookie as! NSHTTPCookie)
    }
    NSUserDefaults.standardUserDefaults().synchronize()
    Tool.userDefaults().removeObjectForKey(SESSION_NAME)
    Tool.userDefaults().synchronize()
}
