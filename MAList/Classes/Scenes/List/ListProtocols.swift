//
//  ListProtocols.swift
//  MAList
//
//  Created by Tirupati Balan on 10/07/20.
//  Copyright (c) 2020 Celerstudio. All rights reserved.
//

import UIKit

enum DataType: String {
    case image
    case text
    
    func index() -> Int {
        switch self {
        case .image:
            return 0
        default:
            return 1
        }
    }

}

protocol ListWireframeProtocol: WireframeProtocol {
    func showDetail(_ challenge: ListViewItemProtocol?)
}

protocol ListViewProtocol: ViewProtocol {
    func reloadData()
    func showNoResult(_ localizedDescription: String)
    func removeNoResult()
}

extension ListViewProtocol { //To make it optional
    func showNoResult(_ localizedDescription: String) {}
    func removeNoResult() {}
}

protocol ListPresenterProtocol: PresenterProtocol {
    func getChallenges()
    func sortChallenges()
    
    // MARK - Table View
    func numberOfSections() -> Int
    func numberOrItems(in section: Int) -> Int
    func item(at indexPath: IndexPath) -> ListViewItemProtocol?
    func didSelectItem(at indexPath: IndexPath)
}

protocol ListInteractorProtocol: InteractorProtocol {
    func fetchChallenges(bodyParams params: [String: Any]?, success: @escaping (([Challenge]) -> Void), failure: @escaping ((CustomError) -> Void))
}

protocol ListViewItemProtocol {
    var idString: String { get }
    var dataType: DataType { get }
    var dateString: String { get }
    var dataString: String { get }
}
