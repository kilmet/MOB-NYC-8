import UIKit

class BeatlesViewController: UIViewController, UITableViewDataSource {

    var beatles = ["george","ringo","paul","john"]
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beatles.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("beatlesCell", forIndexPath: indexPath)
        
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = UIColor.lightGrayColor()
        }
        cell.textLabel?.text = beatles[indexPath.row]
        return cell
    }
}
