//
//  ListInteractor.swift
//  MAList
//
//  Created by Tirupati Balan on 10/07/20.
//  Copyright (c) 2020 Celerstudio. All rights reserved.
//

import Foundation
import Alamofire
import RealmSwift

final class ListInteractor {
}

// MARK: - Extensions -

extension ListInteractor: ListInteractorProtocol {
    
    func fetchChallenges(bodyParams params: [String: Any]?, result: @escaping (([Challenge]) -> Void)) {
        AF.request("https://raw.githubusercontent.com/AxxessTech/Mobile-Projects/master/challenge.json",
                   method: .get,
                   parameters: params,
                   encoding: JSONEncoding.default)
            .responseJSON { response in
                switch response.result {
                case .success(_):
                    do {
                        result(self.saveChallenges(try response.data?.toModel([Challenge].self)))
                    } catch let error {
                        Logger.log(error.localizedDescription)
                        result(self.saveChallenges(nil))
                    }
                case .failure(let error):
                    Logger.log(error.localizedDescription)
                    result(self.saveChallenges(nil))
                }
            }
    }
    
}

extension ListInteractor {
    
    func saveChallenges(_ challenges: [Challenge]?) -> [Challenge] {
        do {
            let realm = try Realm()
            if let challenges = challenges { //Return saved data
                for challengeObject in challenges {
                    //If not available in realm database so add it
                    if realm.objects(Challenge.self).filter({ $0.id == challengeObject.id }).count == 0 {
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
            }
            return try Array(Realm().objects(Challenge.self))
        } catch let error {
            Logger.log(error)
        }
        return []
    }
    
}
