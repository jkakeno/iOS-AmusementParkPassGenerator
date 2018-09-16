//
//  Pass.swift
//  AmusementParkPassGenerator
//
//  Created by EG1 on 9/11/18.
//  Copyright © 2018 Jun Kakeno. All rights reserved.
//

import Foundation

class Pass{
    var vendor:Vendor?
    var employee:Employee?
    var guest:Guest?
    
    init(vendor:Vendor?,employee:Employee?,guest:Guest?){
        self.vendor=vendor
        self.employee=employee
        self.guest=guest
    }
    
    func checkAreaAccess(to area:AreaAccess) throws->String{
        var accessMsg=""
        if let vendor=vendor, let company=vendor.vendorType?.rawValue {
            if vendor.areaAccess.contains(area){
                print("\(company) has access to \(area)")
                accessMsg = "\(company) has access to \(area.rawValue)"
            }else{
                throw AccessError.accessDenied(description: "\(company) doesn't have access to \(area.rawValue)")
            }
        }
        if let employee=employee, let employeeType=employee.employeeType?.rawValue{
            if employee.areaAccess.contains(area){
                print("\(employeeType) has access to \(area)")
                accessMsg = "\(employeeType) has access to \(area.rawValue)"
            }else{
                throw AccessError.accessDenied(description: "\(employeeType) doesn't have access to \(area.rawValue)")
            }
        }
        if let guest=guest, let guestType=guest.guestType?.rawValue{
            if guest.areaAccess.contains(area){
                print("\(guestType) has access to \(area)")
                accessMsg = "\(guestType) has access to \(area.rawValue)"
            }else{
                throw AccessError.accessDenied(description: "\(guestType) doesn't have access to \(area.rawValue)")
            }
        }
        return accessMsg
    }
    
    func checkRideAccess(to ride:RideAccess) throws->String{
        var accessMsg=""
        if let vendor=vendor, let company=vendor.vendorType?.rawValue {
            if vendor.rideAccess.contains(ride){
                print("\(company) has access to \(ride)")
                accessMsg="\(company) has access to \(ride.rawValue)"
            }else{
                throw AccessError.accessDenied(description: "\(company) doesn't have access to \(ride.rawValue)")
            }
        }
        if let employee=employee, let employeeType=employee.employeeType?.rawValue{
            if employee.rideAccess.contains(ride){
                print("\(employeeType) has access to \(ride)")
                accessMsg="\(employeeType) has access to \(ride.rawValue)"
            }else{
                throw AccessError.accessDenied(description: "\(employeeType) doesn't have access to \(ride.rawValue)")
            }
        }
        if let guest=guest, let guestType=guest.guestType?.rawValue{
            if guest.rideAccess.contains(ride){
                print("\(guestType) has access to \(ride)")
                accessMsg="\(guestType) has access to \(ride.rawValue)"
            }else{
                throw AccessError.accessDenied(description: "\(guestType) doesn't have access to \(ride.rawValue)")
            }
        }
        return accessMsg
    }
    
    func checkFoodDiscount() throws->String{
        var discountMsg=""
        if let guest=guest, let guestType=guest.guestType?.rawValue{
            if let discount=guest.foodDiscount?.rawValue{
                print("\(guestType) has \(discount) discount for food")
                discountMsg="\(guestType) has \(discount) discount for food"
            }else{
                throw AccessError.noDiscount(description: "\(guestType) doesn't have discount for food")
            }
        }
        if let employee=employee, let employeeType=employee.employeeType?.rawValue{
            if let discount=employee.foodDiscount?.rawValue{
                print("\(employeeType) has \(discount) discount for food")
                discountMsg="\(employeeType) has \(discount) discount for food"
            }else{
                throw AccessError.noDiscount(description: "\(employeeType) doesn't have discount for food")
            }
        }
        if let vendor=vendor, let vendorType=vendor.vendorType?.rawValue{
            if let discount=vendor.foodDiscount?.rawValue{
                print("\(vendorType) has \(discount) discount for food")
                discountMsg="\(vendorType) has \(discount) discount for food"
            }else{
                throw AccessError.noDiscount(description: "\(vendorType) doesn't have discount for food")
            }
        }
        return discountMsg
    }
    
    func checkMerchandiceDiscount() throws->String{
        var discountMsg=""
        if let guest=guest, let guestType=guest.guestType?.rawValue{
            if let discount=guest.merchandiceDiscount?.rawValue{
                print("\(guestType) has \(discount) discount for merchandice")
                discountMsg="\(guestType) has \(discount) discount for merchandice"
            }else{
                throw AccessError.noDiscount(description: "\(guestType) doesn't have discount for merchandice")
            }
        }
        if let employee=employee, let employeeType=employee.employeeType?.rawValue{
            if let discount=employee.merchandiceDiscount?.rawValue{
                print("\(employeeType) has \(discount) discount for merchandice")
                discountMsg="\(employeeType) has \(discount) discount for merchandice"
            }else{
                throw AccessError.noDiscount(description: "\(employeeType) doesn't have discount for merchandice")
            }
        }
        if let vendor=vendor, let vendorType=vendor.vendorType?.rawValue{
            if let discount=vendor.merchandiceDiscount?.rawValue{
                print("\(vendorType) has \(discount) discount for merchandice")
                discountMsg="\(vendorType) has \(discount) discount for merchandice"
            }else{
                throw AccessError.noDiscount(description: "\(vendorType) doesn't have discount for merchandice")
            }
        }
        return discountMsg
    }
}
