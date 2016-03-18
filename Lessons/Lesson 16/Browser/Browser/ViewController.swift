
import UIKit

class ViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var addressBar: UITextField!
    @IBOutlet weak var favoritesBar: UISegmentedControl!
    
    var history : [String] = []
    
    @IBAction func loadNewURL(sender: UITextField) {
        favoritesBar.selectedSegmentIndex = -1
        updateWebViewWithURL(sender.text!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let previousUrl = NSUserDefaults.standardUserDefaults().stringForKey("previous_url")
        
        let loadPreviousPage = NSUserDefaults.standardUserDefaults().boolForKey("load_previous")
        
        if loadPreviousPage && previousUrl != nil && !previousUrl!.isEmpty {
            updateWebViewWithURL(previousUrl!)
        } else {
            updateWebViewWithURL("http://www.nyt.com")
        }

        activityIndicator.hidesWhenStopped = true
    }
    
    func updateWebViewWithURL(newURL: String){
        var urlToUpdate = newURL
        if !urlToUpdate.hasPrefix("http://"){
            urlToUpdate = "http://\(urlToUpdate)"
        }
        
        let url = NSURL(string: urlToUpdate)
        let request = NSURLRequest(URL: url!)
        
        webView.delegate = self
        
        webView.loadRequest(request)
        
        addressBar.text = urlToUpdate
        history.append(urlToUpdate)
        NSUserDefaults.standardUserDefaults().setValue(urlToUpdate, forKey: "previous_url")
    }
    
    func webViewDidStartLoad(webView: UIWebView) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        activityIndicator.startAnimating()
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        activityIndicator.stopAnimating()
    }
    
    @IBAction func favoriteBarClicked(sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:updateWebViewWithURL("nyt.com")
        case 1:updateWebViewWithURL("cnn.com")
        case 2:updateWebViewWithURL("foxnews.com")
        case 3:updateWebViewWithURL("cbs.com")
        case 4:
            sender.selectedSegmentIndex = -1
            performSegueWithIdentifier("history", sender: nil)
        default: break
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let historyVC = segue.destinationViewController as! HistoryViewController
        
        historyVC.history = self.history
    }

}

