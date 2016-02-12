import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var previousRatingLabel: UILabel!
    
    var ratings : [String:RatingType] = [:]
    var currentImage : String = "01"
    
    enum RatingType {
        case NotYetRated, LovedIt, HatedIt
        
        func getDisplayValue() -> String{
            switch self {
            case .NotYetRated: return "Not Yet Rated"
            case .LovedIt: return "Loved it 😃"
            case .HatedIt: return "Hated it 😖"
            }
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = UIImage(named: currentImage)
    }

    func getNextImage() ->  String {
        var random = arc4random_uniform(10)
        if random == 0 {
            random = 1 //because i dont have a file "0"
        }
        
        if (random < 10) {
            return "0\(random)"
        } else {
            return "\(random)"
        }
    }
    
    func proceedToNextImage() {
        currentImage = getNextImage()
        imageView.image = UIImage(named: currentImage)
        
        if ratings[currentImage] == nil {
            previousRatingLabel.text = "Not yet rated"
        } else {
            previousRatingLabel.text = ratings[currentImage]?.getDisplayValue()
        }
    }
    
    @IBAction func thumbsDownClicked(sender: AnyObject) {
        ratings[currentImage] = .HatedIt
        proceedToNextImage()
    }
    
    @IBAction func thumbsUpClicked(sender: AnyObject) {
        ratings[currentImage] = .LovedIt
        proceedToNextImage()
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        if motion == UIEventSubtype.MotionShake {
            //code here
        }
    }
}

