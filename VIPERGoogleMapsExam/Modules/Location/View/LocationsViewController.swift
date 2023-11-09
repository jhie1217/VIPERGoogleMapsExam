//
//  LocationsTableViewController.swift
//  VIPERGoogleMapsExam
//
//  Created by Harlene James Cruz on 11/9/23.
//

import UIKit

fileprivate let reuseIdentifier = "LocationCellId"

class LocationsViewController: UITableViewController {

    var presenter : ViewToPresenterProtocol?
    var locations = [Location]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        presenter?.getLocationsData()
    }

    private func setupLayout() {
        navigationItem.title = "Locations"
        tableView.tableFooterView = UIView()
        tableView.register(LocationCell.self, forCellReuseIdentifier: reuseIdentifier)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! LocationCell
        cell.location = locations[indexPath.row]
        return cell
    }
}

extension LocationsViewController : PresenterToViewProtocol {
    func displayLocations(locations: [Location]) {
        self.locations = locations
       
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func error(message: String) {
         print(message)
    }
}
