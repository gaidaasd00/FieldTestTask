//
//  PickerViewTableViewCell.swift
//  FieldTestTask
//
//  Created by Alexey Gaidykov on 05.12.2022.
//

import UIKit

final class PickerViewTableViewCell: UITableViewCell {
    static var pickerViewID = "pickerViewID"
    
    
    private let nameLabel = UILabel()
    private let genderPicker = GenderPickerView()
    private let genderTextField = GenderTextField()
    
    
    
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
        
        genderPicker.genderDelegate = self
        genderTextField.inputView = genderPicker
        contentView.addView(genderTextField)
    }
    
    public func configure(name: String) {
        nameLabel.text = name
    }
}
//MARK: - GenderPickerViewProtocol
extension PickerViewTableViewCell: GenderPickerViewProtocol {
    func didSelect(row: Int) {
        genderTextField.text  = Resource.Gender.allCases[row].rawValue
        genderTextField.resignFirstResponder()
    }
}

//MARK: - Set Constrains
extension PickerViewTableViewCell {
    private func setConstrains() {
        NSLayoutConstraint.activate([
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            nameLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.35),
            
            genderTextField.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            genderTextField.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 10),
            genderTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            genderTextField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
        ])
    }
}

