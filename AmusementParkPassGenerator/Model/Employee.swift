//
//  Employee.swift
//  AmusementParkPassGenerator
//
//  Created by Jun Kakeno on 9/2/18.
//  Copyright © 2018 Jun Kakeno. All rights reserved.
//

import Foundation

protocol EmployeeInfo{
    var firstName: String? {get set}
    var lastName: String? {get set}
    var streetAddress: String? {get set}
    var city: String? {get set}
    var state: String? {get set}
    var zipCode: String? {get set}
}

enum EmployeeInfoError: Error {
    case emptyField(description: String)
}

enum EmployeeType:String{
    case foodService
    case rideService
    case maintenance
    case manager
}

class Employee:Entrant,EmployeeInfo{
    //Fields to conform to EmployeeInfo protocol
    var firstName: String?
    var lastName: String?
    var streetAddress: String?
    var city: String?
    var state: String?
    var zipCode: String?
    var foodDiscount: Double?
    var merchandiceDiscount: Double?
    var type:String?
    
    //Employee initializer
    init(type: EmployeeType.RawValue,firstName: String, lastName: String, streetAddress: String, city: String, state: String, zipCode: String, accessAreas:[String],foodDiscount:Double,merchandiceDiscount:Double)throws{
        //Initialize Entrant
        super.init()
        self.type=type
        //Errors
        if firstName.isEmpty {
            throw EmployeeInfoError.emptyField(description: "\(type) employee first name field is empty")
        }else if lastName.isEmpty {
            throw EmployeeInfoError.emptyField(description: "\(type) employee last name field is empty")
        }else if streetAddress.isEmpty {
            throw EmployeeInfoError.emptyField(description: "\(type) employee street address field is empty")
        }else if city.isEmpty {
            throw EmployeeInfoError.emptyField(description: "\(type) employee city field is empty")
        }else if state.isEmpty {
            throw EmployeeInfoError.emptyField(description: "\(type) employee state field is empty")
        }else if zipCode.isEmpty {
            throw EmployeeInfoError.emptyField(description: "\(type) employee zip code field is empty")
        }
        
        
        //Initialize employee info fields
        self.firstName=firstName
        self.lastName=lastName
        self.streetAddress=streetAddress
        self.state=state
        self.city=city
        self.zipCode=zipCode
        
        //Add additional area access to Entrant base class
        for accessArea in accessAreas{
            self.areaAccess.append(accessArea)
        }
        
        self.foodDiscount=foodDiscount
        self.merchandiceDiscount=merchandiceDiscount
    }
}
