//
//  EditingViewController.swift
//  FieldTestTask
//
//  Created by Alexey Gaidykov on 13.12.2022.
//

import UIKit

final class EditingViewController: UIViewController {
    private let editingTableView = EditingTableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstrains()
    }
    
    private func setupViews() {
        title = "Редактирование"
        view.backgroundColor = .white
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Сохранить",
            style: .plain,
            target: self,
            action: #selector(editingTapped)
        )
        
        view.addSubview(editingTableView)
    }
    @objc private func editingTapped() {
        print("tap")
    }
}

//MARK: - Set Constrains
extension EditingViewController {
    private func setConstrains() {
        NSLayoutConstraint.activate([
            editingTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            editingTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            editingTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0 ),
            editingTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0)
        ])
    }
}
