import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet weak var mapView: MKMapView!
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mapView.mapType = .Satellite
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
    }
    
    @IBAction func search(sender: AnyObject) {
        let textField = sender as! UITextField
        let searchQuery = textField.text!
        
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(searchQuery) { (placemarks, _) -> Void in
            if let placemarks = placemarks {
                if let firstresult = placemarks.first {
                    let coordinate = firstresult.location!.coordinate
                    
                    let searchPin = MapAnnotation(coordinate: coordinate, title: firstresult.name, subtitle: firstresult.subThoroughfare)
                    
                    self.mapView.addAnnotation(searchPin)
                    let camera = MKMapCamera(lookingAtCenterCoordinate: coordinate, fromDistance: 500, pitch: 45, heading: 45)
                    
                    self.mapView.setCamera(camera, animated: true)

                }
            }
        }
        
        
    }
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status == .AuthorizedWhenInUse {
//            let gaBldg = CLLocationCoordinate2DMake(40.739527, -73.989680)
//            let currentLocation = manager.location!.coordinate
            
//            let camera = MKMapCamera(lookingAtCenterCoordinate: gaBldg, fromDistance: 1000, pitch: 0, heading: 0)
//            
//            mapView.setCamera(camera, animated: true)
        
            mapView.showsUserLocation = true
        }
    }
}

class MapAnnotation : NSObject, MKAnnotation {
    let coordinate: CLLocationCoordinate2D
    let title: String?
    let subtitle: String?
    
    init(coordinate: CLLocationCoordinate2D, title: String?, subtitle: String?){
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
    }
}
