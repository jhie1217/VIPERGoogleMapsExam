//
//  DestinationCell.swift
//  VIPERGoogleMapsExam
//
//  Created by Harlene James Cruz on 11/9/23.
//

import UIKit

class DestinationCell: UITableViewCell {

    let destinationLabel = UILabel()
    
    var destination : Destination? {
        didSet {
            guard let destination = destination else { return }
            destinationLabel.text = destination.name
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
        destinationLabel.numberOfLines = 0
        destinationLabel.font = UIFont.boldSystemFont(ofSize: 16)
      
        [destinationLabel].forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
            addSubview(view)
        }
        
        NSLayoutConstraint.activate([
            destinationLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            destinationLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            destinationLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            destinationLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }
}
