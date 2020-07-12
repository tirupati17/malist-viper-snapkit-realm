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
    
    lazy var noResultView: UILabel = {
        var label = UILabel.init(frame: CGRect(x: 0, y: 0, width: listTableView.frame.size.width, height: listTableView.frame.size.height))
        label.backgroundColor = UIColor.clear
        label.text = LocalizationKey.Home.NoResultFound.localizedString()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()

    // MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupTableView()
        
        self.presenter.getChallenges()
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
    
    override func triggerRefreshControl() {
        self.presenter.getChallenges()
    }
    
    // MARK: - Methdos -
    func setupView() {
        self.navigationItem.title = "Challenges"
        
        view.addSubview(self.listTableView)
        view.setNeedsUpdateConstraints()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "sort"), style: .plain, target: self, action: #selector(sortItems))
    }
    
    @objc func sortItems() {
        self.presenter.sortChallenges()
    }
        
    func setupTableView() {
        listTableView.tableFooterView = UIView() //To remove extra cell lines
        listTableView.separatorInset = .init(top: 0, left: 0, bottom: 0, right: 0) // For full line separator
        
        listTableView.delegate = self
        listTableView.dataSource = self
        listTableView.register(ListTableViewCell.self, forCellReuseIdentifier: ListTableViewCell.cellIdentifier)
        setupRefreshControl(listTableView)
    }

}

// MARK: - Extensions -
extension ListViewController: ListViewProtocol {
    
    func reloadData() {
        self.listTableView.reloadData()
    }
        
    func showProgress() {
        self.showIndicator()
    }

    func hideProgress() {
        self.hideIndicator()
        self.refreshControl.endRefreshing()
    }
    
    func removeNoResult() {
        self.noResultView.removeFromSuperview()
    }

    func showNoResult(_ localizedDescription: String) {
        self.listTableView.backgroundView?.addSubview(self.noResultView)
        Logger.log(localizedDescription)
    }

}

// MARK: - UITableViewDataSource -
extension ListViewController: UITableViewDataSource {
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter.numberOrItems(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListTableViewCell.cellIdentifier, for: indexPath) as! ListTableViewCell
        cell.configureCell(self.presenter.item(at: indexPath))
        return cell
    }
    
}

// MARK: - UITableViewDelegate -
extension ListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
