//
//  ViewController.swift
//  Meander_IOS
//
//  Created by Will on 4/11/15.
//  Copyright (c) 2015 meander_ios. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var textField: UITextField!
    @IBOutlet var locationLabel: UILabel?
    @IBOutlet var activityLabel: UITextField!
    @IBOutlet var tableView: UITableView!
    var items: [String] = []
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var destViewController : myViewController2 = segue.destinationViewController as myViewController2
        destViewController.arr = items
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func activityAction(sender: UITextField) {
        var newActivity = activityLabel!.text
        self.items.append(newActivity)
        tableView.reloadData()
        activityLabel.text = ""
    }
    
    @IBAction func locationAction(sender: UITextField) {
//        locationLabel?.text = "Hello \(sender.text)"
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
        cell.textLabel?.text = self.items[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
}

