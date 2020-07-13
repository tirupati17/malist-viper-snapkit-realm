//
//  ListDetailProtocols.swift
//  MAList
//
//  Created by Tirupati Balan on 12/07/20.
//  Copyright (c) 2020 Celerstudio. All rights reserved.
//

import UIKit

protocol ListDetailWireframeProtocol: WireframeProtocol {
}

protocol ListDetailViewProtocol: ViewProtocol {
    func updateView(_ challenge: ListViewItemProtocol?)
}

protocol ListDetailPresenterProtocol: PresenterProtocol {
}

protocol ListDetailInteractorProtocol: InteractorProtocol {
}
