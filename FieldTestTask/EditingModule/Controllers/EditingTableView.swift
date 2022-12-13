//
//  EditingTableView.swift
//  FieldTestTask
//
//  Created by Alexey Gaidykov on 13.12.2022.
//

import UIKit

final class EditingTableView: UITableView {
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        //register cells
        register(TextViewTableViewCell.self, forCellReuseIdentifier: TextViewTableViewCell.textViewTableViewID)
        register(DatePickerTableViewCell.self, forCellReuseIdentifier: DatePickerTableViewCell.datePickerID)
        register(PickerViewTableViewCell.self, forCellReuseIdentifier: PickerViewTableViewCell.pickerViewID)
        
        delegate = self
        dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - UITableViewDataSource
extension EditingTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Resource.NameFields.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let nameField = Resource.NameFields.allCases[indexPath.row].rawValue
        
        switch indexPath.row {
        case 0...2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TextViewTableViewCell.textViewTableViewID, for: indexPath) as? TextViewTableViewCell else { return UITableViewCell() }
            cell.nameTexViewDelegate = self
            if indexPath.row == 1 {
                cell.configure(name: nameField, scrollEnable: false)
            } else {
                cell.configure(name: nameField, scrollEnable: true)
            }
            return cell
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DatePickerTableViewCell.datePickerID, for: indexPath) as? DatePickerTableViewCell else { return UITableViewCell() }
            cell.configure(name: nameField)
            return cell
        case 4:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PickerViewTableViewCell.pickerViewID, for: indexPath) as? PickerViewTableViewCell else { return UITableViewCell() }
            cell.configure(name: nameField)
            return cell
        default:
            return UITableViewCell()
        }
    }
}
//MARK: - UITableViewDelegate
extension EditingTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        indexPath.row == 1 ? UITableView.automaticDimension : 44
    }
}

extension EditingTableView: NameTextViewProtocol {
    func changeSize() {
        beginUpdates()
        endUpdates()
    }
}

