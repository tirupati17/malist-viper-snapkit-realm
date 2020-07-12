//
//  ListWireframe.swift
//  MobileAxxessAssignment
//
//  Created by Tirupati Balan on 10/07/20.
//  Copyright (c) 2020 Celerstudio. All rights reserved.
//

import UIKit

final class ListWireframe: BaseWireframe {

    // MARK: - Private properties -

    // MARK: - Module setup -

    init() {
        let moduleViewController = ListViewController()
        super.init(viewController: moduleViewController)

        let interactor = ListInteractor()
        let presenter = ListPresenter(view: moduleViewController, interactor: interactor, wireframe: self)
        moduleViewController.presenter = presenter
    }

}

// MARK: - Extensions -

extension ListWireframe: ListWireframeProtocol {
    
    func showDetail(_ challenge: ListViewItemProtocol?) {
        self.navigationController?.pushWireframe(ListDetailWireframe(challenge))
    }
    
}
