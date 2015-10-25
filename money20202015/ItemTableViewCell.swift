//
//  ItemTableViewCell.swift
//  money20202015
//
//  Created by sloot on 10/25/15.
//  Copyright © 2015 sloot. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    @IBOutlet var nameLabel: UILabel!
    
    @IBOutlet var priceLabel: UILabel!
    
    @IBOutlet var countLabel: UILabel!
    
    var itemid:String = ""
    
    @IBAction func plusPressed(sender: UIButton) {
        if let vc = sharedCameraViewController {
            if let num = vc.itemCountHash[itemid] as? Int {
                vc.itemCountHash[itemid] = num + 1
                vc.listTableView.reloadData()
            }
        }
        if let vc = sharedCheckoutViewCotroller {
            vc.listTableView.reloadData()
        }
    }
    
    @IBAction func minusPressed(sender: UIButton) {
        if let vc = sharedCameraViewController {
            if let num = vc.itemCountHash[itemid] as? Int {
                vc.itemCountHash[itemid] = num - 1
                vc.listTableView.reloadData()
            }
        }
        if let vc = sharedCheckoutViewCotroller {
            vc.listTableView.reloadData()
        }
    }
    
}
