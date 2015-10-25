//
//  ChooseUsageViewController.swift
//  money20202015
//
//  Created by sloot on 10/25/15.
//  Copyright © 2015 sloot. All rights reserved.
//

import UIKit

class ChooseUsageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func continueAsConsumer(sender: UIButton) {
        markType("Consumer");
//        if let nextViewController = "CameraViewController".loadNib() as? CameraViewController {
//            self.presentViewController(nextViewController, animated: true, completion: { () -> Void in
//                print("done nigah")
//            })
//        } else {
//            print("failed loading CameraViewController")
//        }
        if let nextViewController = "ConsumerHomeViewController".loadNib() as? ConsumerHomeViewController {
            self.presentViewController(nextViewController, animated: true, completion: { () -> Void in
                print("done nigah")
            })
        } else {
            print("failed loading ConsumerHomeViewController")
        }
    }
    
    @IBAction func continueAsBusiness(sender: UIButton) {
        markType("Business")
        if let nextViewController = "SearchPlacesViewController".loadNib() as? SearchPlacesViewController {
            nextViewController.isConsumer = false
            self.presentViewController(nextViewController, animated: true, completion: { () -> Void in
                print("done nigah")
            })
        } else {
            print("failed loading SearchPlacesViewController")
        }
    }
    
    func markType(type:String){
        
        //call api to update type
        let fbId = NSUserDefaults.standardUserDefaults().valueForKey("fbId") as? String ?? ""
        let url = SERVER + "/markType/\(fbId)/\(type)";
        
        Tool.callREST(nil, url: url, method: "POST") { (response) -> Void in
            print(response)
        }
        
    }

}
