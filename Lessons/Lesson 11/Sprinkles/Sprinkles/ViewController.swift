import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addRandomViews()
    }
    
    func addRandomViews() {
        let subViews = self.view.subviews
        
        for subView in subViews {
//            subView.removeFromSuperview()
        }
        
        for i in 1...20 {
            let randomView = UIView(frame: getRandomRect())
            randomView.backgroundColor = getRandomColor()
            randomView.alpha = 0
            view.addSubview(randomView)
            
            let duration = NSTimeInterval(0.6 * Float(i))
            UIView.animateWithDuration(duration, animations: { () -> Void in
                randomView.frame = self.getRandomRect()
                randomView.alpha = 1
            })
        }
    }
    
    
    func getRandomRect() -> CGRect {
        let randomX = 10 + Int(arc4random_uniform(300))
        let randomY = 10 + Int(arc4random_uniform(600))
        let randomWidth = 10 + Int(arc4random_uniform(100))
        let randomHeight = 10 + Int(arc4random_uniform(100))

        return CGRect(x: randomX, y: randomY, width: randomWidth, height: randomHeight)
    }
    
    
    func getRandomColor() -> UIColor {
        return UIColor(red: getRandomFloat(), green: getRandomFloat(), blue: getRandomFloat(), alpha: 1.0)
    }
    
    
    func getRandomFloat() -> CGFloat {
        let randomFloat = CGFloat(arc4random_uniform(100))/100.0
        return randomFloat
    }

    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        if motion == .MotionShake {
            addRandomViews()
        }
    }
}

