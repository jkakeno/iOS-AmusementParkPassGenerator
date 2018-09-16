//
//  Employee.swift
//  AmusementParkPassGenerator
//
//  Created by Jun Kakeno on 9/2/18.
//  Copyright © 2018 Jun Kakeno. All rights reserved.
//

import Foundation

class Employee:Entrant{
    override init() {
        super.init()
    }
    
    convenience init(_ mainType:MainType?, employeeType:EmployeeType?,dateOfBirth:String,ssn:String,firstName: String, lastName: String,streetAddress:String,city:String,state:String,zipCode:String)throws {
        self.init()
        
        //Format the string to date
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        let birthDate = formatter.date(from: dateOfBirth)
        
        guard let mainType=mainType else {
            throw Errors.emptyField(description: "Select a category from main menu")
        }
        guard let employeeType=employeeType else {
            throw Errors.emptyField(description: "Select a category from the employee sub menu")
        }
        
        if dateOfBirth.isEmpty {
            throw Errors.emptyField(description:"Date of birth field is empty")
        }else{
            self.dateOfBirth=birthDate
        }
        if ssn.isEmpty{
            throw Errors.emptyField(description: "Social security number field is empty")
        }else{
            self.ssn=ssn
        }
        if firstName.isEmpty {
            throw Errors.emptyField(description: "First name field is empty")
        }else{
            self.firstName=firstName
        }
        if lastName.isEmpty {
            throw Errors.emptyField(description: "Last name field is empty")
        }else{
            self.lastName=lastName
        }
        if streetAddress.isEmpty {
            throw Errors.emptyField(description: "Street address field is empty")
        }else{
            self.streetAddress=streetAddress
        }
        if city.isEmpty {
            throw Errors.emptyField(description: "City field is empty")
        }else{
            self.city=city
        }
        if state.isEmpty {
            throw Errors.emptyField(description: "State field is empty")
        }else{
            self.state=state
        }
        if zipCode.isEmpty {
            throw Errors.emptyField(description: "Zip code field is empty")
        }else{
            self.zipCode=zipCode
        }
        
        self.mainType=mainType
        self.employeeType=employeeType
        switch employeeType {
        case .foodServiceEmployee:
            self.areaAccess=[.amusementPark,.kitchen]
            self.rideAccess=[.allRides]
            self.foodDiscount = .fifteen
            self.merchandiceDiscount = .twentyfive
        case .rideServiceEmployee:
            self.areaAccess=[.amusementPark,.rideControl]
            self.rideAccess=[.allRides]
            self.foodDiscount = .fifteen
            self.merchandiceDiscount = .twentyfive
        case .maintenanceEmployee:
            self.areaAccess=[.amusementPark,.kitchen,.rideControl,.maintenance]
            self.rideAccess=[.allRides]
            self.foodDiscount = .fifteen
            self.merchandiceDiscount = .twentyfive
        case .shiftManager,.generalManager,.seniorManager:
            self.areaAccess=[.amusementPark,.kitchen,.rideControl,.maintenance,.office]
            self.rideAccess=[.allRides]
            self.foodDiscount = .twentyfive
            self.merchandiceDiscount = .twentyfive
        case .contract1001:
            self.areaAccess=[.amusementPark,.kitchen]
            self.rideAccess=[]
        case .contract1002:
            self.areaAccess=[.amusementPark,.rideControl,.maintenance]
            self.rideAccess=[]
        case .contract1003:
            self.areaAccess=[.amusementPark,.kitchen,.maintenance,.rideControl,.office]
            self.rideAccess=[]
        case .contract2001:
            self.areaAccess=[.office]
            self.rideAccess=[]
        case .contract2002:
            self.areaAccess=[.kitchen,.maintenance]
            self.rideAccess=[]
        }
        
    }
}
