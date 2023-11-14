//
//  MapProtocol.swift
//  VIPERGoogleMapsExam
//
//  Created by Harlene James Cruz on 11/9/23.
//

import UIKit
import CoreLocation
import GoogleMaps

protocol MapViewToPresenterProtocol: AnyObject {
    
    var view: MapPresenterToViewProtocol? { get set }
    var interactor: MapPresenterToInteractorProtocol? { get set }
    var router: MapPresenterToRouterProtocol? { get set }
    
    func viewDidLoad(with map: GMSMapView)
    func getOrigin() -> CLLocation?
    func getDestination() -> Destination?
}

protocol MapPresenterToViewProtocol: AnyObject {
    func showMap()
    func showError()
}

protocol MapPresenterToInteractorProtocol: AnyObject {
    var presenter: MapInteractorToPresenterProtocol? { get set }
    
    var origin: CLLocation? { get }
    var destination: Destination? { get set }
    
    func fetchMapData(with map: GMSMapView)
}

protocol MapInteractorToPresenterProtocol: AnyObject {
    func mapDataFetched()
    func fail(errorMessage: String)
}

protocol MapPresenterToRouterProtocol: AnyObject {
    static func createModule(with location: Destination) -> UIViewController?
}
