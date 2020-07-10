//
//  ListViewController.swift
//  MobileAxxessAssignment
//
//  Created by Tirupati Balan on 10/07/20.
//  Copyright (c) 2020 Celerstudio. All rights reserved.
//


import UIKit

final class ListViewController: BaseViewController {

    // MARK: - Public properties -

    var presenter: ListPresenterProtocol!

    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

// MARK: - Extensions -

extension ListViewController: ListViewProtocol {
}
