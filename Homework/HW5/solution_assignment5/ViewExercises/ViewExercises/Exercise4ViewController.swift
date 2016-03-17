//
//  Exercise4ViewController.swift
//  ViewExercises
//
//  Created by William Martin on 1/22/16.
//  Copyright © 2016 Anomalus. All rights reserved.
//

import UIKit

class Exercise4ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        button.layer.borderColor = UIColor.redColor().CGColor
        button.layer.borderWidth = 1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onButtonTapped(sender: UIButton) {
        if sender.backgroundColor == UIColor.redColor() {
            sender.backgroundColor = UIColor.greenColor()
        } else {
            sender.backgroundColor = UIColor.redColor()
        }
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
