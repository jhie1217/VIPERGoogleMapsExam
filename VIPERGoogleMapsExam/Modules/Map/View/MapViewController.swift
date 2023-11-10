//
//  MapViewController.swift
//  VIPERGoogleMapsExam
//
//  Created by Harlene James Cruz on 11/9/23.
//

import UIKit
import GoogleMaps
import CoreLocation
import Alamofire
import SwiftyJSON
import GooglePlaces

class MapViewController: UIViewController {
    
    var presenter: MapViewToPresenterProtocol?
    var destinations = [Destination]()
    var lat = 0.0
    var lon = 0.0
    var loc = CLLocation()
    
    @IBOutlet weak var mapView: GMSMapView!
    
    var marker = GMSMarker()
    var sourceLat = 16.3994238
    var sourceLong = 120.4411206
    var rectangle = GMSPolyline()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoad()
        drawPath()
    }
    
    private func drawPath() {
        let origin = "\(14.94036),\(120.907485)"
        let destination = "\(14.5964647),\(120.9383599)"
        
        print("zzz\(sourceLat)\(sourceLong)")
        
        let urlString = "https://maps.googleapis.com/maps/api/directions/json?origin=\(origin)&destination=\(destination)&key=AIzaSyD3OFyan7RVBHQqPrls9i-79unOp9yptT4"
        
        
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!, completionHandler: {
            (data, response, error) in
            if(error != nil) {
                print("error")
            } else {
                DispatchQueue.main.async {
                    self.mapView.clear()
                    self.addSourceDestinationMarkers()
                }
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options:.allowFragments) as! [String : AnyObject]
                    let routes = json["routes"] as! NSArray
                    
                    OperationQueue.main.addOperation({
                        for route in routes {
                            let routeOverviewPolyline:NSDictionary = (route as! NSDictionary).value(forKey: "overview_polyline") as! NSDictionary
                            let points = routeOverviewPolyline.object(forKey: "points")
                            let path = GMSPath.init(fromEncodedPath: points! as! String)
                            let polyline = GMSPolyline.init(path: path)
                            polyline.strokeWidth = 3
                            polyline.strokeColor = UIColor(red: 50/255, green: 165/255, blue: 102/255, alpha: 1.0)
                            
                            let bounds = GMSCoordinateBounds(path: path!)
//                            self.mapView!.animate(with: GMSCameraUpdate.fit(bounds, withPadding: 30.0))
                            self.mapView.camera = GMSCameraPosition(latitude: self.sourceLat, longitude: self.sourceLong, zoom: 12.0)
                            
                            polyline.map = self.mapView
                        }
                    })
                }catch let error as NSError{
                    print("error:\(error)")
                }
            }
        }).resume()
    }
    
    func addSourceDestinationMarkers(){
        let markerSource = GMSMarker()
        //markerSource.position = CLLocationCoordinate2D(latitude: 24.9216774, longitude: 67.0914983)
        markerSource.position = CLLocationCoordinate2D(latitude: 24.871941, longitude: 66.988060)
        markerSource.icon = UIImage(named: "markera")
        markerSource.title = "Point A"
        //markerSource.snippet = "Desti"
        
        markerSource.map = mapView
        
        let markertDestination = GMSMarker()
        //markertDestination.position = CLLocationCoordinate2D(latitude: 24.9623483, longitude: 67.0463966)
        markertDestination.position = CLLocationCoordinate2D(latitude: 24.885950, longitude: 67.026744)
        markertDestination.icon = UIImage(named: "markerb")
        markertDestination.title = "Point B"
        //markertDestination.snippet = "General Store"
        markertDestination.map = mapView
    }
}

extension MapViewController: MapPresenterToViewProtocol {
    func setupMap(with location: String, latitude: Double, longitude: Double) {
        
        lat = latitude
        lon = longitude
        
        
//        let camera = GMSCameraPosition.camera(withLatitude: latitude, longitude: longitude, zoom: 12.0)
//        let mapView = GMSMapView.map(withFrame: view.frame, camera: camera)
//        view.addSubview(mapView)
    }
    
    
    func error(message: String) {
        print(message)
    }
}

extension MapViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let userLocation: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        sourceLat = userLocation.latitude
        sourceLong = userLocation.longitude
        print("zxc\(userLocation)")
    }
}
