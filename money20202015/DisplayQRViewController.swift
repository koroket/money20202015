//
//  DisplayQRController.swift
//  money20202015
//
//  Created by sloot on 10/24/15.
//  Copyright © 2015 sloot. All rights reserved.
//

import UIKit

class DisplayQRViewController: UIViewController {

    @IBAction func backPressed(sender: UIButton) {
        self.dismissViewControllerAnimated(true) { () -> Void in
            
        }
    }
    
    @IBOutlet var qrImageView: UIImageView!
    
    @IBOutlet var nameLabel: UILabel!
    
    @IBOutlet var priceLabel: UILabel!
    
    @IBAction func addAnotherPressed(sender: UIButton) {
        if let vc = sharedNewItemViewController {
            vc.nameTextField.text = ""
            vc.priceTextField.text = ""
            vc.categoryTextField.text = ""
        }
        self.dismissViewControllerAnimated(true) { () -> Void in
            
        }
    }
    
    var itemid:String?
    
    var item:Item? {
        didSet {
            if let item = item {
                nameLabel.text = item.name
                if (item.price as NSString).length >= 3 {
                    let front = (item.price as NSString).substringToIndex((item.price as NSString).length - 2)
                    let end = (item.price as NSString).substringFromIndex((item.price as NSString).length - 2)
                    priceLabel.text = "$" + front + "." + end
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        loadQR()
    }
    
    func loadQR(){
        if let itemid = itemid {
            let baseURL = "http://api.qrserver.com/v1/create-qr-code/?data=\(itemid)&size=100x100"
            qrImageView.smartLoad(baseURL)
        } else {
            print("itemid was empty")
        }
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
