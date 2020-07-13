//
//  ListDetailWireframe.swift
//  MAList
//
//  Created by Tirupati Balan on 12/07/20.
//  Copyright (c) 2020 Celerstudio. All rights reserved.
//

import UIKit

final class ListDetailWireframe: BaseWireframe {

    // MARK: - Private properties -

    // MARK: - Module setup -

    init(_ challenge: ListViewItemProtocol?) {
        let moduleViewController = ListDetailViewController()
        super.init(viewController: moduleViewController)

        let interactor = ListDetailInteractor()
        let presenter = ListDetailPresenter(view: moduleViewController, interactor: interactor, wireframe: self)
        presenter.challege = challenge
        moduleViewController.presenter = presenter
    }

}

// MARK: - Extensions -

extension ListDetailWireframe: ListDetailWireframeProtocol {
}
