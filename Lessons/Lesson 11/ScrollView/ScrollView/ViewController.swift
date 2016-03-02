import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    
    var imageView : UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        
        imageView = UIImageView()
        imageView?.image = UIImage(named: "75.jpg")
        imageView?.sizeToFit()
        
        scrollView.contentSize = imageView!.frame.size
        
        scrollView.backgroundColor = UIColor.blackColor()
        scrollView.maximumZoomScale = 2.0
        
        scrollView.addSubview(imageView!)
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    @IBAction func doubleTap(sender: UITapGestureRecognizer) {
        
        let tapPoint = sender.locationInView(scrollView)
        
//        scrollView.zoomToRect(CGRect(origin: tapPoint, size: CGSize(width: 50, height: 50)), animated: true)
//        
        
        if scrollView.zoomScale > scrollView.minimumZoomScale {
            scrollView.setZoomScale(scrollView.minimumZoomScale, animated: true)
        } else {
            scrollView.setZoomScale(scrollView.maximumZoomScale, animated: true)
        }

    }
}

