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

        login(result.token.userID)
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        print("logout")
    }
}

//Server Related
extension LoginViewController {
    func login(fbid:String){
        let url:String = SERVER + "/login.json?fbid=" + fbid
        Tool.callREST(nil, url: url, method: "POST") { (response) -> Void in
            if let json = response as? NSDictionary {
                print(json)
//                saveCookies()
//                self.performSegueWithIdentifier("loginSuccessful", sender: self)
                print("login success")
            } else {
                print("login failed")
            }
        }
    }
}

