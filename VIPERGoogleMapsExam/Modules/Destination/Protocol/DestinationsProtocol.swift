//
//  Protocols.swift
//  VIPERGoogleMapsExam
//
//  Created by Harlene James Cruz on 11/9/23.
//

import Foundation

protocol DestinationsViewToPresenterProtocol: AnyObject {
    var view: DestinationsPresenterToViewProtocol? { get set }
    var interactor: DestinationsPresenterToInteractorProtocol? { get set }
    var router: DestinationsPresenterToRouterProtocol? { get set }
    
    func getDestinationsData()
    func didSelectRowAt(index: Int)
    func deselectRowAt(index: Int)
}

protocol DestinationsPresenterToViewProtocol: AnyObject {
    func displayDestinations(destinations: [Destination])
    func error(message: String)
    func deselectRowAt(row: Int)
}

protocol DestinationsPresenterToInteractorProtocol : AnyObject {
    var presenter: DestinationsInteractorToPresenter? { get set }
    func getDestinationsData()
    func retrieveDestination(at index: Int)
}

protocol DestinationsInteractorToPresenter: AnyObject {
    func success(destinations: [Destination])
    func fail(errorMessage: String)
    func getDestinationsSuccess(_ destination: Destination)
}

protocol DestinationsPresenterToRouterProtocol: AnyObject {
    static func createModule() -> DestinationsViewController
    
    func pushToMap(on view: DestinationsPresenterToViewProtocol, with destination: Destination)
}
