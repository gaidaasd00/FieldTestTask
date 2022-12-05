//
//  GenderPickerView.swift
//  FieldTestTask
//
//  Created by Alexey Gaidykov on 05.12.2022.
//
protocol GenderPickerViewProtocol: AnyObject {
    func didSelect(row: Int)
}


import UIKit

class GenderPickerView: UIPickerView {
    weak var genderDelegate: GenderPickerViewProtocol?
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        delegate = self
        dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - UITableViewDataSource
extension GenderPickerView: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        Resource.Gender.allCases.count
    }
    
    
}

//MARK: - UIPickerViewDelegate
extension GenderPickerView: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        Resource.Gender.allCases[row].rawValue
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        genderDelegate?.didSelect(row: row)
    }
}
