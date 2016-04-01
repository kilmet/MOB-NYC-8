import MapKit
import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, MKMapViewDelegate {
    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        
        let mapCenter = CLLocationCoordinate2DMake(40.742322, -73.988836)
        let camera = MKMapCamera(lookingAtCenterCoordinate: mapCenter, fromDistance: 15000, pitch: 0, heading: 0)
        mapView.setCamera(camera, animated: false)
        loadCitibikeData()
    }
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        
        if let annotation = annotation as? Station {
            if annotation.bikesAvailable > 0 {
                var pinView = mapView.dequeueReusableAnnotationViewWithIdentifier("openStation") as? MKPinAnnotationView
                
                if let pinView = pinView {
                    pinView.annotation = annotation
                } else {
                    pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "openStation")
                    pinView?.pinTintColor = UIColor.greenColor()
                    pinView?.canShowCallout = true
                }
                return pinView
            } else {
                var pinView = mapView.dequeueReusableAnnotationViewWithIdentifier("closedStation") as? MKPinAnnotationView
                
                if let pinView = pinView {
                    pinView.annotation = annotation
                } else {
                    pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "closedStation")
                    pinView?.pinTintColor = UIColor.magentaColor()
                    pinView?.animatesDrop = true
                    pinView?.canShowCallout = true
                }
                return pinView
            }
        }
        
        return nil
    }
    
    func loadCitibikeData() {
        mapView.removeAnnotations(mapView.annotations)
        let dataURL = "https://www.citibikenyc.com/stations/json"
        
        Alamofire.request(.GET, dataURL).responseData { response in
            if let data = response.data {
                let json = JSON(data: data)
                let stations = json["stationBeanList"].arrayValue
                for station in stations {
                    
                    let coordinate = CLLocationCoordinate2DMake(station["latitude"].doubleValue, station["longitude"].doubleValue)
                    
                    let stationAnnotation = Station(coordinate: coordinate, title: station["stationName"].stringValue, bikesAvailable: station["availableBikes"].intValue)
                    
                    dispatch_async(dispatch_get_main_queue(), {
                        self.mapView.addAnnotation(stationAnnotation)
                    })
                }
            }
        }
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        if motion == .MotionShake {
            loadCitibikeData()
        }
    }
}

class Station:NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var bikesAvailable = 0
    
    var subtitle: String? {
        return "\(bikesAvailable) bikes are available"
    }
    
    init(coordinate: CLLocationCoordinate2D,title: String?,bikesAvailable: Int) {
        self.coordinate = coordinate
        self.title = title
        self.bikesAvailable = bikesAvailable
    }
}

