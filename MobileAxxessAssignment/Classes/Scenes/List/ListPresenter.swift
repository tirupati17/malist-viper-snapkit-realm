//
//  ListPresenter.swift
//  MobileAxxessAssignment
//
//  Created by Tirupati Balan on 10/07/20.
//  Copyright (c) 2020 Celerstudio. All rights reserved.
//


import Foundation

final class ListPresenter {

    // MARK: - Private properties -

    private unowned let view: ListViewProtocol
    private let interactor: ListInteractorProtocol
    private let wireframe: ListWireframeProtocol

    var challenges: [Challenge] = [] {
        didSet {
            
        }
    }
    
    // MARK: - Lifecycle -

    init(view: ListViewProtocol, interactor: ListInteractorProtocol, wireframe: ListWireframeProtocol) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
    }
}

// MARK: - Extensions -

extension ListPresenter: ListPresenterProtocol {
}
