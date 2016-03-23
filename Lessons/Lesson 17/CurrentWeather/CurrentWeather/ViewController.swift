import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var weatherLabel: UILabel!
    
    @IBAction func loadWeather(sender: UITextField) {
        if let city = sender.text {
        let weatherURL = "http://api.openweathermap.org/data/2.5/weather?q=\(city)&APPID=01aa24f56b697f46a6d887a867e53025"
        if let url = NSURL(string: weatherURL) {
            let urlSession = NSURLSession.sharedSession()
            let task = urlSession.dataTaskWithURL(url) { (data, response, error) -> Void in
                if let error = error {
                    print("error: \(error.localizedDescription)")
                }
                
                if let response = response as? NSHTTPURLResponse {
                    print(response.statusCode)
                }
                
                if let data = data {
                    do {
                        let json = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions())
                        
                        let main = json.valueForKey("main") as? NSDictionary
                        let temp = main?.valueForKey("temp") as? Float
                        
                        if let temp = temp {
                            let tempInFarenheit = (temp * 9/5) - 459.67

                            dispatch_async(dispatch_get_main_queue(), {
                                self.weatherLabel.text = "\(tempInFarenheit) degrees"
                            })
                        }
                        
                    } catch {
                        print("invalid json")
                    }
                    
                } else {
                    print("could not get data back")
                }
            }
            task.resume()
        } else {
            print("not a valid url")
        }
    }
    }
    
}

