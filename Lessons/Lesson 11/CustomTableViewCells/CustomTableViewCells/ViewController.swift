import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 25
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if indexPath.row == 5 {
            return tableView.dequeueReusableCellWithIdentifier("anothercell", forIndexPath: indexPath)
        }
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)

        
//        print("original cell value \(cell.textLabel?.text)")
//        print("asking for \(indexPath.row + 1)")
    
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = UIColor.lightGrayColor()
            cell.viewWithTag(35)?.backgroundColor = UIColor.yellowColor()

        } else {
            cell.backgroundColor = UIColor.whiteColor()
            cell.viewWithTag(35)?.backgroundColor = UIColor.purpleColor()
        }
        
//        cell.textLabel?.text = "Row number - \(indexPath.row + 1)"
        
        let label = cell.viewWithTag(550) as! UILabel
        label.text = "\(indexPath.row + 1)"
        
        return cell
    }
}

