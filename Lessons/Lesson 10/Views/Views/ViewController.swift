import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var green: UIView!
    @IBOutlet weak var salmon: UIView!
    
    @IBOutlet weak var red: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func buttonClicked(sender: AnyObject) {
        
        green.hidden = true
        green.backgroundColor = UIColor.clearColor()
        
        
        let blueView = UIView(frame: CGRect(x: 100, y: 100, width: 40, height: 40))
        blueView.backgroundColor = UIColor.blueColor()
        
        self.view.addSubview(blueView)
        
        let brownView = UIView(frame: CGRect(x: 105, y: 105, width: 20, height: 20))
        brownView.backgroundColor = UIColor.brownColor()
//        brownView.clipsToBounds = true
        blueView.addSubview(brownView)
        
        let button = UIButton(frame: CGRect(x: 20, y: 20, width: 40, height: 40))
        button.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        button.titleLabel?.text = "Click me"
        button.backgroundColor = UIColor.lightGrayColor()
        
        button.addTarget(self, action: "customButton", forControlEvents: UIControlEvents.TouchUpInside)
        
        print(self.view.bounds)
        self.view.addSubview(button)

//        red.backgroundColor = UIColor.blueColor()
        
        UIView.animateWithDuration(0.6) { () -> Void in
            self.red.backgroundColor = UIColor.blueColor()
            
            self.red.frame.origin.y -= 50
            
            self.view.layoutIfNeeded()
        }
        
    }
    
    func customButton(){
        self.view.backgroundColor = UIColor.greenColor()
    }
    
}

