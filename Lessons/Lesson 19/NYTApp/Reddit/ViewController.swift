import SwiftyJSON
import Alamofire
import AlamofireImage
import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    var stories : [JSON] = []
    var refreshControl : UIRefreshControl?

    
    let placeHolderImage = UIImage(named: "placeholder.png")
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: "getDataFromReddit", forControlEvents: .ValueChanged)
        tableView.addSubview(refreshControl!)
        tableView.dataSource = self
        tableView.delegate = self
        getDataFromNYT("home")
    }

    @IBAction func sectionSelected(sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0: getDataFromNYT("home")
        case 1: getDataFromNYT("politics")
        case 2: getDataFromNYT("sports")
        case 3: getDataFromNYT("nyregion")
        default: getDataFromNYT("home")
        }
    }
    
    func getDataFromNYT(section: String) {
        let dataURL = "http://api.nytimes.com/svc/topstories/v1/\(section).json?api-key=b27a046a282443a78775591db9fb6058:0:65410992"

       Alamofire.request(.GET, dataURL).responseData { response in
            if let data = response.data {
                let json = JSON(data: data)
                self.stories = json["results"].arrayValue
                dispatch_async(dispatch_get_main_queue(), {
                    self.refreshControl?.endRefreshing()
                    self.tableView.reloadData()
                })
            }
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)

        let imageURL = stories[indexPath.row]["multimedia"][0]["url"].stringValue
        
        cell.imageView?.image = nil
        
        
        let filter = AspectScaledToFillSizeWithRoundedCornersFilter(
            size: placeHolderImage!.size,
            radius: 20.0
        )
        
        let url = NSURL(string: imageURL)
        cell.imageView?.af_setImageWithURL(url!, placeholderImage: placeHolderImage, filter: filter, imageTransition: .CrossDissolve(0.9), runImageTransitionIfCached: false, completion: { (response)  in
            cell.setNeedsLayout()
        })

        cell.textLabel?.text = stories[indexPath.row]["title"].stringValue
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stories.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let selectedStory = stories[indexPath.row]
        let webURLString = selectedStory["url"].stringValue
        let webURL = NSURL(string: webURLString)
        let webURLRequest = NSURLRequest(URL: webURL!)
        performSegueWithIdentifier("web", sender: webURLRequest)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "web" {
            let storyVC = segue.destinationViewController as? StoryViewController
            storyVC?.storyToLoad = sender as? NSURLRequest
        }
    }
}

