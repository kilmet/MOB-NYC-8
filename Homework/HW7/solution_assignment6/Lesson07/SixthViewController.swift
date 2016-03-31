//
//  SixthViewController.swift
//  Lesson07
//
//  Created by William Martin on 1/19/16.
//  Copyright © 2016 General Assembly. All rights reserved.
//

import UIKit

class SixthViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!

    // This is a computed property. It gets a URL that refers to the app's "Documents" directory.
    // Access it using self.documentsDirectory.
    lazy var documentsDirectory: NSURL = {
        let fileMgr = NSFileManager.defaultManager()
        let urls = fileMgr.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        return urls.first!
    }()
    
    // This one gets a URL directly to the propery list file we're creating.
    // Access this using self.propertyListUrl whenever you're asked for an NSURL that refers
    // to the property list file.
    lazy var propertyListUrl: NSURL = {
        return self.documentsDirectory.URLByAppendingPathComponent("myPropertyList.plist", isDirectory: false)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Load the property list contents using an NSArray constructor, but make it more
        // convenient by making the constant of type Array of String.
        let arrayToJoin = NSArray(contentsOfURL: self.propertyListUrl) as! [String]
        
        // Join the array together with single spaces.
        let stringToDisplay = arrayToJoin.joinWithSeparator(" ")
        
        // Then show the string in the text view.
        self.textView.text = stringToDisplay
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
