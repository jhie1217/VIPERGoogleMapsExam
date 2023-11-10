//
//  DestinationsRouter.swift
//  VIPERGoogleMapsExam
//
//  Created by Harlene James Cruz on 11/9/23.
//

import UIKit

class DestinationsRouter: DestinationsPresenterToRouterProtocol {
    
    
    static func createModule() -> DestinationsViewController {
        
        let view = DestinationsViewController()
        let presenter: DestinationsViewToPresenterProtocol & DestinationsInteractorToPresenter = DestinationsPresenter()
        let interactor: DestinationsPresenterToInteractorProtocol = DestinationsInteractor()
        let router: DestinationsPresenterToRouterProtocol = DestinationsRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view
    }
    
    func pushToMap(on view: DestinationsPresenterToViewProtocol, with destination: Destination) {
        if let mapVC = MapRouter.createModule(with: destination) {
            
            let vc = view as! DestinationsViewController
            vc.navigationController?.pushViewController(mapVC, animated: true)
        }
    }
}
