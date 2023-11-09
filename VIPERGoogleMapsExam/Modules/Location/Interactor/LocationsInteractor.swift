//
//  LocationsInteractor.swift
//  VIPERGoogleMapsExam
//
//  Created by Harlene James Cruz on 11/9/23.
//

import Foundation

class LocationsInteractor: PresenterToInteractorProtocol {
    
    var presenter: InteractorToPresenter?
    
    
    func getLocationsData() {
        let locations: [Location] = [
        Location(name: "Tagaytay", longitude: 14.1172832, latitude: 120.8865308),
        Location(name: "Baguio", longitude: 16.3994238, latitude: 120.4411206),
        Location(name: "Metro Manila", longitude: 14.5964947, latitude: 120.9383599)
        ]
        
        self.presenter?.success(locations: locations)
    }
}
