//
//  ViewController.swift
//  NSUserDefaults_presets_test
//
//  Created by Vijay Weemhoff on 03-06-16.
//  Copyright © 2016 Vijay Weemhoff. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let userDefaults = NSUserDefaults.standardUserDefaults()

    @IBOutlet var segColour: UISegmentedControl!
    
    @IBAction func actionColour(sender: UISegmentedControl) {
        switch(segColour.selectedSegmentIndex){
        case 0:
            self.view.backgroundColor = UIColor.redColor()
        case 1:
            self.view.backgroundColor = UIColor.blueColor()
        case 2:
            self.view.backgroundColor = UIColor.greenColor()
        default:
            self.view.backgroundColor = UIColor.whiteColor()
        }
        
    }
    
    @IBAction func saveButtonPressed(sender: UIButton) {
        let bgColourNo = segColour.selectedSegmentIndex
        
        userDefaults.setObject(bgColourNo, forKey: "bgColour")
        userDefaults.synchronize()
    }
    
    @IBAction func setDefaultPressed(sender: AnyObject) {
        let bgColourNo: Int? = userDefaults.objectForKey("bgColour") as! Int?
        
        switch(bgColourNo!){
        case 0:
            self.view.backgroundColor = UIColor.redColor()
            self.segColour.selectedSegmentIndex = 0
        case 1:
            self.view.backgroundColor = UIColor.blueColor()
            self.segColour.selectedSegmentIndex = 1
        case 2:
            self.view.backgroundColor = UIColor.greenColor()
            self.segColour.selectedSegmentIndex = 2
        default:
            self.view.backgroundColor = UIColor.whiteColor()
        }

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var bgColourNo: Int? = userDefaults.objectForKey("bgColour") as! Int?
        if(bgColourNo==nil){
            bgColourNo=1
            userDefaults.setObject(bgColourNo, forKey: "bgColour")
        }
        switch(bgColourNo!){
        case 0:
            self.view.backgroundColor = UIColor.redColor()
            self.segColour.selectedSegmentIndex = 0
        case 1:
            self.view.backgroundColor = UIColor.blueColor()
            self.segColour.selectedSegmentIndex = 1
        case 2:
            self.view.backgroundColor = UIColor.greenColor()
            self.segColour.selectedSegmentIndex = 2
        default:
            self.view.backgroundColor = UIColor.whiteColor()
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

