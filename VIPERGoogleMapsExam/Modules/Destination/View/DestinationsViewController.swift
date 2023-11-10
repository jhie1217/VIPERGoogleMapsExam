//
//  LocationsTableViewController.swift
//  VIPERGoogleMapsExam
//
//  Created by Harlene James Cruz on 11/9/23.
//

import UIKit

fileprivate let reuseIdentifier = "DestinationCellId"

class DestinationsViewController: UITableViewController{

    var presenter: DestinationsViewToPresenterProtocol?
    var destinations = [Destination]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        presenter?.getDestinationsData()
    }

    private func setupLayout() {
        navigationItem.title = "Destinations"
        tableView.tableFooterView = UIView()
        tableView.register(DestinationCell.self, forCellReuseIdentifier: reuseIdentifier)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return destinations.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! DestinationCell
        cell.destination = destinations[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectRowAt(index: indexPath.row)
        presenter?.deselectRowAt(index: indexPath.row)
    }
}

extension DestinationsViewController: DestinationsPresenterToViewProtocol {
    
    func displayDestinations(destinations: [Destination]) {
        self.destinations = destinations
       
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func error(message: String) {
         print(message)
    }
    
    func deselectRowAt(row: Int) {
        self.tableView.deselectRow(at: IndexPath(row: row, section: 0), animated: true)
    }
}
