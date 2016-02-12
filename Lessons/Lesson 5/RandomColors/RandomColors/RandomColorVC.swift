import UIKit

class RandomColorVC : UIViewController {

    @IBOutlet weak var top: UIView!
    @IBOutlet weak var middle: UIView!
    @IBOutlet weak var bottom: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewsToRandomColor()
    }
    
    func getRandomFloat() -> CGFloat {
        let randomFloat = CGFloat(arc4random_uniform(100))/100.0
        return randomFloat
    }
    
    func getRandomColor() -> UIColor {
        return UIColor(red: getRandomFloat(), green: getRandomFloat(), blue: getRandomFloat(), alpha: 1.0)
    }
    
    
    var topRandomRed : CGFloat = 0
    var topRandomGreen : CGFloat = 0
    var topRandomBlue : CGFloat = 0

    var bottomRandomRed : CGFloat = 0
    var bottomRandomGreen : CGFloat = 0
    var bottomRandomBlue : CGFloat = 0
    
    var middleRandomRed : CGFloat = 0
    var middleRandomGreen : CGFloat = 0
    var middleRandomBlue : CGFloat = 0
    
    func getTopRandomColor() -> UIColor {
        topRandomRed = getRandomFloat()
        topRandomGreen = getRandomFloat()
        topRandomBlue = getRandomFloat()
        return UIColor(red: topRandomRed, green: topRandomGreen , blue: topRandomBlue , alpha: 1.0)
    }
    
    func getMiddleRandomColor() -> UIColor {
        middleRandomRed = getRandomFloat()
        middleRandomGreen = getRandomFloat()
        middleRandomBlue = getRandomFloat()
        return UIColor(red: middleRandomRed, green: middleRandomGreen , blue: middleRandomBlue , alpha: 1.0)
    }

    func getBottomRandomColor() -> UIColor {
        bottomRandomRed = getRandomFloat()
        bottomRandomGreen = getRandomFloat()
        bottomRandomBlue = getRandomFloat()
        return UIColor(red: bottomRandomRed, green: bottomRandomGreen , blue: bottomRandomBlue , alpha: 1.0)
    }


    func setViewsToRandomColor() {
        top.backgroundColor = getTopRandomColor()
        middle.backgroundColor = getMiddleRandomColor()
        bottom.backgroundColor = getBottomRandomColor()

    }
    @IBAction func buttonClicked(sender: AnyObject) {
        setViewsToRandomColor()
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        if motion == .MotionShake {
            setViewsToRandomColor()
        }
    }

    @IBAction func swipeRight(sender: AnyObject) {
        topRandomRed = topRandomRed + 0.2
        
        top.backgroundColor = UIColor(red: topRandomRed, green: topRandomGreen, blue: topRandomBlue, alpha: 1.0)
    }
    
    @IBAction func swipeLeft(sender: AnyObject) {
        topRandomRed = topRandomRed - 0.2
        
        top.backgroundColor = UIColor(red: topRandomRed, green: topRandomGreen, blue: topRandomBlue, alpha: 1.0)
    }
    
    @IBAction func middleSwipeRight(sender: AnyObject) {
        middleRandomGreen = middleRandomGreen + 0.2
        
        middle.backgroundColor = UIColor(red: middleRandomRed, green: middleRandomGreen, blue: middleRandomBlue, alpha: 1.0)

    }
    
    @IBAction func middleSwipeLeft(sender: AnyObject) {
        middleRandomGreen = middleRandomGreen - 0.2
        
        middle.backgroundColor = UIColor(red: middleRandomRed, green: middleRandomGreen, blue: middleRandomBlue, alpha: 1.0)

    }
    
    @IBAction func bottomSwipeRight(sender: AnyObject) {
        bottomRandomBlue = bottomRandomBlue + 0.2
        
        bottom.backgroundColor = UIColor(red: bottomRandomRed, green: bottomRandomGreen, blue: bottomRandomBlue, alpha: 1.0)

    }
    
    @IBAction func bottomSwipeLeft(sender: AnyObject) {
        bottomRandomBlue = bottomRandomBlue - 0.2
        
        bottom.backgroundColor = UIColor(red: bottomRandomRed, green: bottomRandomGreen, blue: bottomRandomBlue, alpha: 1.0)

    }
}

