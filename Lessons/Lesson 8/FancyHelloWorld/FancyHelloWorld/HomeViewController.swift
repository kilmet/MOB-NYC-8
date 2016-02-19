import UIKit

class HomeViewController: UIViewController {

    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var thirdButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        thirdButton.addTarget(self, action: "buttonClicked", forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        print(segue.identifier)
        
        if segue.identifier == "first" {
            let messageVC = segue.destinationViewController as! MessageViewController
            
            messageVC.message = textField.text
            
        } else if segue.identifier == "second" {
            let messageVC = segue.destinationViewController as! MessageViewController

            messageVC.message = "second"
        }
    }
    
    @IBAction func buttonClicked(sender: AnyObject) {
        if textField.text == "arun" {
            performSegueWithIdentifier("first", sender: nil)
        } else {
            print("try again")
        }
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        if motion == .MotionShake {
            performSegueWithIdentifier("magicSegue", sender: nil)
        }
    }
}






