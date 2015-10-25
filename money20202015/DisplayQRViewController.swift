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
    
    var itemid:String?
    
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
