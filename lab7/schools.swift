//
//  schools.swift
//  lab7
//
//  Created by Max Moede on 2/24/18.
//  Copyright © 2018 Max Moede. All rights reserved.
//

import Foundation

struct schools : Codable {
    var listOfSchools : [eachSchool]
    
    private enum CodingKeys: String, CodingKey {
        case listOfSchools = "schools"
    }
    
    struct eachSchool : Codable {
        var name : String
        var city : String?
        var state : String?
        var zip : String?
        var contact_email : String?
        var latitude : Double?
        var longitude : Double?
        
        private enum CodingKeys: String, CodingKey {
            case name
            case city
            case state
            case zip
            case contact_email
            case latitude
            case longitude
        }
        
    }
}

/*Drill down of JSON structure:
schools array -> type is a dictionary ->
    money_needed : Number
    city : String
    name : String
    number_of_students : Null
    source : String
    updated_at : String
    state : String
    format : String
    description : String
    street : String
    gender : String
    website : String
    levels array -> type is String
    contact_number : String
    languages array -> type is String
    latitude : Number
    published : Number
    zip : String
    contact_email : String
    online_only : Number
    longitude : Number
    format_description : String
    contact_name : String
    country : String
license : String
description : String
generated : String*/
