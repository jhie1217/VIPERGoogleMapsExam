//
//  MapViewController.swift
//  VIPERGoogleMapsExam
//
//  Created by Harlene James Cruz on 11/9/23.
//

import UIKit
import CoreLocation
import GoogleMaps

class MapViewController: UIViewController {
    
    var presenter: MapViewToPresenterProtocol?
    var destinations = [Destination]()
    
    @IBOutlet private weak var viewMap: GMSMapView!
    
    private var marker = GMSMarker()
    private var rectangle = GMSPolyline()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoad(with: viewMap)
    }
    
    private func setupMap() {
        self.viewMap.camera = GMSCameraPosition(
            latitude: presenter?.getOrigin()?.coordinate.latitude ?? 0.0,
            longitude: presenter?.getOrigin()?.coordinate.longitude ?? 0.0, zoom: 10.0)
        self.viewMap.isMyLocationEnabled = true
    }
    
    private func addSourceDestinationMarkers(){
        let markerSource = GMSMarker()
        markerSource.position = CLLocationCoordinate2D(
            latitude: presenter?.getDestination()?.latitude ?? 0.0,
            longitude: presenter?.getDestination()?.longitude ?? 0.0)
        markerSource.icon = UIImage(named: "markera")
        markerSource.title = presenter?.getDestination()?.name
        markerSource.map = viewMap
    }
}

extension MapViewController: MapPresenterToViewProtocol {
    
    func showMap() {
        setupMap()
        addSourceDestinationMarkers()
    }
    
    func showError() {
        let alert = UIAlertController(title: "Alert", message: "Problem Fetching Map Data", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
