//
//  DestinationsPresenter.swift
//  VIPERGoogleMapsExam
//
//  Created by Harlene James Cruz on 11/9/23.
//

import Foundation

class DestinationsPresenter: DestinationsViewToPresenterProtocol {
    
    var view: DestinationsPresenterToViewProtocol?
    var interactor: DestinationsPresenterToInteractorProtocol?
    var router: DestinationsPresenterToRouterProtocol?
    
    func getDestinationsData() {
        interactor?.getDestinationsData()
    }
    
    func didSelectRowAt(index: Int) {
        interactor?.retrieveDestination(at: index)
    }
    
    func deselectRowAt(index: Int) {
        view?.deselectRowAt(row: index)
    }
}

extension DestinationsPresenter: DestinationsInteractorToPresenter {
    func getDestinationsSuccess(_ destination: Destination) {
        router?.pushToMap(on: view!, with: destination)
    }
    
    func success(destinations: [Destination]) {
        view?.displayDestinations(destinations: destinations)
    }
    
    func fail(errorMessage: String) {
        view?.error(message: errorMessage)
    }
}
