//
//  LocationCell.swift
//  VIPERGoogleMapsExam
//
//  Created by Harlene James Cruz on 11/9/23.
//

import UIKit

class LocationCell: UITableViewCell {

    let locationLabel = UILabel()
    
    var location : Location? {
        didSet {
            guard let location = location else { return }
            locationLabel.text = location.name
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        selectionStyle = .none
        locationLabel.numberOfLines = 0
        locationLabel.font = UIFont.boldSystemFont(ofSize: 16)
      
        [locationLabel].forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
            addSubview(view)
        }
        
        NSLayoutConstraint.activate([
            locationLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            locationLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            locationLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            locationLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }
}
