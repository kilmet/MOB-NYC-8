//
//  FIfthViewController.swift
//  Lesson07
//
//  Created by William Martin on 1/19/16.
//  Copyright © 2016 General Assembly. All rights reserved.
//

import UIKit

class FifthViewController: UIViewController {
    
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

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation.
    //
    // This is called when the user taps "Next."
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Grab the text from the view.
        let textToSplit = self.textView.text
        
        // Use an NSArray type to get access to the writeToURL method.
        let arrayToSave : NSArray = textToSplit.componentsSeparatedByString(" ")
        
        // Use the NSArray method to write the property list to the file system.
        arrayToSave.writeToURL(self.propertyListUrl, atomically: true)
    }
    

}
