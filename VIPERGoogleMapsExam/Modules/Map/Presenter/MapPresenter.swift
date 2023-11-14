//
//  MapPresenter.swift
//  VIPERGoogleMapsExam
//
//  Created by Harlene James Cruz on 11/9/23.
//

import Foundation
import CoreLocation
import GoogleMaps

class MapPresenter: MapViewToPresenterProtocol {
    
    weak var view: MapPresenterToViewProtocol?
    var interactor: MapPresenterToInteractorProtocol?
    var router: MapPresenterToRouterProtocol?
    
    func viewDidLoad(with map: GMSMapView) {
        interactor?.fetchMapData(with: map)
    }
    
    func getOrigin() -> CLLocation? {
        interactor?.origin ?? CLLocation(latitude: 0.0, longitude: 0.0)
    }
    
    func getDestination() -> Destination? {
        interactor?.destination
    }
    
//    func getRoutes() -> NSArray {
//        interactor?.routes ?? NSArray()
//    }
}

extension MapPresenter: MapInteractorToPresenterProtocol {
    
    func mapDataFetched() {
        view?.showMap()
    }
    
    func fail(errorMessage: String) {
        view?.showError()
    }
}
