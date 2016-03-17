//
//  MapViewController.swift
//  Lesson04
//
//  Created by William Martin on 2016 Jan 18.
//  Copyright (c) 2016 General Assembly. All rights reserved.
//

import UIKit

class PairViewController: UIViewController, UITableViewDataSource {

    // The "state" of this view controller. It should hold key-value pairs
    // that the user has entered.
    var pairs = [String:String]()
    
    // A reference to the table view displayed in the scene. This is here so
    // we can ask the table view to re-render itself at the appropriate times.
    @IBOutlet weak var pairsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // When the view loads, register the notifications for when the 
        // keyboard is shown and hidden. The first argument refers to the
        // object that will receive the resulting notification message once
        // the notification center has processed it. We'll be calling a
        // function on this view controller, so the argument should be "self."
        //
        // This obligates us to provide methods with the names given
        // in the "selector" argument.
        NSNotificationCenter.defaultCenter().addObserver(
            self,
            selector: "onKeyboardWillShow:",
            name: UIKeyboardWillShowNotification,
            object: nil
        )
        
        NSNotificationCenter.defaultCenter().addObserver(
            self,
            selector: "onKeyboardWillHide:",
            name: UIKeyboardWillHideNotification,
            object: nil
        )
        
        self.makeTextFieldsTextWhite()
    }
    
    // This is the function referenced by the selector for the keyboard-will-show
    // notification registered above.
    func onKeyboardWillShow(note:NSNotification) {
        self.makeTextFieldsBlue()
    }
    
    // This is the function referenced by the selector for the keyboard-will-hide
    // notification registered above.
    func onKeyboardWillHide(note:NSNotification) {
        self.makeTextFieldsRed()
    }

    // Put some helper methods here to make it clear what we're doing with
    // the text fields' colors.
    func makeTextFieldsRed() {
        self.keyTextField.backgroundColor = UIColor.redColor()
        self.valueTextField.backgroundColor = UIColor.redColor()
    }
    
    func makeTextFieldsBlue() {
        self.keyTextField.backgroundColor = UIColor.blueColor()
        self.valueTextField.backgroundColor = UIColor.blueColor()
    }
    
    // A helper method to change the text color of the fields to white so
    // it shows up clearly when the backgrounds are colored.
    func makeTextFieldsTextWhite() {
        self.keyTextField.textColor = UIColor.whiteColor()
        self.valueTextField.textColor = UIColor.whiteColor()
    }

    // References to the text fields sitting at the top of the Scene.
    @IBOutlet weak var keyTextField: UITextField!
    @IBOutlet weak var valueTextField: UITextField!
    
    // An action for the event "did end on exit," sent by both UITextFields.
    // This action is called when the user taps Return on either field.
    @IBAction func didEndOnExit(sender: UITextField, forEvent event: UIEvent) {
        
        // The text attribute of the UITextField of type Optional String, so
        // attempt to unwrap it with the "if let" syntax:
        if let key = keyTextField.text, value = valueTextField.text {
            
            // Add the pair to the Dictionary.
            self.pairs[key] = value
            
            // Ask the table to redraw itself. This ensures the pair we just
            // appended will have the opportunity to render, even if it would
            // not be visible on the screen.
            self.pairsTableView.reloadData()
            
            // Set the text to an empty string so it displays as empty.
            keyTextField.text = ""
            valueTextField.text = ""
        }
    }
    
    // Required by UITableViewDataSource, the number of rows in the table should equal
    // the number of pairs the user has entered.
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.pairs.count
    }
    
    // Given an indexPath, return the UITableViewCell instance needed to represent
    // that data. This should use the same identifier value as set in the Storyboard
    // for the table cell dynamic prototype.
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Ask the table view for a recycled table view cell. Remember that table views
        // manage a set of instances of cells that it reuses dynamically in order to
        // conserve memory and rendering effort.
        let cell = tableView.dequeueReusableCellWithIdentifier("pair_cell", forIndexPath: indexPath)
        
        
        // Get a pair to display from the Dictionary.
        
        // Dictionaries are not index by integers like Arrays are, and all we get
        // from this tableView method is the indexPath, which acts like an index.
        // What to do?
        //
        // We need to use some Dictionary methods to translate the row of the
        // indexPath instance into a key-value pair.
        
        // Dictionaries do contain an indexing mechanism though, much like Strings do.
        // We can get the starting index with this property...
        let start = self.pairs.startIndex
        
        // ... then advance that index by the row. This gets us to the row-th pair.
        let index = start.advancedBy(indexPath.row)
        
        // Then index into the Dictionary to get the key-value pair, but the pair
        // is presented to us as a tuple.
        let pair = self.pairs[index]
        
        // The first element of the tuple is the key; the second is the value.
        // Use some constants here for readability in the following lines.
        let key = pair.0
        let value = pair.1
        
        
        // Set the value of the default textLabel to the pair. Remember to set the
        // "style" attribute of the dynamic prototype (in the Storyboard) to "Basic".
        // Let's use some String interpolation to format the pair properly.
        cell.textLabel?.text = "\(key) - \(value)"
        
        // Return the instance so the table view can display it in the proper place.
        return cell
    }
}
