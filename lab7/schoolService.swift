//
//  schoolService.swift
//  lab7
//
//  Created by Max Moede on 2/24/18.
//  Copyright © 2018 Max Moede. All rights reserved.
//

import Foundation

struct schoolService : Codable {
    let school : aSchool
    
    struct aSchool: Codable {
        let schoolData : schools
    }
}
