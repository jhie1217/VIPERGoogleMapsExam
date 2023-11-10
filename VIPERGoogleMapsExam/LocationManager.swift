//
//  LocationManager.swift
//  VIPERGoogleMapsExam
//
//  Created by Harlene James Cruz on 11/10/23.
//

import CoreLocation

class LocationManager: NSObject {
    static let shared = LocationManager()
    
    private var locationManager = CLLocationManager()
    
    private override init() {
        super.init()
        self.setupLocationManager()
    }
    
    private func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func getCurrentLocation() -> CLLocation? {
        return locationManager.location
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // Handle location updates if needed
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        // Handle location errors if needed
    }
}
