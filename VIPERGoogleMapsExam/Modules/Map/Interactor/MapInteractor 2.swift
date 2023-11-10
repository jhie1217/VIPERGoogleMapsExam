//
//  MapInteractor.swift
//  VIPERGoogleMapsExam
//
//  Created by Harlene James Cruz on 11/9/23.
//

import Foundation
import GoogleMaps
import CoreLocation

class MapInteractor: MapPresenterToInteractorProtocol {
    
    var presenter: MapInteractorToPresenterProtocol?
    var destination: Destination?
    private var locationManager = CLLocationManager()
    var currentLocation = CLLocation()
    
    func getMapData() {
        GMSServices.provideAPIKey("AIzaSyD3OFyan7RVBHQqPrls9i-79unOp9yptT4")
        
        self.presenter?.success(location: self.destination!)
    }
}
