//
//  InterfaceController.swift
//  DPCalc WatchKit Extension
//
//  Created by Darrell Payne on 7/13/17.
//  Copyright © 2017 Darrell Payne. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    @IBOutlet var label: WKInterfaceLabel!
    
    @IBAction func tapped0() {tappedNumber(num: 0)}
    @IBAction func tapped1() {tappedNumber(num: 1)}
    @IBAction func tapped2() {tappedNumber(num: 2)}
    @IBAction func tapped3() {tappedNumber(num: 3)}
    @IBAction func tapped4() {tappedNumber(num: 4)}
    @IBAction func tapped5() {tappedNumber(num: 5)}
    @IBAction func tapped6() {tappedNumber(num: 6)}
    @IBAction func tapped7() {tappedNumber(num: 7)}
    @IBAction func tapped8() {tappedNumber(num: 8)}
    @IBAction func tapped9() {tappedNumber(num: 9)}

    
    func tappedNumber(num:Int){
        
    }

    @IBAction func tappedPlus(){
        
    }
    
    @IBAction func tappedMinus(){
        
    }

    @IBAction func tappedClear(){
        
    }

    @IBAction func tappedEquals(){
        
    }

    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
