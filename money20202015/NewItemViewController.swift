//
//  NewItemViewController.swift
//  money20202015
//
//  Created by sloot on 10/24/15.
//  Copyright © 2015 sloot. All rights reserved.
//

import UIKit

class NewItemViewController: UIViewController {

    @IBOutlet var nameTextField: UITextField!
    
    @IBOutlet var priceTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func generatePressed(sender: UIButton) {
        postItem()
    }
    
    func postItem(){
        //send info to server and recieve back itemid
        let itemid = "MASA_SWERVE"
        presentQR(itemid)
    }
    
    func presentQR(itemid:String){
        if let nextViewController = "DisplayQRViewController".loadNib() as? DisplayQRViewController {
            nextViewController.itemid = itemid
            self.presentViewController(nextViewController, animated: true, completion: { () -> Void in
                print("done nigah")
            })
        } else {
            print("failed loading DisplayQRViewController")
        }
    }
}
