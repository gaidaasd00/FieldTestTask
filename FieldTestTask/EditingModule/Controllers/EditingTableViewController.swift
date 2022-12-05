//
//  EditingViewController.swift
//  FieldTestTask
//
//  Created by Alexey Gaidykov on 01.12.2022.
//


import UIKit

final class EditingTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        
        //register cell
        tableView.register(TextViewTableViewCell.self, forCellReuseIdentifier: TextViewTableViewCell.textViewTableViewID)
        tableView.register(DatePickerTableViewCell.self, forCellReuseIdentifier: DatePickerTableViewCell.datePickerID)
    }
    //setup all view
    private func setupViews() {
        title = "Редактирование"
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Сохранить", style: .plain, target: self, action: #selector(editingTapped))
    }
    @objc private func editingTapped() {
        print("tap")
    }

}

    //MARK: - UITableViewDataSource
extension EditingTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Resource.NameFields.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
        default:
            return UITableViewCell()
        }
    }
}
    //MARK: - UITableViewDelegate
extension EditingTableViewController {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        indexPath.row == 1 ? UITableView.automaticDimension : 44
    }
}

extension EditingTableViewController: NameTextViewProtocol {
    func changeSize() {
        tableView.beginUpdates()
        tableView.endUpdates()
    }
}
