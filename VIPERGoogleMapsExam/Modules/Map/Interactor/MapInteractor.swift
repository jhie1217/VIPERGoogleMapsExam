//
//  MapInteractor.swift
//  VIPERGoogleMapsExam
//
//  Created by Harlene James Cruz on 11/9/23.
//

import Foundation
import CoreLocation
import GoogleMaps

class MapInteractor: MapPresenterToInteractorProtocol {
    
    var presenter: MapInteractorToPresenterProtocol?
    var destination: Destination?
    var origin: CLLocation?
    
    private let apiKey = "AIzaSyD3OFyan7RVBHQqPrls9i-79unOp9yptT4"
    private let baseAPIURL = "https://maps.googleapis.com/maps/api/directions/json?origin="
    let locationManager = LocationManager.shared
    
    func fetchMapData(with map: GMSMapView) {
        origin = locationManager.getCurrentLocation()
        
        let originCoordinates = "\(origin?.coordinate.latitude ?? 0.0),\(origin?.coordinate.longitude ?? 0.0)"
        let destinationCoordinates = "\(destination?.latitude ?? 0.0),\(destination?.longitude ?? 0.0)"
        let urlString = "\(baseAPIURL)\(originCoordinates)&destination=\(destinationCoordinates)&key=\(apiKey)"
        
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!, completionHandler: {
            (data, response, error) in
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [String : AnyObject]
                let routes = json["routes"] as! NSArray
                
                OperationQueue.main.addOperation({
                    for route in routes {
                        let routeOverviewPolyline:NSDictionary = (route as! NSDictionary).value(forKey: "overview_polyline") as! NSDictionary
                        let points = routeOverviewPolyline.object(forKey: "points")
                        let path = GMSPath.init(fromEncodedPath: points! as! String)
                        let polyline = GMSPolyline.init(path: path)
                        polyline.strokeWidth = 3
                        polyline.strokeColor = UIColor(red: 50/255, green: 165/255, blue: 102/255, alpha: 1.0)
                        polyline.map = map
                    }
                })
            } catch let error {
                self.presenter?.fail(errorMessage: "\(error)")
            }
        }).resume()
        
        self.presenter?.mapDataFetched()
    }
}
