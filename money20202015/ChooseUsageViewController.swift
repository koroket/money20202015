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
        if let nextViewController = "CameraViewController".loadNib() as? CameraViewController {
            self.presentViewController(nextViewController, animated: true, completion: { () -> Void in
                print("done nigah")
            })
        } else {
            print("failed loading CameraViewController")
        }
    }
    
    @IBAction func continueAsBusiness(sender: UIButton) {
        if let nextViewController = "NewItemViewController".loadNib() as? NewItemViewController {
            self.presentViewController(nextViewController, animated: true, completion: { () -> Void in
                print("done nigah")
            })
        } else {
            print("failed loading NewItemViewController")
        }
    }
    
}
