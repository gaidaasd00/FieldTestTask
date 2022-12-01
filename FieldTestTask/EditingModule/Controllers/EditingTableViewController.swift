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
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.mainTableViewID)
    }
    //setup all view
    private func setupViews() {
        title = "Просмотр"
        view.backgroundColor = .green
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.mainTableViewID, for: indexPath) as? MainTableViewCell else { return UITableViewCell()}
        
        let nameField = Resource.NameFields.allCases[indexPath.row].rawValue
        cell.configure(name: nameField)
        return cell
    }
}
    //MARK: - UITableViewDelegate
extension EditingTableViewController {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        indexPath.row == 1 ? UITableView.automaticDimension : 44
    }
}
