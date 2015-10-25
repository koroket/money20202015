//
//  CheckoutViewController.swift
//  money20202015
//
//  Created by sloot on 10/25/15.
//  Copyright © 2015 sloot. All rights reserved.
//

import UIKit

weak var sharedCheckoutViewCotroller:CheckoutViewController?

class CheckoutViewController: UIViewController {
    
    @IBAction func backPressed(sender: UIButton) {
        self.dismissViewControllerAnimated(true) { () -> Void in
            
        }
    }
    
    var items:[Item] = []

    var totalPrice:Double = 0.0;
    
    var itemCountHash:NSMutableDictionary = NSMutableDictionary()
    
    var mainData:NSMutableDictionary = NSMutableDictionary()
    
    var arr: NSMutableArray = NSMutableArray()
    
    @IBOutlet var listTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "ItemTableViewCell", bundle: nil)
        listTableView.registerNib(nib,
            forCellReuseIdentifier: "itemCell")
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        sharedCheckoutViewCotroller = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func payPressed(sender: UIButton) {
        totalPrice = 0.0;
        
        arr = NSMutableArray()
        for item in items {
            var data: NSMutableDictionary = NSMutableDictionary()
            data["itemId"] = item.itemid;
            data["count"] = 1;
            arr.addObject(data)
            let numCount:Int = itemCountHash[item.itemid] as? Int ?? 1
            totalPrice += (((Double(item.price) ?? 0.0) * Double(numCount)) ?? 0);
        }
        let nextViewController = SIMChargeCardViewController(publicKey: "sbpb_NTZlYTgzMmUtOWQ0Mi00NjIyLTk5OTktMGJjNGIxMTE2ZWJj")
        nextViewController.delegate = self
        nextViewController.amount = NSDecimalNumber(double: totalPrice / 100.0)
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
        
        let fbid = NSUserDefaults.standardUserDefaults().valueForKey("fbId") as? String ?? "";
        let url =  SERVER + "/checkout/" + fbid
        

        
        mainData["businessId"] = NSUserDefaults.standardUserDefaults().valueForKey("businessId") as? String
        mainData["totalPrice"] = totalPrice;
        mainData["items"] = arr;
        
        Tool.callREST(mainData, url: url, method: "POST") { (response) -> Void in
            print(response);
        }
        
        
    }
}

extension CheckoutViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.0
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.0
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100.0
    }
    
    func tableView(tableView: UITableView,
        didSelectRowAtIndexPath indexPath: NSIndexPath) {
            
    }
    
    func tableView(tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            let cell:ItemTableViewCell = tableView.dequeueReusableCellWithIdentifier(
                "itemCell",
                forIndexPath: indexPath) as! ItemTableViewCell
            let item = items[indexPath.row]
            cell.nameLabel.text = item.name
            cell.priceLabel.text = item.price
            cell.itemid = item.itemid
            if (item.price as NSString).length >= 3 {
                let front = (item.price as NSString).substringToIndex((item.price as NSString).length - 2)
                let end = (item.price as NSString).substringFromIndex((item.price as NSString).length - 2)
                cell.priceLabel.text = "$" + front + "." + end
            }
            cell.countLabel.text = "\(itemCountHash[item.itemid] as? Int ?? 0)" ?? "0"
            return cell
    }
}