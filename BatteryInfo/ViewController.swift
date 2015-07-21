//
//  ViewController.swift
//  BatteryInfo
//
//  Created by shinobu okano on 2015/07/22.
//  Copyright (c) 2015年 shinobu okano. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let MyNotification = "MyNotification"
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
//        let gradient: CAGradientLayer = CAGradientLayer()
//        gradient.frame = self.view.bounds;
//        gradient.colors = [UIColor(red: 87, green: 68, blue: 27, alpha: 1).CGColor,UIColor(red: 89, green: 54, blue: 72, alpha: 1).CGColor]
//        self.view.layer.insertSublayer(gradient, atIndex: 0)
        
        let uiDevice = UIDevice.currentDevice()
        uiDevice.batteryMonitoringEnabled = true
        
        let level = uiDevice.batteryLevel
        let status = uiDevice.batteryState
        
        NSLog("\(level) %")
        switch (status) {
        case .Full:
            NSLog("")
        case .Unplugged:
            NSLog("")
        case .Charging:
            NSLog("")
        case .Unknown:
            NSLog("")
        default:
            break;
        }
        
        if level == -1 {
            label.text = "Battery Level = ?"
        } else {
            label.text = "Battery Level =  \(level * 100) %"
        }
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "update:", name: UIDeviceBatteryLevelDidChangeNotification, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    internal func update(notification: NSNotification?){
        NSLog("update")
    }


}

