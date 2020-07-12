//
//  ListDetailPresenter.swift
//  MobileAxxessAssignment
//
//  Created by Tirupati Balan on 12/07/20.
//  Copyright (c) 2020 Celerstudio. All rights reserved.
//


import Foundation

final class ListDetailPresenter {

    // MARK: - Private properties -

    private unowned let view: ListDetailViewProtocol
    private let interactor: ListDetailInteractorProtocol
    private let wireframe: ListDetailWireframeProtocol

    // MARK: - Public properties -
    var challege: ListViewItemProtocol? {
        didSet {
            self.view.updateView(challege)
        }
    }
    // MARK: - Lifecycle -

    init(view: ListDetailViewProtocol, interactor: ListDetailInteractorProtocol, wireframe: ListDetailWireframeProtocol) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
    }
}

// MARK: - Extensions -

extension ListDetailPresenter: ListDetailPresenterProtocol {
}
