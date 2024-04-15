//
//  Employee.swift
//  AssignmentTwo
//
//  Created by RNLD on 2024-04-10.
//

import Foundation

struct EmployeeResponse: Codable {
    
    let employees   : [ Employee ]
}

struct Employee : Codable, Identifiable {

    let uuid, fullName, phoneNumber, emailAddress   : String
    let biography   : String
    let photoURLSmall, photoURLLarge    : String
    let team    : String
    let employeeType    : EmployeeType

    enum CodingKeys : String, CodingKey {
        
        case uuid
        case fullName       = "full_name"
        case phoneNumber    = "phone_number"
        case emailAddress   = "email_address"
        case biography
        case photoURLSmall  = "photo_url_small"
        case photoURLLarge  = "photo_url_large"
        case team
        case employeeType   = "employee_type"
        
    }
    
    var id  : String { uuid }
    
}

enum EmployeeType: String, Codable {
    
    case contractor = "CONTRACTOR"
    case fullTime   = "FULL_TIME"
    case partTime   = "PART_TIME"
    
}
