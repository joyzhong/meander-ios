//
//  myViewController2ViewController.swift
//  Meander_IOS
//
//  Created by Will on 4/11/15.
//  Copyright (c) 2015 meander_ios. All rights reserved.
//

import UIKit

class myViewController2: UIViewController {

    @IBOutlet var label: UILabel!
    
    var arr = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = ", ".join(arr)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
