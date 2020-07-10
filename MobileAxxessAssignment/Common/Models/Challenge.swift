//
//  Challenge.swift
//  MobileAxxessAssignment
//
//  Created by Tirupati Balan on 10/07/20.
//  Copyright © 2020 Celerstudio. All rights reserved.
//

import Foundation

// MARK: - Carfit
struct Challenge: Codable {
    let id: String?
    let type: String?
    let date: String?
    let data: String?

    enum CodingKeys: String, CodingKey {
        case id, type, date, data
    }
}
