//
//  ListProtocols.swift
//  MobileAxxessAssignment
//
//  Created by Tirupati Balan on 10/07/20.
//  Copyright (c) 2020 Celerstudio. All rights reserved.
//

import UIKit

enum DataType {
    case kImage
    case kText
}

protocol ListWireframeProtocol: WireframeProtocol {
}

protocol ListViewProtocol: ViewProtocol {
}

protocol ListPresenterProtocol: PresenterProtocol {
}

protocol ListInteractorProtocol: InteractorProtocol {
}

protocol ListViewItemProtocol {
    var id: String { get }
    var type: DataType { get }
    var dateString: String { get }
    var data: String { get }
}
