//
//  Protocols.swift
//  VIPERGoogleMapsExam
//
//  Created by Harlene James Cruz on 11/9/23.
//

import Foundation

protocol ViewToPresenterProtocol: AnyObject {
    
    var view: PresenterToViewProtocol? { get set }
    var interactor: PresenterToInteractorProtocol? { get set }
    var router: PresenterToRouterProtocol? { get set }
    
    func getLocationsData()
}

protocol PresenterToViewProtocol: AnyObject {
    func displayLocations(locations: [Location])
    func error(message: String)
}

protocol PresenterToInteractorProtocol : AnyObject {
    var presenter: InteractorToPresenter? { get set }
    func getLocationsData()
}

protocol InteractorToPresenter: AnyObject {
    func success(locations: [Location])
    func fail(errorMessage: String)
}

protocol PresenterToRouterProtocol: AnyObject {
    static func createModule() -> LocationsViewController
}
