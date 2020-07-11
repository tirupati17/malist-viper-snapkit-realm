//
//  ListViewController.swift
//  MobileAxxessAssignment
//
//  Created by Tirupati Balan on 10/07/20.
//  Copyright (c) 2020 Celerstudio. All rights reserved.
//

import UIKit
    
final class ListViewController: BaseViewController {

    // MARK: - IBOutlet properties -
    var listTableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()

    // MARK: - Public properties -
    var presenter: ListPresenterProtocol!

    // MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupTableView()
    }
    
    // MARK: - Constraints -
    override func updateViewConstraints() {
        if (!didSetupConstraints) {
            listTableView.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
            
            didSetupConstraints = true
        }
        super.updateViewConstraints()
    }
    
    // MARK: - Methdos -
    func setupView() {
        self.navigationItem.title = "Challenges"
        
        view.addSubview(self.listTableView)
        view.setNeedsUpdateConstraints()
    }
        
    func setupTableView() {
        listTableView.tableFooterView = UIView() //To remove extra cell lines
        
        listTableView.delegate = self
        listTableView.dataSource = self
        listTableView.register(ListTableViewCell.self, forCellReuseIdentifier: ListTableViewCell.cellIdentifier)
    }

}

// MARK: - Extensions -
extension ListViewController: ListViewProtocol {
}

// MARK: - UITableViewDataSource -
extension ListViewController: UITableViewDataSource {
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 40
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListTableViewCell.cellIdentifier, for: indexPath) as! ListTableViewCell
        
        cell.configureCell(nil)
        return cell
    }
    
}

// MARK: - UITableViewDelegate -
extension ListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
