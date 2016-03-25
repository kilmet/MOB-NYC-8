import UIKit

class StoryViewController: UIViewController {

    var storyToLoad : NSURLRequest?
    
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let storyToLoad = storyToLoad {
            webView.loadRequest(storyToLoad)
        }
    }
}
