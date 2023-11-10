//
//  DestinationsInteractor.swift
//  VIPERGoogleMapsExam
//
//  Created by Harlene James Cruz on 11/9/23.
//

import Foundation

class DestinationsInteractor: DestinationsPresenterToInteractorProtocol {
    
    var presenter: DestinationsInteractorToPresenter?
    var destinations = [Destination]()
    
    func getDestinationsData() {
        destinations = [
        Destination(
            name: "Tagaytay",
            latitude: 14.1172832,
            longitude: 120.8865308),
        Destination(
            name: "Baguio",
            latitude: 16.3994238,
            longitude: 120.4411206),
        Destination(
            name: "Metro Manila",
            latitude: 14.5964947,
            longitude: 120.9383599)
        ]
        
        self.presenter?.success(destinations: destinations)
    }
    
    func retrieveDestination(at index: Int) {
        self.presenter?.getDestinationsSuccess(self.destinations[index])
    }
    
    
}
