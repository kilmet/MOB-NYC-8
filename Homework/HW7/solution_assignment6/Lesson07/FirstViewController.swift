//
//  FirstViewController.swift
//  Lesson07
//
//  Created by Rudd Taylor on 9/30/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    // A reference to the text view in the Scene.
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Get the values from NSUserDefaults using the keys "test_number" and "test_string".
        // The default values are registered in AppDelegate.swift.
        let test_number = NSUserDefaults.standardUserDefaults().doubleForKey("test_number")
        let test_string = NSUserDefaults.standardUserDefaults().stringForKey("test_string")!
        
        // Show them in the text view.
        self.textView.text = "\(test_string) \(test_number)"
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