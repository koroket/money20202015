//
//  ViewController.swift
//  money20202015
//
//  Created by sloot on 10/24/15.
//  Copyright © 2015 sloot. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, FBSDKLoginButtonDelegate {
    
    var fbButton:FBSDKLoginButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let newFBButton = FBSDKLoginButton()
        newFBButton.delegate = self
        fbButton = newFBButton
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func loginPressed(sender: AnyObject) {
        fbButton?.sendActionsForControlEvents(UIControlEvents.TouchUpInside)
    }
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        
        NSUserDefaults.standardUserDefaults().setValue(result.token.userID, forKey: "fbId")
        NSUserDefaults.standardUserDefaults().synchronize();
        
        var fbId = NSUserDefaults.standardUserDefaults().valueForKey("fbId") as? String
        print(fbId)
        login(result.token.userID)
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        print("logout")
    }
}

//Server Related
extension LoginViewController {
    func login(fbid:String){
        let url:String = SERVER + "/login/" + fbid;
        print(url)
        Tool.callREST(nil, url: url, method: "POST") { (response) -> Void in
            print(response)
            if let jsonArr = response as? NSArray, json = jsonArr[0] as? NSDictionary {
                print(json);
                print("login success")
                print(json["type"] as? String ?? "")
                let type = json["type"] as? String ?? ""
                if type == "" {
                    //take to selection screen
                    print("choose usage controller")
                    if let nextViewController = "ChooseUsageViewController".loadNib() as? ChooseUsageViewController {
                        self.presentViewController(nextViewController, animated: true, completion: { () -> Void in
                            print("done nigah")
                        })
                    }
                }
                else if type == "Consumer" {
                    //take to consumer screen
                    if let nextViewController = "ChooseUsageViewController".loadNib() as? ChooseUsageViewController {
                        self.presentViewController(nextViewController, animated: true, completion: { () -> Void in
                            print("done nigah")
                        })
                    }
                }
                else if type == "Business" {
                    //take to business screen
                    if let nextViewController = "ChooseUsageViewController".loadNib() as? ChooseUsageViewController {
                        self.presentViewController(nextViewController, animated: true, completion: { () -> Void in
                            print("done nigah")
                        })
                    }
                }
                
            } else {
                print("login failed")
            }
        }
    }
}

