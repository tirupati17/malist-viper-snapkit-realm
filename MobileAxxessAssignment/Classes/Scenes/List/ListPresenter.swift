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
            view.reloadData()
        }
    }
    var sortBy: DataType = .text
    // MARK: - Lifecycle -

    init(view: ListViewProtocol, interactor: ListInteractorProtocol, wireframe: ListWireframeProtocol) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
    }
}

// MARK: - Extensions -
extension ListPresenter: ListPresenterProtocol {
    
    func getChallenges() {
        self.view.showProgress()
        self.interactor.fetchChallenges(bodyParams: nil, success: { challenges in
            self.view.hideProgress()
            self.view.removeNoResult()

            if challenges.count == 0 {
                self.view.showNoResult(LocalizationKey.Home.NoResultFound.localizedString())
            } else {
                self.challenges = challenges
            }
        }) { error in
            self.view.hideProgress()
            self.view.showNoResult(error.localizedDescription)
        }
    }
    
    func sortChallenges() {
        var sortedChallenges:[Challenge] = []
        if self.sortBy == .text {
            sortedChallenges = self.challenges.sorted {
                $0.dataType.index() > $1.dataType.index()
            }
            self.sortBy = .image
        } else {
            sortedChallenges = self.challenges.sorted {
                $0.dataType.index() < $1.dataType.index()
            }
            self.sortBy = .text
        }
        self.challenges = sortedChallenges
    }

}

// MARK - Table View
extension ListPresenter {
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOrItems(in section: Int) -> Int {
        return self.challenges.count
    }
    
    func item(at indexPath: IndexPath) -> ListViewItemProtocol {
        return self.challenges[indexPath.row]
    }
    
    func didSelectItem(at indexPath: IndexPath) {
        
    }
    
}
