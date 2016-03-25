import SwiftyJSON
import Alamofire
import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    var stories : [JSON] = []
    var refreshControl : UIRefreshControl?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: "getDataFromReddit", forControlEvents: .ValueChanged)
        tableView.addSubview(refreshControl!)
        tableView.dataSource = self
        tableView.delegate = self
        getDataFromReddit()
    }

    func getDataFromReddit() {
       Alamofire.request(.GET, "https://www.reddit.com/.json").responseData { response in
            if let data = response.data {
                let json = JSON(data: data)
                self.stories = json["data"]["children"].arrayValue
                dispatch_async(dispatch_get_main_queue(), {
                    self.refreshControl?.endRefreshing()
                    self.tableView.reloadData()
                })
            }
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        cell.textLabel?.text = stories[indexPath.row]["data"]["title"].stringValue
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stories.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let selectedStory = stories[indexPath.row]
        let webURLString = selectedStory["data"]["url"].stringValue
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

