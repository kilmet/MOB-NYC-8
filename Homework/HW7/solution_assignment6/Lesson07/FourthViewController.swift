//
//  FourthViewController.swift
//  Lesson07
//
//  Created by William Martin on 1/19/16.
//  Copyright © 2016 General Assembly. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController {
    
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
        
        // Get an NSURL that points to a file of the given name.
        let textFile = "myFlatFile.txt"
        let textFileUrl = self.getUrlForDocument(textFile)
        
        // We have to use do-try-catch here as well. If you try to auto-complete the constructor
        // String(contentsOfUrl..., in the dropdown menu, it ends with "throws," which indicates
        // that this do-try-catch paradigm is required.
        //
        // Note that location of "try", which is placed before the initializer that can throw an
        // exception.
        do {
            // This reads the contents of the given URL.
            // Display the text in the text view once it's read from the file.
            self.textView.text = try String(contentsOfURL: textFileUrl)
            
        } catch {
            // Oops, an exception was thrown. Now we need to do something that handles the error
            // in a graceful way.
            print("The file couldn't be read. Maybe this is the first time you're running the app?")
            
            self.textView.text = "Hello! Save me!"
        }
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
