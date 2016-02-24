import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var amount: UITextField!
    
    @IBOutlet weak var total: UILabel!
    
    @IBAction func slideChanged(sender: UISlider) {
        let originalAmount = Float(amount.text!)
        
        let tipPct = sender.value
        
        let finalAmount = originalAmount! + (tipPct/100 * originalAmount!)
        
        total.text = String(finalAmount)
    }

}

