import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var amount: UITextField!
    
    @IBOutlet weak var total: UILabel!
    
    @IBOutlet weak var totalContainer: UIView!
    @IBOutlet weak var tipTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tipTable.dataSource = self
        amount.becomeFirstResponder()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardIsShowing", name: UIKeyboardDidShowNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardIsHiding", name: UIKeyboardDidHideNotification, object: nil)
    }
    
    func keyboardIsShowing() {
        totalContainer.hidden = true
    }
    
    func keyboardIsHiding(){
        totalContainer.hidden = false
    }
    
    @IBAction func enterClicked(sender: AnyObject) {
        amount.resignFirstResponder()
        tipTable.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if amount.text == nil || amount.text == "" {
            return 0
        } else {
            return 3
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "10% - " + getFinalAmount(amount.text!,tipPct: 10.0)
        case 1:
            cell.textLabel?.text = "15% - " + getFinalAmount(amount.text!,tipPct: 15.0)
        case 2:
            cell.textLabel?.text = "20% - " + getFinalAmount(amount.text!,tipPct: 20.0)
        default:
            break
        }
        
        
        return cell
    }
    @IBAction func slideChanged(sender: UISlider) {
        total.text = getFinalAmount(amount.text!,tipPct: sender.value)
    }
    
    func getFinalAmount(originalAmount: String, tipPct : Float) -> String {
        
        let originalAmount = Float(originalAmount)
        
        return String(originalAmount! + (tipPct/100 * originalAmount!))

    }

}

