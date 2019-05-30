//
//  Gig.swift
//  Gigs2
//
//  Created by morse on 5/30/19.
//  Copyright © 2019 morse. All rights reserved.
//

import Foundation

struct Gig: Codable {
    let title: String
    let description: String
    let dueDate: Date // ISO 8601
}
