//
//  InterfaceController.swift
//  DPCalc WatchKit Extension
//
//  Created by Darrell Payne on 7/13/17.
//  Copyright © 2017 Darrell Payne. All rights reserved.
//

import WatchKit
import Foundation


enum modes {
    case NOT_SET
    case ADDITION
    case SUBTRACTION
}

class InterfaceController: WKInterfaceController {
    
    var labelString:String = "0"
    var currentMode:modes = modes.NOT_SET
    var savedNum:Int64 = 0
    var lastButtonWasMode = false
    
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
        if lastButtonWasMode {
            lastButtonWasMode = false
            labelString = "0"
        }
        labelString = labelString.appending("\(num)")
        updateText()
    }
    
    func updateText(){
        guard let labelInt:Int64 = Int64(labelString) else {
            label.setText("number is too large")
            return
        }
        savedNum = (currentMode == modes.NOT_SET) ? labelInt : savedNum
        
        let formatter:NumberFormatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.decimal
        let nsInt:NSNumber = labelInt as NSNumber
        let str:String = formatter.string(from: nsInt)!
        
        label.setText(str)
    }
    
    func changeMode(_ newMode:modes){
        if savedNum == 0 {
            return
        }
        currentMode = newMode
        lastButtonWasMode = true
    }

    @IBAction func tappedPlus(){
        changeMode(modes.ADDITION)
    }
    
    @IBAction func tappedMinus(){
        changeMode(modes.SUBTRACTION)
    }

    @IBAction func tappedClear(){
        savedNum = 0
        labelString = "0"
        label.setText("0")
        currentMode = modes.NOT_SET
        lastButtonWasMode = false
    }

    @IBAction func tappedEquals(){
        guard  let num:Int64 = Int64(labelString) else {
            return
        }
        if currentMode == modes.NOT_SET || lastButtonWasMode {
            return
        }
        if currentMode == modes.ADDITION {
            savedNum += num
        } else if currentMode == modes.SUBTRACTION {
            savedNum -= num
        }
        currentMode = modes.NOT_SET
        labelString = "\(savedNum)"
        updateText()
        lastButtonWasMode = true
        
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
