//
//  SecondViewController.swift
//  Lesson07
//
//  Created by Rudd Taylor on 9/30/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    // A reference to the text view in the Scene.
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Get the values from NSUserDefaults using the keys specified in Settings.bundle. These
        // keys are present in the Root.plist file of the settings bundle.
        //
        // We have to go to the Settings App, then Lesson07, and set the values there.
        
        let warning = "(Go to the Settings app and set the values first!)"
        var text = ""
        
        if let textFieldValue = NSUserDefaults.standardUserDefaults().stringForKey("name_preference") {
            text += textFieldValue
        } else {
            text += warning
        }
        
        text += " "
        
        let sliderValue = NSUserDefaults.standardUserDefaults().doubleForKey("slider_preference")
        text += String(sliderValue)
        
        // Show these values in the text view.
        self.textView.text = text
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
