//
//  ViewController.swift
//  Meander_IOS
//
//  Created by Will on 4/11/15.
//  Copyright (c) 2015 meander_ios. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var client: YelpClient!
    
    // You can register for Yelp API keys here: http://www.yelp.com/developers/manage_api_keys
    let yelpConsumerKey = "vxKwwcR_NMQ7WaEiQBK_CA"
    let yelpConsumerSecret = "33QCvh5bIF5jIHR5klQr7RtBDhQ"
    let yelpToken = "uRcRswHFYa1VkDrGV6LAW2F8clGh5JHV"
    let yelpTokenSecret = "mqtKIxMIR4iBtBPZCmCLEb-Dz3Y"
    
    @IBOutlet var textField: UITextField!
    @IBOutlet var locationLabel: UILabel?
    @IBOutlet var activityLabel: UITextField!
    @IBOutlet var tableView: UITableView!
    var activities: [String] = []
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var destViewController : myViewController2 = segue.destinationViewController as myViewController2
        
        var location = "Hanover, NH"
        var activitiesDict = [String: [String: [String]]]()
        for activity in activities {
            // Do any additional setup after loading the view, typically from a nib.
            client = YelpClient(consumerKey: yelpConsumerKey, consumerSecret: yelpConsumerSecret, accessToken: yelpToken, accessSecret: yelpTokenSecret)
            
            client.searchWithTerm(activity, location: location, success: { (operation: AFHTTPRequestOperation!, response: AnyObject!) -> Void in
//                println(response)
                var activityDict = [String: [String]]()
                activityDict["name"] = response.valueForKeyPath("businesses.name") as [String]
                activityDict["snippet_text"] = response.valueForKeyPath("businesses.snippet_text") as [String]
                activityDict["rating_img_url"] = response.valueForKeyPath("businesses.rating_img_url") as [String]
                activityDict["image_url"] = response.valueForKeyPath("businesses.image_url") as [String]
                activityDict["rating"] = self.convertIntArrToStrArr(response.valueForKeyPath("businesses.rating") as [Int])
                activityDict["review_count"] = self.convertIntArrToStrArr(response.valueForKeyPath("businesses.review_count") as [Int])
                activityDict["url"] = response.valueForKeyPath("businesses.url") as [String]
                
                var addressList = response.valueForKeyPath("businesses.location.display_address") as [[String]]
                var joinedAddresses = [String]()
                for address in addressList {
                    joinedAddresses.append(", ".join(address))
                }
                activityDict["display_address"] = joinedAddresses
                
                activitiesDict[activity] = activityDict
                }) { (operation: AFHTTPRequestOperation!, error: NSError!) -> Void in
                    println(error)
            }
        }
        
        destViewController.activities = activities
        destViewController.activitiesDict = activitiesDict
    }
    
    func convertIntArrToStrArr(arr: [Int]) -> [String] {
        var newArr = [String]()
        for val in arr {
            newArr.append(String(val))
        }
        return newArr
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
        self.activities.append(newActivity)
        tableView.reloadData()
        activityLabel.text = ""
    }
    
    @IBAction func locationAction(sender: UITextField) {
//        locationLabel?.text = "Hello \(sender.text)"
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.activities.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
        cell.textLabel?.text = self.activities[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
}

