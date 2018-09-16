//
//  Vendor.swift
//  AmusementParkPassGenerator
//
//  Created by EG1 on 9/7/18.
//  Copyright © 2018 Jun Kakeno. All rights reserved.
//

import Foundation


class Vendor:Entrant{
    
    override init() {
        super.init()
    }
    
    convenience init(_ mainType:MainType?,vendorType:VendorType?,dateOfBirth:String,dateOfVisit:String,firstName: String, lastName: String)throws {
        self.init()
        
        //Format the string to date
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        let birthDate = formatter.date(from: dateOfBirth)
        let visitDate = formatter.date(from: dateOfVisit)
        
        guard let mainType=mainType else {
            throw Errors.emptyField(description: "Select a category from the employee main menu")
        }
        guard let vendorType=vendorType else {
            throw Errors.emptyField(description: "Select a category from the employee sub menu")
        }
        
        if dateOfBirth.isEmpty {
            throw Errors.emptyField(description:"Date of birth field is empty")
        }else{
            self.dateOfBirth=birthDate
        }
        if dateOfVisit.isEmpty {
            throw Errors.emptyField(description:"Date of visit field is empty")
        }else{
            self.dateOfVisit=visitDate
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
        
        self.mainType=mainType
        self.vendorType=vendorType
        switch vendorType {
        case .acme:
            self.areaAccess=[.kitchen]
        case .orkin:
            self.areaAccess=[.amusementPark,.rideControl,.kitchen]
        case .fedex:
            self.areaAccess=[.maintenance,.office]
        case .nwelectrical:
            self.areaAccess=[.amusementPark,.kitchen,.rideControl,.maintenance,.office]
        }
    }
}
