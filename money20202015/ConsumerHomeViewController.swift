//
//  ConsumerHomeViewController.swift
//  money20202015
//
//  Created by sloot on 10/25/15.
//  Copyright © 2015 sloot. All rights reserved.
//

import UIKit

class ConsumerHomeViewController: UIViewController {

    @IBOutlet var profileImageView: UIImageView!
    
    @IBAction func backPressed(sender: UIButton) {
        self.dismissViewControllerAnimated(true) { () -> Void in
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let fbid = NSUserDefaults.standardUserDefaults().valueForKey("fbId") as? String {
            profileImageView.smartLoad("https://graph.facebook.com/" + fbid + "/picture?type=square")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func scanPressed(sender: UIButton) {
        if let nextViewController = "SearchPlacesViewController".loadNib() as? SearchPlacesViewController {
            nextViewController.isConsumer = true
            self.presentViewController(nextViewController, animated: true, completion: { () -> Void in
                print("done nigah")
            })
        } else {
            print("failed loading SearchPlacesViewController")
        }
    }
    
    @IBAction func feedPressed(sender: UIButton) {
        
    }
    
    @IBAction func showDataPressed(sender: UIButton) {
        
    }
    
    @IBAction func settingsPressed(sender: UIButton) {
        
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
