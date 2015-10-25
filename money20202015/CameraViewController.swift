//
//  CameraViewController.swift
//  money20202015
//
//  Created by sloot on 10/24/15.
//  Copyright © 2015 sloot. All rights reserved.
//

import AVFoundation

let SLIDE_ANIMATION_DURATION:NSTimeInterval = 0.4

weak var sharedCameraViewController:CameraViewController?

class CameraViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    
    @IBAction func backPressed(sender: UIButton) {
        self.dismissViewControllerAnimated(true) { () -> Void in
            
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        sharedCameraViewController = self
    }
    
    var items:[Item] = []
    
    //Maps itemid to the number of items
    var itemCountHash:NSMutableDictionary = NSMutableDictionary()
    
    @IBOutlet var cameraView: UIView!
    
    @IBOutlet var cameraViewHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet var listTableViewTopConstraint: NSLayoutConstraint!
    
    @IBOutlet var listTableView: UITableView!
    
    @IBOutlet var switchCameraButton: UIButton!
    
    var captureSession:AVCaptureSession?
    var videoPreviewLayer:AVCaptureVideoPreviewLayer?
    var qrCodeFrameView:UIView?
    
    var isShowingQR:Bool = false {
        didSet {
            if isShowingQR {
                shiftDown()
            } else {
                shiftUp()
            }
        }
    }
    
    var occupied:Bool = false
    
    func shiftDown(){
        occupied = true
        view.layoutIfNeeded()
        listTableViewTopConstraint.constant = cameraViewHeightConstraint.constant
        UIView.animateWithDuration(SLIDE_ANIMATION_DURATION, animations: { () -> Void in
            self.view.layoutIfNeeded()
            }) { (done) -> Void in
            self.occupied = false
            //self.switchCameraButton.setTitle("Close Camera", forState: .Normal)
        }
    }
    
    func shiftUp(){
        occupied = true
        view.layoutIfNeeded()
        listTableViewTopConstraint.constant = 0
        UIView.animateWithDuration(SLIDE_ANIMATION_DURATION, animations: { () -> Void in
            self.view.layoutIfNeeded()
            }) { (done) -> Void in
                self.occupied = false
                //self.switchCameraButton.setTitle("Scan QR Code", forState: .Normal)
        }
    }
    
    func getItemData(itemid:String){

        //print(itemid);
        
        //run when backend can be connected
        let url = SERVER + "/getItemInfo/" + itemid;
            
            if self.itemCountHash[itemid] == nil {
                self.itemCountHash[itemid] = 1
                //Talk to server then create Item object and then call addItem
                
                let url = SERVER + "/getItemInfo/" + itemid;
                
                Tool.callREST(nil, url: url, method: "GET") { (response) -> Void in
                    print(response)
                    if let responseArr = response as? NSArray, res = responseArr[0] as? NSDictionary {
                        //let res = responseArr[0];
                        let newItem:Item = Item(json: res)
                        self.addItem(newItem)
                    }
                    else {
                        print("didnt find object");
                    }
                
                }
                
            }
    }
    
    func addItem(item:Item) {
        items.append(item)
        listTableView.reloadData()
    }
    
    // Added to support different barcodes
    let supportedBarCodes = [AVMetadataObjectTypeQRCode, AVMetadataObjectTypeCode128Code, AVMetadataObjectTypeCode39Code, AVMetadataObjectTypeCode93Code, AVMetadataObjectTypeUPCECode, AVMetadataObjectTypePDF417Code, AVMetadataObjectTypeEAN13Code, AVMetadataObjectTypeAztecCode]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "ItemTableViewCell", bundle: nil)
        listTableView.registerNib(nib,
            forCellReuseIdentifier: "itemCell")
        
        // Get an instance of the AVCaptureDevice class to initialize a device object and provide the video
        // as the media type parameter.
        let captureDevice = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
        
        do {
            // Get an instance of the AVCaptureDeviceInput class using the previous device object.
            let input = try AVCaptureDeviceInput(device: captureDevice)
            
            // Initialize the captureSession object.
            captureSession = AVCaptureSession()
            // Set the input device on the capture session.
            captureSession?.addInput(input)
            
            // Initialize a AVCaptureMetadataOutput object and set it as the output device to the capture session.
            let captureMetadataOutput = AVCaptureMetadataOutput()
            captureSession?.addOutput(captureMetadataOutput)
            
            // Set delegate and use the default dispatch queue to execute the call back
            captureMetadataOutput.setMetadataObjectsDelegate(self, queue: dispatch_get_main_queue())
            
            // Detect all the supported bar code
            captureMetadataOutput.metadataObjectTypes = supportedBarCodes
            
            // Initialize the video preview layer and add it as a sublayer to the viewPreview view's layer.
            videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
            videoPreviewLayer?.videoGravity = AVLayerVideoGravityResizeAspectFill
            videoPreviewLayer?.frame = cameraView.layer.bounds
            cameraView.layer.addSublayer(videoPreviewLayer!)
            
            // Start video capture
            captureSession?.startRunning()
            
            // Initialize QR Code Frame to highlight the QR code
            qrCodeFrameView = UIView()
            
            if let qrCodeFrameView = qrCodeFrameView {
                qrCodeFrameView.layer.borderColor = UIColor.greenColor().CGColor
                qrCodeFrameView.layer.borderWidth = 2
                cameraView.addSubview(qrCodeFrameView)
                cameraView.bringSubviewToFront(qrCodeFrameView)
            }
            
        } catch {
            // If any error occurs, simply print it out and don't continue any more.
            print(error)
            return
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func captureOutput(captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [AnyObject]!, fromConnection connection: AVCaptureConnection!) {
        
        // Check if the metadataObjects array is not nil and it contains at least one object.
        if metadataObjects == nil || metadataObjects.count == 0 {
            qrCodeFrameView?.frame = CGRectZero
            return
        }
        
        // Get the metadata object.
        let metadataObj = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
        
        // Here we use filter method to check if the type of metadataObj is supported
        // Instead of hardcoding the AVMetadataObjectTypeQRCode, we check if the type
        // can be found in the array of supported bar codes.
        if supportedBarCodes.contains(metadataObj.type) {
            //        if metadataObj.type == AVMetadataObjectTypeQRCode {
            // If the found metadata is equal to the QR code metadata then update the status label's text and set the bounds
            let barCodeObject = videoPreviewLayer?.transformedMetadataObjectForMetadataObject(metadataObj)
            qrCodeFrameView?.frame = barCodeObject!.bounds
            
            if metadataObj.stringValue != nil {
                if !occupied && isShowingQR {
                    print(metadataObj.stringValue)//Read value
                    getItemData(metadataObj.stringValue)
                }
            }
        }
    }
    
    @IBAction func switchCameraPressed(sender: UIButton) {
        isShowingQR = !isShowingQR
    }
    
    @IBAction func checkoutPressed(sender: UIButton) {
        if let nextViewController = "CheckoutViewController".loadNib() as? CheckoutViewController {
            nextViewController.items = self.items;
            nextViewController.itemCountHash = self.itemCountHash
            self.presentViewController(nextViewController, animated: true, completion: { () -> Void in
                print("done nigah")
            })
        } else {
            print("failed loading CheckoutViewController")
        }
    }
}

extension CameraViewController : UITableViewDelegate, UITableViewDataSource {
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
    
    func tableView(tableView: UITableView, shouldHighlightRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
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

