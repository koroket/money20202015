//
//  CheckoutViewController.swift
//  money20202015
//
//  Created by sloot on 10/25/15.
//  Copyright © 2015 sloot. All rights reserved.
//

import UIKit

class CheckoutViewController: UIViewController {
    
    var items:[Item] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func payPressed(sender: UIButton) {
        let nextViewController = SIMChargeCardViewController(publicKey: "sbpb_NTZlYTgzMmUtOWQ0Mi00NjIyLTk5OTktMGJjNGIxMTE2ZWJj")
        nextViewController.delegate = self
        nextViewController.amount = 40.34
        self.presentViewController(nextViewController, animated: true, completion: { () -> Void in
                print("done nigah")
            })
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension CheckoutViewController : SIMChargeCardViewControllerDelegate {
    func chargeCardCancelled() {
        print("ward")
    }
    
    func creditCardTokenFailedWithError(error: NSError!) {
        print("mannn")
    }
    
    func creditCardTokenProcessed(token: SIMCreditCardToken!) {
        print("FASHOOO")
        
        //call /checkout endpoint from here
        
        var data: NSDictionary;
        let fbid = NSUserDefaults.standardUserDefaults().valueForKey("fbId") as? String ?? "";
        let url =  SERVER + "/checkout/" + fbid
        
        var arr: NSMutableArray;
        for item in items {
            data["businessId"] = "asdf";
            data["totalPrice"] = 32;
            arr.push(item);
        }
        

        Tool.callREST(data, url: url, method: "POST") { (response) -> Void in
            print(response);
        }
        
        
    }
}