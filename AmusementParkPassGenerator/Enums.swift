//
//  Enums.swift
//  AmusementParkPassGenerator
//
//  Created by Jun Kakeno on 9/6/18.
//  Copyright © 2018 Jun Kakeno. All rights reserved.
//

import Foundation

enum MainType:String{
    case guest = "Guest"
    case employee = "Employee"
    case manager = "Manager"
    case contract = "Contract"
    case vendor = "Vendor"
}

enum SubType:String{
    case minor = "Minor Guest"
    case classic = "Classic Guest"
    case vip = "VIP Guest"
    case senior = "Senior Guest"
    case season = "Season Guest"
    case foodServiceEmployee = "Food Service Employee"
    case rideServiceEmployee = "Ride Service Employee"
    case maintenanceEmployee = "Maintenance Employee"
    case shiftManager = "Shift Manager"
    case generalManager = "General Manager"
    case seniorManager = "Senior Manager"
    case contract1001 = "Contract 1001"
    case contract1002 = "Contract 1002"
    case contract1003 = "Contract 1003"
    case contract2001 = "Contract 2001"
    case contract2002 = "Contract 2002"
    case acme = "Acme"
    case orkin = "Orkin"
    case fedex = "FedEx"
    case nwelectrical = "New Electrical"
}

enum GuestType:String{
    case minor = "Minor Guest"
    case classic = "Classic Guest"
    case vip = "VIP Guest"
    case senior = "Senior Guest"
    case season = "Season Guest"
    
}

enum EmployeeType:String{
    case foodServiceEmployee = "Food Service Employee"
    case rideServiceEmployee = "Ride Service Employee"
    case maintenanceEmployee = "Maintenance Employee"
    case shiftManager = "Shift Manager"
    case generalManager = "General Manager"
    case seniorManager = "Senior Manager"
    case contract1001 = "Contract 1001"
    case contract1002 = "Contract 1002"
    case contract1003 = "Contract 1003"
    case contract2001 = "Contract 2001"
    case contract2002 = "Contract 2002"
}

enum VendorType:String{
    case acme = "Acme"
    case orkin = "Orkin"
    case fedex = "FedEx"
    case nwelectrical = "New Electrical"
}

enum AreaAccess:String{
    case amusementPark = "Amusement Park"
    case kitchen = "Kitchen"
    case rideControl = "Ride Control"
    case maintenance = "Maintenance"
    case office = "Office"
}

enum RideAccess:String{
    case allRides = "All Rides"
    case skipLines = "Skip Lines"
}

enum Discounts:String{
    case ten="10%"
    case fifteen="15%"
    case twenty="20%"
    case twentyfive="25%"
}

enum Errors:Error{
    case emptyField(description: String)
}

enum FreePassError: Error{
    case doesNotQualify(description:String)
    case dateOfBirthIncorrect(description:String)
    case emptyField(description:String)
}

enum AccessError: Error{
    case accessDenied(description:String)
    case noDiscount (description:String)
}

