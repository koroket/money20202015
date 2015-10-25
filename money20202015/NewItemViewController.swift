//
//  NewItemViewController.swift
//  money20202015
//
//  Created by sloot on 10/24/15.
//  Copyright © 2015 sloot. All rights reserved.
//

import UIKit

var myNumSet:NSCharacterSet = NSCharacterSet(charactersInString: "0123456789").invertedSet

weak var sharedNewItemViewController:NewItemViewController?

class NewItemViewController: UIViewController {

    @IBAction func backPressed(sender: UIButton) {
        self.dismissViewControllerAnimated(true) { () -> Void in
            
        }
    }
    
    @IBOutlet var nameTextField: UITextField!
    
    @IBOutlet var priceTextField: UITextField!
    
    @IBOutlet weak var categoryTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        sharedNewItemViewController = self
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
        
        let url = SERVER + "/createItem/" + (NSUserDefaults.standardUserDefaults().valueForKey("businessId") as? String ?? "");
        let data = NSMutableDictionary();
        data["item"] = self.nameTextField.text ?? "";
        let m:NSArray = (self.priceTextField.text ?? "").componentsSeparatedByCharactersInSet(myNumSet)
        data["price"] = m.componentsJoinedByString("");
        data["category"] = self.categoryTextField.text ?? "";
        
        Tool.callREST(data, url: url, method: "POST") { (response) -> Void in
            print(response);
            if let json = response as? NSDictionary {
                print("Object created!");
                print(json["_id"] as? String ?? "")
                
                let item = Item(json: json)
                self.presentQR(item);
            } else {
                print("Could not create object or retrieve ID.")
            }
        }
    }
    
    func presentQR(item:Item){
        if let nextViewController = "DisplayQRViewController".loadNib() as? DisplayQRViewController {
            nextViewController.itemid = item.itemid
            nextViewController.item = item
            self.presentViewController(nextViewController, animated: true, completion: { () -> Void in
                print("done nigah")
            })
        } else {
            print("failed loading DisplayQRViewController")
        }
    }
}
