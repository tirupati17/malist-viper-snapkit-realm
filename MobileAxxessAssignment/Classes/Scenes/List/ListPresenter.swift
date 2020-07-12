//
//  ListPresenter.swift
//  MobileAxxessAssignment
//
//  Created by Tirupati Balan on 10/07/20.
//  Copyright (c) 2020 Celerstudio. All rights reserved.
//

import Foundation
import RealmSwift

final class ListPresenter {

    // MARK: - Private properties -

    private unowned let view: ListViewProtocol
    private let interactor: ListInteractorProtocol
    private let wireframe: ListWireframeProtocol

    var sortBy: DataType = .text
    var challenges: [Challenge] = [] {
        didSet {
            self.view.reloadData()
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
    
    func getChallenges() {
        self.interactor.fetchChallenges(bodyParams: nil, success: { challenges in
            self.view.hideProgress()
            self.view.removeNoResult()

            if challenges.count == 0 {
                self.view.showNoResult(LocalizationKey.Home.NoResultFound.localizedString())
            } else {
                self.saveChallenges(challenges)
            }
        }) { error in
            //Try to reload from offline database
            self.view.reloadData()
            
            self.view.hideProgress()
            self.view.showNoResult(error.localizedDescription)
        }
    }
    
    func sortChallenges() {
        var sortedChallenges:[Challenge] = []
        
        if self.sortBy == .text {
            sortedChallenges = challenges.sorted {
                $0.dataType.index() > $1.dataType.index()
            }
            self.sortBy = .image
        } else {
            sortedChallenges = challenges.sorted {
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
    
    func item(at indexPath: IndexPath) -> ListViewItemProtocol? {
        return self.challenges[indexPath.row]
    }
    
    func didSelectItem(at indexPath: IndexPath) {
        self.wireframe.showDetail(self.challenges[indexPath.row])
    }
    
}

extension ListPresenter {
    
    func saveChallenges(_ challenges: [Challenge]) {
        do {
            let realm = try Realm()
            for challengeObject in challenges {
                let savedChallengeData = try Realm().objects(Challenge.self).filter { $0.id == challengeObject.id }.first
                
                //If not available in realm database so add it
                if savedChallengeData == nil {
                    let challenge = Challenge()
                    challenge.id = challengeObject.id
                    challenge.type = challengeObject.type
                    challenge.date = challengeObject.date
                    challenge.data = challengeObject.data
                    try realm.write {
                        realm.add(challenge)
                    }
                }
            }
            self.challenges = try Realm().objects(Challenge.self).map { $0 }
        } catch let error {
            Logger.log(error)
        }
    }
}
