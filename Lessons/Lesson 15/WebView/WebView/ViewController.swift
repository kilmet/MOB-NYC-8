import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = NSURL(string: "http://www.nyt.com")
        let urlRequest = NSURLRequest(URL: url!)
        webView.loadRequest(urlRequest)
        
    }

}

