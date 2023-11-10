//
//  MapProtocol.swift
//  VIPERGoogleMapsExam
//
//  Created by Harlene James Cruz on 11/9/23.
//

import UIKit

protocol MapViewToPresenterProtocol: AnyObject {
    
    var view: MapPresenterToViewProtocol? { get set }
    var interactor: MapPresenterToInteractorProtocol? { get set }
    var router: MapPresenterToRouterProtocol? { get set }
    
    func viewDidLoad()
}

protocol MapPresenterToViewProtocol: AnyObject {
    func setupMap(with location: String, latitude: Double, longitude: Double)
    func error(message: String)
}

protocol MapPresenterToInteractorProtocol: AnyObject {
    var presenter: MapInteractorToPresenterProtocol? { get set }
    
    var destination: Destination? { get set }
    
    func getMapData()
}

protocol MapInteractorToPresenterProtocol: AnyObject {
    func success(location: Destination)
    func fail(errorMessage: String)
}

protocol MapPresenterToRouterProtocol: AnyObject {
    static func createModule(with location: Destination) -> UIViewController?
}
