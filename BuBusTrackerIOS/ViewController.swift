//
//  ViewController.swift
//  BuBusTrackerIOS
//
//  Created by Steve Hwang on 4/21/15.
//  Copyright (c) 2015 Steve Hwang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        getBusData()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //USEFUL http://jamesonquave.com/blog/making-a-post-request-in-swift/
    func getBusData() {
        // 1
        let urlAsString = "http://www.bu.edu/bumobile/rpc/bus/livebus.json.php"
        let url = NSURL(string: urlAsString)!
        let urlSession = NSURLSession.sharedSession()
        
        //2
        let jsonQuery = urlSession.dataTaskWithURL(url, completionHandler: { data, response, error -> Void in
            if (error != nil) {
                println(error.localizedDescription)
            }
            var err: NSError?
            
            // 3
            let jsonResult = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &err) as! NSDictionary
            if (err != nil) {
                println("JSON Error \(err!.localizedDescription)")
            }
            
            // 4
            let jsonTitle: String! = jsonResult["title"] as! String
            let jsonService: String! = jsonResult["service"] as! String
            
            dispatch_async(dispatch_get_main_queue(), {
                let i = 0
                //self.titleLabel.text = jsonTitle
                //self.serviceLabel.text = jsonService
            })
        })
        // 5
        jsonQuery.resume()
    }

    
    
}

