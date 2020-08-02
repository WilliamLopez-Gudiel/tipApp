//
//  SettingsViewController.swift
//  tip
//
//  Created by William Gudiel on 7/29/20.
//  Copyright © 2020 CodePath. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var themeSeg: UISegmentedControl!
    @IBOutlet weak var tipSeg: UISegmentedControl!
    let defaults = UserDefaults.standard
    var defIndex:Int?
    
   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tipSeg.selectedSegmentIndex = defaults.integer(forKey: "index")
        themeSeg.selectedSegmentIndex = defaults.integer(forKey: "theme")
        let theme = defaults.integer(forKey: "theme") ?? 0
        if(theme == 0){
            overrideUserInterfaceStyle = .light
        }
        else{
            overrideUserInterfaceStyle = .dark
        }
        
        
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func defaultTip(_ sender: UISegmentedControl) {
        defIndex = sender.selectedSegmentIndex
        defaults.set(defIndex, forKey: "index")
        defaults.synchronize()
    }
    
    @IBAction func defaultTheme(_ sender: UISegmentedControl) {
        let selected = sender.selectedSegmentIndex
        if(selected == 0){
            overrideUserInterfaceStyle = .light
            defaults.set(0, forKey: "theme")
        }
        else{
            overrideUserInterfaceStyle = .dark
            defaults.set(1, forKey: "theme")
        }
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
