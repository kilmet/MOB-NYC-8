import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var fileNameLabel: UILabel!
    
    @IBOutlet weak var commentInputField: UITextField!
    
    @IBOutlet weak var previousRatingLabel: UILabel!
    @IBOutlet weak var previousCommentLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    var ratings : [String:DetailedRating] = [:]
    var currentImage : String = "01"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = UIImage(named: currentImage)
        fileNameLabel.text = currentImage
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
        commentInputField.text = ""
        currentImage = getNextImage()
        imageView.image = UIImage(named: currentImage)
        
        if ratings[currentImage] == nil {
            previousRatingLabel.text = "Not yet rated"
            previousCommentLabel.text = "No comment"
            timeLabel.text = "Unknown"
        } else {
            previousRatingLabel.text = ratings[currentImage]?.rating.getDisplayValue()
            previousCommentLabel.text = ratings[currentImage]?.comment
            timeLabel.text = ratings[currentImage]?.time
        }
        fileNameLabel.text = currentImage
    }
    
    @IBAction func thumbsDownClicked(sender: AnyObject) {
        ratings[currentImage] = DetailedRating(fileName: currentImage, rating: .HatedIt, comment: commentInputField.text!)
        proceedToNextImage()
    }
    
    @IBAction func thumbsUpClicked(sender: AnyObject) {
        ratings[currentImage] = DetailedRating(fileName: currentImage, rating:.LovedIt, comment: commentInputField.text!)
    
        proceedToNextImage()
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        if motion == UIEventSubtype.MotionShake {
            //code here
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "gotoRatings" {
            let vc = segue.destinationViewController as! RatingsViewController
            vc.ratingDetails = Array(self.ratings.values)
        }
    }
}

