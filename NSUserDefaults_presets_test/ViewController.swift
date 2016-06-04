//
//  ViewController.swift
//  NSUserDefaults_presets_test
//
//  Created by Vijay Weemhoff on 03-06-16.
//  Copyright © 2016 Vijay Weemhoff. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
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

    //
    //nieuwe code voor interface, makkelijker en meer bugproof
    //en mogelijkheid voor inladen van presets
    
    var mutArray : NSMutableArray = ["List is empty"]
    
    @IBOutlet var showElementInArray: UITextField!
    
    @IBAction func putRandomInArray(sender: UIButton) {
        let randomMIDI = Int(arc4random_uniform(126)+1);
        mutArray.addObject(randomMIDI)
    }
    
    var showArray=0
    
    func loopInList(){
        if(showArray>=mutArray.count-1){
            showArray=0
        }
        
        showArray=showArray+1
    }
    
    @IBAction func tapButtonPressed(sender: UIButton) {
        if(mutArray.count==1){
            //NSLog("List is empty")
            showElementInArray.text = "List is empty"
        }
        if(mutArray.count>1){
            loopInList()
            showElementInArray.text = String(mutArray[showArray]) 
        }
        
    }
    
    @IBAction func clearArrayPressed(sender: UIButton) {
        mutArray.removeAllObjects();
        mutArray.addObject("List is empty");
    }
    
    @IBAction func deleteLastObjectPressed(sender: UIButton) {
        if(mutArray.count>1){
            mutArray.removeLastObject();
        }
        else{
            showElementInArray.text = "Can't delete anymore"
        }
    }
    
    @IBAction func saveListButtonPressed(sender: UIButton) {
        NSUserDefaults.standardUserDefaults().setObject(mutArray, forKey: "first array")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    @IBAction func recallListButtonPressed(sender: UIButton) {
        if let tempNames: NSArray = NSUserDefaults.standardUserDefaults().arrayForKey("first array") {
            mutArray = tempNames.mutableCopy() as! NSMutableArray
        }
    }
    //Einde nieuwe code for interface
    //
    //
    
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


}

