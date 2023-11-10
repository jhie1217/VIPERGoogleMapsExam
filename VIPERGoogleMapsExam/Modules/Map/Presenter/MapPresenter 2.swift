//
//  MapPresenter.swift
//  VIPERGoogleMapsExam
//
//  Created by Harlene James Cruz on 11/9/23.
//

import Foundation
import CoreLocation

class MapPresenter: MapViewToPresenterProtocol {
    
    weak var view: MapPresenterToViewProtocol?
    var interactor: MapPresenterToInteractorProtocol?
    var router: MapPresenterToRouterProtocol?
    
    func viewDidLoad() {
        interactor?.getMapData()
    }
}

extension MapPresenter: MapInteractorToPresenterProtocol {
    func success(location: Destination) {
        view?.setupMap(
            with: location.name,
            latitude: location.latitude,
            longitude: location.longitude)
    }
    
    func fail(errorMessage: String) {
        view?.error(message: errorMessage)
    }
}
