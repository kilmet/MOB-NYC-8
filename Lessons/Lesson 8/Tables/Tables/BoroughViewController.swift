import UIKit

class BoroughViewController: UIViewController, UITableViewDataSource {

    var boroughs = ["manhanttan","queens","brooklyn","stanten island","bronx"]
    
    @IBOutlet weak var tableView: UITableView!
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return boroughs.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("boroughCell", forIndexPath: indexPath)
        
        cell.textLabel?.text = boroughs[indexPath.row]
        
        return cell
    }
    @IBAction func addABorough(sender: AnyObject) {
        boroughs.append("New Jersey")
        tableView.reloadData()
    }
    
}
