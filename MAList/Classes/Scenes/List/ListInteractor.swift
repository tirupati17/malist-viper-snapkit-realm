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
    
    func fetchChallenges(bodyParams params: [String : Any]?, success: @escaping (([Challenge]) -> Void), failure: @escaping ((CustomError) -> Void)) {
        
        AF.request("https://raw.githubusercontent.com/AxxessTech/Mobile-Projects/master/challenge.json", method: .get,  parameters: params, encoding: JSONEncoding.default)
            .responseJSON { response in
                switch response.result {
                    case .success(_):
                        do {
                            if let challenges = try response.data?.toModel([Challenge].self) {
                                success(self.saveChallenges(challenges))
                            } else {
                                failure(CustomError.invalidArray(model: "Challenge"))
                            }
                        } catch let error {
                            failure(CustomError.customError(message: error.localizedDescription))
                        }
                    case .failure(let error):
                        failure(CustomError.customError(message: error.localizedDescription))
               }
        }
    }
}

extension ListInteractor {
    
    func saveChallenges(_ challenges: [Challenge]) -> [Challenge] {
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
            
            return try Realm().objects(Challenge.self).map { $0 }
        } catch let error {
            Logger.log(error)
        }
        return []
    }
    
}
