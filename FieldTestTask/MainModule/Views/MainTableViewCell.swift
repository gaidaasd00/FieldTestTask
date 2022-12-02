//
//  MainTableViewCell.swift
//  FieldTestTask
//
//  Created by Alexey Gaidykov on 01.12.2022.
//

import UIKit

final class MainTableViewCell: UITableViewCell {
    private let nameLabel = UILabel()
    
    private let valueLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.text = "Test"
        label.font = Resource.Fonts.avenirNextRegular(with: 18)
        label.numberOfLines = 0
        return label
    }()
   //id cell
    static var mainTableViewID = "mainTableViewID"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        selectionStyle = .none
        nameLabel.font = Resource.Fonts.avenirNextRegular(with: 18)
        addView(nameLabel)
        addView(valueLabel)
    }
    
    public func configure(name: String) {
        nameLabel.text = name
    }
}

//MARK: - Set Constrains
extension MainTableViewCell {
    private func setConstrains() {
        NSLayoutConstraint.activate([
            heightAnchor.constraint(greaterThanOrEqualToConstant: 44),
            
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            nameLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.35),
            
            valueLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            valueLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            valueLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            valueLabel.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 10)
        
        ])
    }
}
