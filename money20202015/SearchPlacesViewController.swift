//
//  SearchPlacesViewController.swift
//  money20202015
//
//  Created by sloot on 10/25/15.
//  Copyright © 2015 sloot. All rights reserved.
//

import UIKit
import CoreLocation

class SearchPlacesViewController: UIViewController {
    
    @IBOutlet weak var placesTableView: UITableView!
    var locationManager:CLLocationManager!
    
    @IBOutlet var messageTextView: UITextView!
    
    var isConsumer:Bool = false {
        didSet {
            messageTextView.setBody(isConsumer ? "What store are you shopping at?" : "Which business do you own?")
        }
    }
    
    var places:[Place] = [] {
        didSet {
            placesTableView.reloadData()
        }
    }
    
    var currentLocation:CLLocation? {
        didSet {
            if let currentLocation = currentLocation {
                let longitude = CGFloat(currentLocation.coordinate.longitude)
                let latitude = CGFloat(currentLocation.coordinate.latitude)
                Place.getPlaces(latitude, longitude: longitude) { (newPlaces) -> Void in
                    if let newPlaces = newPlaces {
                        self.places = newPlaces
                    } else {
                        print("error")
                    }
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "PlaceTableViewCell", bundle: nil)
        placesTableView.registerNib(nib,
            forCellReuseIdentifier: "placeCell")
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

extension SearchPlacesViewController : UITableViewDelegate, UITableViewDataSource {
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
        return places.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100.0
    }
    
    func tableView(tableView: UITableView,
        didSelectRowAtIndexPath indexPath: NSIndexPath) {
            let place = places[indexPath.row]
            print("Selected place with place id = \(place.pid)")
            //Do somthing with this
            if isConsumer {
                if let nextViewController = "CameraViewController".loadNib() as? CameraViewController {
                    self.presentViewController(nextViewController, animated: true, completion: { () -> Void in
                        print("done nigah")
                    })
                } else {
                    print("failed loading CameraViewController")
                }
            } else {
                if let nextViewController = "SearchPlacesViewController".loadNib() as? SearchPlacesViewController {
                    nextViewController.isConsumer = false
                    self.presentViewController(nextViewController, animated: true, completion: { () -> Void in
                        print("done nigah")
                    })
                } else {
                    print("failed loading SearchPlacesViewController")
                }
            }
    }
    
    func tableView(tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            let cell:PlaceTableViewCell = tableView.dequeueReusableCellWithIdentifier(
                "placeCell",
                forIndexPath: indexPath) as! PlaceTableViewCell
            let place = places[indexPath.row]
            cell.placeNameLabel.text = place.name
            cell.placeImageView.smartLoad(place.placePhotoURL())
            return cell
    }
}

extension SearchPlacesViewController : CLLocationManagerDelegate {
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        manager.stopUpdatingLocation()
        currentLocation = manager.location
    }
}