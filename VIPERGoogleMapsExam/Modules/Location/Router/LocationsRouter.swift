//
//  LocationsRouter.swift
//  VIPERGoogleMapsExam
//
//  Created by Harlene James Cruz on 11/9/23.
//

import Foundation

class LocationsRouter: PresenterToRouterProtocol {
    static func createModule() -> LocationsViewController {
        let view = LocationsViewController()
        let presenter : ViewToPresenterProtocol & InteractorToPresenter = LocationsPresenter()
        let interactor : PresenterToInteractorProtocol = LocationsInteractor()
        let router : PresenterToRouterProtocol = LocationsRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view
    }
}
