//
//  ViewController.swift
//  FieldTestTask
//
//  Created by Alexey Gaidykov on 01.12.2022.
//

import UIKit

final class MainTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        
        //register cell
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.mainTableViewID)
    }
    //setup all view
    private func setupViews() {
        title = "Просмотр"
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Редактировать", style: .plain, target: self, action: #selector(editingTapped))
    }
    //method for switch another TableViewController
    @objc private func editingTapped() {
        let editingTableViewController = EditingTableViewController()
        navigationItem.backButtonTitle = "Назад"
        navigationController?.pushViewController(editingTableViewController, animated: true)
    }

}

    //MARK: - UITableViewDataSource
extension MainTableViewController {
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
extension MainTableViewController {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        indexPath.row == 1 ? UITableView.automaticDimension : 44
    }
}
