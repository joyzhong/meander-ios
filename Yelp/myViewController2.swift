//
//  myViewController2ViewController.swift
//  Meander_IOS
//
//  Created by Will on 4/11/15.
//  Copyright (c) 2015 meander_ios. All rights reserved.
//

import UIKit

class myViewController2: UIViewController {
    @IBOutlet var viewMap: GMSMapView!
    @IBOutlet var label: UILabel!
    
    var activitiesDict = [String: [String: [String]]]()
    var activities = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let camera: GMSCameraPosition = GMSCameraPosition.cameraWithLatitude(48.857165, longitude: 2.354613, zoom: 8.0)
        viewMap.camera = camera
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
