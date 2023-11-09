//
//  LocationsPresenter.swift
//  VIPERGoogleMapsExam
//
//  Created by Harlene James Cruz on 11/9/23.
//

import Foundation

class LocationsPresenter: ViewToPresenterProtocol {
    
    var view: PresenterToViewProtocol?
    
    var interactor: PresenterToInteractorProtocol?
    
    var router: PresenterToRouterProtocol?
    
    func getLocationsData() {
        interactor?.getLocationsData()
    }
}

extension LocationsPresenter: InteractorToPresenter {
    func success(locations: [Location]) {
        view?.displayLocations(locations: locations)
    }
    
    func fail(errorMessage: String) {
        view?.error(message: errorMessage)
    }
}
