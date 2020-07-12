//
//  ListInteractor.swift
//  MobileAxxessAssignment
//
//  Created by Tirupati Balan on 10/07/20.
//  Copyright (c) 2020 Celerstudio. All rights reserved.
//

import Foundation
import Alamofire

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
                                success(challenges)
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
