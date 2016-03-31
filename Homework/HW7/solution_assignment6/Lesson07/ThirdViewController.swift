//
//  ThirdViewController.swift
//  Lesson07
//
//  Created by Rudd Taylor on 9/30/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    // A reference to the text view in the Scene.
    @IBOutlet weak var textView: UITextView!
    
    // This is a computed property. It gets a URL that refers to the app's "Documents" directory.
    // Access it using self.documentsDirectory.
    lazy var documentsDirectory: NSURL = {
        let fileMgr = NSFileManager.defaultManager()
        let urls = fileMgr.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        return urls.first!
    }()
    
    // This method takes a file name like "essay.txt", and returns an NSURL that points to it.
    // You can use that NSURL in various methods to refer to the file, load it, save data to it, etc.
    func getUrlForDocument(documentName: String) -> NSURL {
        return self.documentsDirectory.URLByAppendingPathComponent(documentName, isDirectory: false)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        // Get an NSURL that points to a file of the given name.
        let textFile = "myFlatFile.txt"
        let textFileUrl = self.getUrlForDocument(textFile)
        
        // Grab the text and save it to the given file.
        let textToSave = self.textView.text
        
        // Also note that this method, writeToURL, throws an error. So we have to use the
        // exception-handling routing do-try-catch blocks to catch the error.
        do {
            try textToSave.writeToURL(textFileUrl, atomically: true, encoding: NSUTF8StringEncoding)
            
        } catch {
            // This clause here is like the "else" clause of an if-else statement.
            // If the statement after "try" above throws an exception, this clause is executed
            // instead of the remainder of the "do" clause.
            print("An exception occurred when saving the file!")
        }
    }

    
}
