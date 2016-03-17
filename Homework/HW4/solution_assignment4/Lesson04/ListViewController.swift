//
//  ViewController.swift
//  Lesson04
//
//  Created by William Martin on 2016 Jan 18.
//  Copyright (c) 2016 General Assembly. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UITableViewDataSource {

    // The "state" of this view controller, containing the Array of items entered
    // by the user.
    var items = [String]()
    
    // A reference to the UITableView in the Scene. We need this so we can tell it
    // when to redraw, namely, after the user taps Return.
    @IBOutlet weak var itemsTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // An action for the event "did end on exit," sent by the UITextField.
    // This action is called when the user taps Return.
    @IBAction func didEndOnExit(sender: UITextField, forEvent event: UIEvent) {
        
        // The text attribute of the UITextField of type Optional String, so 
        // attempt to unwrap it with the "if let" syntax:
        if let userInput = sender.text {
            // Add the item to the Array.
            self.items.append(userInput)
            
            // Ask the table to redraw itself. This ensures the item we just
            // appended will have the opportunity to render, even if it would
            // not be visible on the screen.
            self.itemsTable.reloadData()
            
            // Set the text to an empty string so it displays as empty.
            sender.text = ""
        }
    }

    // Required by UITableViewDataSource, the number of rows in the table should equal
    // the number of items the user has entered.
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    // Given an indexPath, return the UITableViewCell instance needed to represent
    // that data. This should use the same identifier value as set in the Storyboard
    // for the table cell dynamic prototype.
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Ask the table view for a recycled table view cell. Remember that table views
        // manage a set of instances of cells that it reuses dynamically in order to
        // conserve memory and rendering effort.
        let cell = tableView.dequeueReusableCellWithIdentifier("list_cell", forIndexPath: indexPath)
        
        // Get an item to display from the Array.
        let item = self.items[indexPath.row]
        
        // Set the value of the default textLabel to the item. Remember to set the
        // "style" attribute of the dynamic prototype (in the Storyboard) to "Basic".
        cell.textLabel?.text = item
        
        // Return the instance so the table view can display it in the proper place.
        return cell
    }
}

