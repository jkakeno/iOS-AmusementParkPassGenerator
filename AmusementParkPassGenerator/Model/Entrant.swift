//
//  Entrant.swift
//  AmusementParkPassGenerator
//
//  Created by Jun Kakeno on 9/2/18.
//  Copyright © 2018 Jun Kakeno. All rights reserved.
//

import Foundation


protocol PersonalInfo{
    var firstName: String? {get set}
    var lastName: String? {get set}
    var streetAddress: String? {get set}
    var city: String? {get set}
    var state: String? {get set}
    var zipCode: String? {get set}
    var ssn: String? {get set}
    var dateOfBirth: Date? {get set}
}

class Entrant:PersonalInfo{
    
    //Fields to conform to EmployeeInfo protocol
    var firstName: String?
    var lastName: String?
    var streetAddress: String?
    var city: String?
    var state: String?
    var zipCode: String?
    var ssn: String?
    var dateOfBirth: Date?
    
    //Entrant type fields
    var mainType:MainType?
    var guestType:GuestType?
    var employeeType:EmployeeType?
    var vendorType:VendorType?
    
    //Access fields
    var rideAccess: [RideAccess] = []
    var areaAccess: [AreaAccess] = []
    var foodDiscount: Discounts?
    var merchandiceDiscount: Discounts?
    var freePass:Bool=false
    
    //Vendor field
    var dateOfVisit: Date?
    
    init(){
    }
}
