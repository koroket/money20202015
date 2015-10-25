//
//  Extension.swift
//  money20202015
//
//  Created by sloot on 10/24/15.
//  Copyright © 2015 sloot. All rights reserved.
//

import Foundation

extension String {
    func loadNib() -> AnyObject? {
        let nib:UINib = UINib(nibName: self, bundle: nil)
        return nib.instantiateWithOwner(nil, options: nil).last
    }
}

extension UIView {
    func circleCrop() {
        self.clipsToBounds = true
        self.layer.cornerRadius = self.frame.width/2.0
    }
    
    func createBorder(radius:CGFloat, color:UIColor, width:CGFloat) {
        self.clipsToBounds = true
        self.layer.cornerRadius = radius
        self.layer.borderColor = color.CGColor
        self.layer.borderWidth = width
    }
}

var imageCache:NSCache = NSCache()
extension UIImageView {
    func smartLoad(imgurl:String){
        image = nil
        
        let newtag = Int(arc4random_uniform(1048575))
        tag = newtag
        if let img = imageCache.objectForKey(imgurl) as? UIImage {
            self.image = img
        } else {
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)){
                if let url = NSURL(string: imgurl) {
                    let request: NSURLRequest = NSURLRequest(URL: url)
                    NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler: { (response, data, error) -> Void in
                        if error == nil {
                            if let data = data, retrievedImage = UIImage(data: data) {
                                if self.tag == newtag {
                                    dispatch_async(dispatch_get_main_queue()){
                                        self.image = retrievedImage
                                    }
                                }
                                imageCache.setObject(retrievedImage, forKey: imgurl, cost: 0)
                            }
                        }
                    })
                }
            }
        }
    }
}

extension UITextView {
    func setBody(newText:String){
        editable = true
        text = newText
        editable = false
    }
}