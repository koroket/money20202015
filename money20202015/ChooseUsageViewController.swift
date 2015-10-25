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
        if let nextViewController = "SearchPlacesViewController".loadNib() as? SearchPlacesViewController {
            nextViewController.isConsumer = true
            self.presentViewController(nextViewController, animated: true, completion: { () -> Void in
                print("done nigah")
            })
        } else {
            print("failed loading SearchPlacesViewController")
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
//        let data = NSMutableDictionary();
//        data["item"] = self.nameTextField.text ?? "";
//        data["price"] = self.priceTextField.text ?? "";
//        data["category"] = self.categoryTextField.text ?? "";
        
        //call api to update type
        var fbid = NSUserDefaults.standardUserDefaults().valueForKey("fbId")
        
    }

}
