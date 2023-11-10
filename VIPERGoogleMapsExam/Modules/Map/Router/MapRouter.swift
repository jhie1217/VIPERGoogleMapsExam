//
//  MapRouter.swift
//  VIPERGoogleMapsExam
//
//  Created by Harlene James Cruz on 11/9/23.
//

import UIKit

class MapRouter: MapPresenterToRouterProtocol {
    
    static func createModule(with location: Destination) -> UIViewController? {
        let mapStoryboard = UIStoryboard(name: "GoogleMap", bundle: nil)
        let view = mapStoryboard.instantiateViewController(withIdentifier: "MapViewController") as! MapViewController
        
//        let view = MapViewController()
        let presenter: MapViewToPresenterProtocol & MapInteractorToPresenterProtocol = MapPresenter()
        let interactor: MapPresenterToInteractorProtocol = MapInteractor()
        let router: MapPresenterToRouterProtocol = MapRouter()

        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.interactor?.destination = location
        presenter.router = router
        interactor.presenter = presenter

        return view
    }
}
