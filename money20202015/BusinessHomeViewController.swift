//
//  BusinessHomeViewController.swift
//  money20202015
//
//  Created by sloot on 10/25/15.
//  Copyright © 2015 sloot. All rights reserved.
//

import UIKit

class BusinessHomeViewController: UIViewController {

    @IBAction func backPressed(sender: UIButton) {
        self.dismissViewControllerAnimated(true) { () -> Void in
            
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
    

    @IBAction func addItemPressed(sender: UIButton) {
        if let nextViewController = "NewItemViewController".loadNib() as? NewItemViewController {
            self.presentViewController(nextViewController, animated: true, completion: { () -> Void in
                print("done nigah")
            })
        } else {
            print("failed loading NewItemViewController")
        }
    }
    
    @IBAction func showDataPressed(sender: UIButton) {
        
    }
    
    @IBAction func showQueuePressed(sender: UIButton) {
        
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
