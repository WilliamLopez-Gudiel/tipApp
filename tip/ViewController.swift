//
//  ViewController.swift
//  tip
//
//  Created by William Gudiel on 7/28/20.
//  Copyright © 2020 CodePath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalView: UIView!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var billAmountTextField: UITextField!
    
 
    @IBOutlet weak var tipPercentageLabel: UILabel!
    
    let defaults = UserDefaults.standard
    
    var current:NSDate = NSDate()
    var unFormated:Int?
    
   
   
     
    override func viewDidLoad() {
       super.viewDidLoad()
        self.billAmountTextField.keyboardType = UIKeyboardType.decimalPad
        let theme = defaults.integer(forKey: "theme") ?? 0
        if(theme == 0){
            overrideUserInterfaceStyle = .light
        }
        else{
            overrideUserInterfaceStyle = .dark
        }
        tipControl.selectedSegmentIndex = defaults.integer(forKey: "index")
        
        var compare = defaults.object(forKey: "date")
        if(compare == nil){
            defaults.set(current, forKey: "date")
        }
        else{
            compare = defaults.object(forKey: "date") as! NSDate
            if(current.timeIntervalSince(compare as! Date) > 600){
                print("its been 15 sec")
                defaults.set(current, forKey: "date")
                defaults.synchronize()
            }
            else{
                print("its been less than 15 sec")
                billAmountTextField.text = defaults.string(forKey: "billAmount")
            }
        }
    }
    
    

    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         tipControl.selectedSegmentIndex = defaults.integer(forKey: "index")
        let theme = defaults.integer(forKey: "theme") ?? 0
        if(theme == 0){
            overrideUserInterfaceStyle = .light
        }
        else{
            overrideUserInterfaceStyle = .dark
        }
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        billAmountTextField.becomeFirstResponder()
        calculateTip(self)
        
    }







    @IBAction func onTap(_ sender: Any) {
    }
    
    
    @IBAction func calculateTip(_ sender: Any) {
        //retrieve bill amount and make a collection of tip percentages
        let bill = Double(billAmountTextField.text!) ?? 0
        let tipPercentages = [0.15, 0.18, 0.2]
        
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipPercentageLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        if(billAmountTextField.text == ""){
            UIView.animate(withDuration:0.1, animations: {
                self.totalView.center = CGPoint(x: 197.0, y: 1000.5)
                self.billAmountTextField.center = CGPoint(x: 197.0, y: 399.5)
                self.tipControl.center = CGPoint(x: 205.0, y: 1000.5)
            
                
            })
        }
        else{
            UIView.animate(withDuration:0.1, animations: {
                self.totalView.alpha = 1.0
                self.tipControl.alpha = 1.0
                self.totalView.center = CGPoint(x: 197.0, y: 479.5)
                self.billAmountTextField.center = CGPoint(x: 197.0, y: 199.5)
                self.tipControl.center = CGPoint(x: 205.0, y: 332.5)
            
                
            })
        }
    }
    
}
