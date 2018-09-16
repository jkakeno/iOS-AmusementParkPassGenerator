//
//  Tests.swift
//  AmusementParkPassGenerator
//
//  Created by EG1 on 9/7/18.
//  Copyright © 2018 Jun Kakeno. All rights reserved.
//

import Foundation


class Tests{
    var classicGuest:Guest?
    var vipGuest:Guest?
    var minorGuest:Guest?
    var seasonGuest:Guest?
    var seniorGuest:Guest?
    var foodServiceEmployee: Employee?
    var rideServiceEmployee: Employee?
    var maintenanceEmployee: Employee?
    var shiftManager: Employee?
    var contract1002:Employee?
    var nwelectrical:Vendor?

    
    init(){
        //////////////////////////////////////////////  OBJECTS  ////////////////////////////////////////////////////
        
        //Create a classic guest
        do{
            classicGuest=try Guest(classic: .guest, guestType: .classic)
        }catch{
            
        }
        //Create a vip guest
        do{
            vipGuest=try Guest(vip: .guest, guestType: .vip)
        }catch{
            
        }
        //Create a minor guest
        do{
            minorGuest=try Guest(minor: .guest, guestType: .minor, dateOfBirth: "2014/01/01")
        }catch FreePassError.doesNotQualify(let description){
        print(description)
        }catch FreePassError.dateOfBirthIncorrect(let description){
        print(description)
        }catch FreePassError.emptyField(let description){
        print(description)
        }catch{
        //some other error
        }
        
        //Create a minor guest (throws error)
        //        do{
        //            minorGuest=try Guest(minor: .guest, guestType: .minor, dateOfBirth: "2010/09/05")
        //        }catch FreePassError.doesNotQuality(let description){
        //            print(description)
        //        }catch FreePassError.dateOfBirthIncorrect(let description){
        //            print(description)
        //        }catch FreePassError.emptyField(let description){
        //            print(description)
        //        }catch{
        //            //some other error
        //        }
        
        //Create a minor guest (throws error)
        //        do{
        //            minorGuest=try Guest(minor: .guest, guestType: .minor, dateOfBirth: "")
        //        }catch FreePassError.doesNotQuality(let description){
        //            print(description)
        //        }catch FreePassError.dateOfBirthIncorrect(let description){
        //            print(description)
        //        }catch FreePassError.emptyField(let description){
        //            print(description)
        //        }catch{
        //            //some other error
        //        }
        
        //Create a season guest
        do{
            seasonGuest=try Guest(season: .guest, guestType: .season, dateOfBirth: "2000/05/04", firstName: "Jim", lastName: "K", streetAddress: "123 M St", city: "Waterloo", state: "IA", zipCode: "33445")
        }catch Errors.emptyField(let description){
            print(description)
        }catch{
            
        }
        //Create a senior guest
        do{
            seniorGuest=try Guest(senior: .guest, guestType: .senior, dateOfBirth: "1960/05/07", firstName: "Tom", lastName: "Soyer")
        }catch Errors.emptyField(let description){
            print(description)
        }catch{
            
        }
        
        //Create a food service employee
        do{
            foodServiceEmployee=try Employee(.employee, employeeType: .foodServiceEmployee, dateOfBirth: "2002/06/07", ssn: "444-55-6666", firstName: "Katy", lastName: "Smith", streetAddress: "23 K Rd", city: "SmallVille", state: "AR", zipCode: "33442")
        }catch Errors.emptyField(let description){
            print(description)
        }catch{
            
        }
        
        //Create a food service employee (throws error)
        //        do{
        //            foodServiceEmployee=try Employee(.employee, employeeType: .foodServiceEmployee, dateOfBirth: "2002/06/07", ssn: "444-55-6666", firstName: "", lastName: "Smith", streetAddress: "23 K Rd", city: "SmallVille", state: "AR", zipCode: "33442")
        //        }catch Errors.emptyField(let description){
        //            print(description)
        //        }catch{
        //            //some other error
        //        }
        
        //Create a ride service employee
        do{
            rideServiceEmployee=try Employee(.employee, employeeType: .rideServiceEmployee, dateOfBirth: "1998/06/05", ssn: "333-55-44444", firstName: "Pat", lastName: "Green", streetAddress: "65 Main St", city: "Richardson", state: "TX", zipCode: "34433")
        }catch Errors.emptyField(let description){
            print(description)
        }catch{
            
        }
        
        //Create maintenance employee
        do{
            maintenanceEmployee=try Employee(.employee, employeeType: .maintenanceEmployee, dateOfBirth: "1995/10/12", ssn: "888-23-5432", firstName: "Kim", lastName: "Chen", streetAddress: "100 Brown Rd", city: "CapeTown", state: "CA", zipCode: "88833")
        }catch Errors.emptyField(let description){
            print(description)
        }catch{
            
        }
        
        //Create a manager employee
        do{
            shiftManager=try Employee(.employee, employeeType: .shiftManager, dateOfBirth:"1995/07/23", ssn:"887-12-5678", firstName: "Nathan", lastName: "Parker", streetAddress: "500 M St", city: "Las Vegas", state: "NV", zipCode: "3200")
        }catch Errors.emptyField(let description){
            print(description)
        }catch{
            
        }
        
        //Create a manager employee (throw error)
//        do{
//        managerEmployee=try Employee(.employee, employeeType: .shiftManager, dateOfBirth:"1995/07/23", ssn:"887-12-5678", firstName: "Nathan", lastName: "Parker", streetAddress: "", city: "Las Vegas", state: "NV", zipCode: "3200")
//        }catch Errors.emptyField(let description){
//        print(description)
//        }catch{
//        //some other error
//        }
        
        //Create contract employee
        do{
            contract1002=try Employee(.employee, employeeType: .contract1002,dateOfBirth: "2002/04/05",ssn:"884-33-2245",firstName: "Tim", lastName: "Wang", streetAddress: "M St", city: "Kansas", state: "KA", zipCode: "44444")
        }catch Errors.emptyField(let description){
            print(description)
        }catch{
            
        }
        
        //Create contract employee (throw error)
//        do{
//            contractEmployee=try Employee(.employee, employeeType: .contract1002,dateOfBirth: "2002/04/05",ssn:"884-33-2245",firstName: "Tim", lastName: "", streetAddress: "M St", city: "Kansas", state: "KA", zipCode: "44444")
//        }catch Errors.emptyField(let description){
//            print(description)
//        }catch{
//            //some other error
//        }
        
        //Create vendor
        do{
            nwelectrical=try Vendor(.vendor, vendorType:.nwelectrical,dateOfBirth: "2001/09/15", dateOfVisit: "2018/03/04",firstName: "Pat", lastName: "Young")
        }catch Errors.emptyField(let description){
            print(description)
        }catch{
            
        }
        
        //Create vendor (throws error)
//        do{
//            vendor=try Vendor(.vendor, vendorType:.nwelectrical,dateOfBirth: "2001/09/15", dateOfVisit: "",firstName: "Pat", lastName: "Young")
//        }catch Errors.emptyField(let description){
//            print(description)
//        }catch{
//            //some other error
//        }
        
        ///////////////////////////////////////////  TESTS  ///////////////////////////////////////////////////
        
        //Check classic guest area access, ride access and discounts
        do{
            if let classicGuest=classicGuest{
            try checkRideAccess(of: classicGuest, for:.allRides)
            try checkAreaAccess(of: classicGuest, to: .amusementPark)
            
            //Error test cases
            try checkDiscounts(of: classicGuest)
    //        try checkAreaAccess(of: classicGuest, to: .kitchen)
    //        try checkAreaAccess(of: classicGuest, to: .rideControl)
    //        try checkAreaAccess(of: classicGuest, to: .maintenance)
    //        try checkAreaAccess(of: classicGuest, to: .office)
            }
        }catch AccessError.accessDenied(let description){
        print(description)
        }catch AccessError.noDiscount(let description){
        print(description)
        }catch{
        //some other error
        }
        
        print("\n")
        
        //Check vip guest area access, ride access and discounts
        do{
            if let vipGuest=vipGuest{
            try checkRideAccess(of: vipGuest, for: .allRides)
            try checkAreaAccess(of: vipGuest, to: .amusementPark)
            try checkDiscounts(of: vipGuest)
            
            //Error test cases
            try checkAreaAccess(of: vipGuest, to: .kitchen)
    //        try checkAreaAccess(of: vipGuest, to: .rideControl)
    //        try checkAreaAccess(of: vipGuest, to: .maintenance)
    //        try checkAreaAccess(of: vipGuest, to: .office)
            }
        }catch AccessError.accessDenied(let description){
        print(description)
        }catch AccessError.noDiscount(let description){
        print(description)
        }catch{
        //some other error
        }
        
        print("\n")
        
        //Check minor guest area access, ride access and discounts
        do{
            if let minorGuest=minorGuest{
            try checkRideAccess(of: minorGuest, for:.allRides)
            try checkAreaAccess(of: minorGuest, to: .amusementPark)
            
            
            //Error test cases
            try checkDiscounts(of: minorGuest)
            //                try checkAreaAccess(of: minorGuest, to: .kitchen)
            //                try checkAreaAccess(of: minorGuest, to: .rideControl)
            //                try checkAreaAccess(of: minorGuest, to: .maintenance)
            //                try checkAreaAccess(of: minorGuest, to: .office)
            }
        }catch AccessError.accessDenied(let description){
        print(description)
        }catch AccessError.noDiscount(let description){
        print(description)
        }catch{
        //some other error
        }
        
        print("\n")
        
        //Check season guest area access, ride access and discounts
        do{
            if let seasonGuest=seasonGuest{
                try checkRideAccess(of: seasonGuest, for: .allRides)
                try checkAreaAccess(of: seasonGuest, to: .amusementPark)
                
                
                //Error test cases
                try checkDiscounts(of: seasonGuest)
                                try checkAreaAccess(of: seasonGuest, to: .kitchen)
                //                try checkAreaAccess(of: seasonGuest, to: .rideControl)
                //                try checkAreaAccess(of: seasonGuest, to: .maintenance)
                //                try checkAreaAccess(of: seasonGuest, to: .office)
            }
        }catch AccessError.accessDenied(let description){
            print(description)
        }catch AccessError.noDiscount(let description){
            print(description)
        }catch{
            //some other error
        }
        
        print("\n")
        
        //Check senior guest area access, ride access and discounts
        do{
            if let seniorGuest=seniorGuest{
                try checkRideAccess(of: seniorGuest, for: .allRides)
                try checkAreaAccess(of: seniorGuest, to: .amusementPark)
                
                
                //Error test cases
                try checkDiscounts(of: seniorGuest)
                try checkAreaAccess(of: seniorGuest, to: .kitchen)
                //                try checkAreaAccess(of: seniorGuest, to: .rideControl)
                //                try checkAreaAccess(of: seniorGuest, to: .maintenance)
                //                try checkAreaAccess(of: seniorGuest, to: .office)
            }
        }catch AccessError.accessDenied(let description){
            print(description)
        }catch AccessError.noDiscount(let description){
            print(description)
        }catch{
            //some other error
        }
        
        print("\n")
        
        //Check food service employee area access, ride access and discounts
        do{
            if let foodServiceEmployee=foodServiceEmployee{
                try checkRideAccess(of: foodServiceEmployee, for: .allRides)
                try checkAreaAccess(of: foodServiceEmployee, to: .amusementPark)
                try checkAreaAccess(of: foodServiceEmployee, to: .kitchen)
                try checkDiscounts(of: foodServiceEmployee)
                
                //Error test cases
                try checkAreaAccess(of: foodServiceEmployee, to: .rideControl)
                //                try checkAreaAccess(of: foodServiceEmployee, to: .maintenance)
                //                try checkAreaAccess(of: foodServiceEmployee, to: .office)
            }
        }catch AccessError.accessDenied(let description){
        print(description)
        }catch AccessError.noDiscount(let description){
        print(description)
        }catch{
        //some other error
        }
        
        print("\n")
        
        //Check ride service employee area access, ride access and discounts
        do{
            if let rideServiceEmployee=rideServiceEmployee{
                try checkRideAccess(of: rideServiceEmployee, for: .allRides)
                try checkAreaAccess(of: rideServiceEmployee, to: .amusementPark)
                try checkAreaAccess(of: rideServiceEmployee, to: .rideControl)
                try checkDiscounts(of: rideServiceEmployee)
                
                //Error test cases
                try checkAreaAccess(of: rideServiceEmployee, to: .kitchen)
                //            try checkAreaAccess(of: rideServiceEmployee, to: .maintenance)
                //            try checkAreaAccess(of: rideServiceEmployee, to: .office)
            }
        }catch AccessError.accessDenied(let description){
        print(description)
        }catch AccessError.noDiscount(let description){
        print(description)
        }catch{
        //some other error
        }
        
        print("\n")
        
        //Check maintenance employee area access, ride access and discounts
        do{
            if let maintenanceEmployee=maintenanceEmployee{
                try checkRideAccess(of: maintenanceEmployee, for: .allRides)
                try checkAreaAccess(of: maintenanceEmployee, to: .amusementPark)
                try checkAreaAccess(of: maintenanceEmployee, to: .kitchen)
                try checkAreaAccess(of: maintenanceEmployee, to: .rideControl)
                try checkAreaAccess(of: maintenanceEmployee, to: .maintenance)
                try checkDiscounts(of: maintenanceEmployee)
                
                //Error test cases
                try checkAreaAccess(of: maintenanceEmployee, to: .office)
            }
        }catch AccessError.accessDenied(let description){
        print(description)
        }catch AccessError.noDiscount(let description){
        print(description)
        }catch{
        //some other error
        }
        
        print("\n")
        
        //Check manager employee area access, ride access and discounts
        do{
            if let shiftManager=shiftManager{
                try checkRideAccess(of: shiftManager, for: .allRides)
                try checkAreaAccess(of: shiftManager, to: .amusementPark)
                try checkAreaAccess(of: shiftManager, to: .kitchen)
                try checkAreaAccess(of: shiftManager, to: .rideControl)
                try checkAreaAccess(of: shiftManager, to: .maintenance)
                try checkAreaAccess(of: shiftManager, to: .office)
                try checkDiscounts(of: shiftManager)
            }
        }catch AccessError.accessDenied(let description){
        print(description)
        }catch AccessError.noDiscount(let description){
        print(description)
        }catch{
        //some other error
        }
        
        print("\n")
        
        //Check contract employee area access, ride access and discounts
        do{
            if let contract1002=contract1002{

                try checkAreaAccess(of: contract1002, to: .amusementPark)
                try checkAreaAccess(of: contract1002, to: .rideControl)
                
                //Error test cases
                try checkRideAccess(of: contract1002, for: .allRides)
//                try checkAreaAccess(of: contract1002, to: .kitchen)
//                try checkAreaAccess(of: contract1002, to: .maintenance)
//                try checkAreaAccess(of: contract1002, to: .office)
                try checkDiscounts(of: contract1002)
            }
        }catch AccessError.accessDenied(let description){
            print(description)
        }catch AccessError.noDiscount(let description){
            print(description)
        }catch{
            //some other error
        }
        
        print("\n")
        
        //Check vendor area access, ride access and discounts
        do{
            if let nwelectrical=nwelectrical{

                try checkAreaAccess(of: nwelectrical, to: .kitchen)
                
                //Error test cases
                try checkRideAccess(of: nwelectrical, for: .allRides)
//                try checkAreaAccess(of: nwelectrical, to: .amusementPark)
//                try checkAreaAccess(of: nwelectrical, to: .rideControl)
//                try checkAreaAccess(of: nwelectrical, to: .maintenance)
//                try checkAreaAccess(of: nwelectrical, to: .office)
//                try checkDiscounts(of: nwelectrical)
            }
        }catch AccessError.accessDenied(let description){
            print(description)
        }catch AccessError.noDiscount(let description){
            print(description)
        }catch{
            //some other error
        }
    }
}

///////////////////////////////////////////   HELPERS   //////////////////////////////////////////////

func checkRideAccess(of entrant:Entrant, for ride:RideAccess)throws{
    if entrant is Guest{
        if let guest = entrant as? Guest, let guestType=guest.guestType?.rawValue{
            if guest.rideAccess.contains(ride){
                print("\(guestType) has access to \(ride)")
            }else{
                throw AccessError.accessDenied(description:"\(guestType) doesn't have access to \(ride)")
            }
        }
    }else if entrant is Employee{
        if let employee = entrant as? Employee, let employeeType=employee.employeeType?.rawValue{
            if employee.rideAccess.contains(ride){
                print("\(employeeType) has access to \(ride)")
            }else{
                throw AccessError.accessDenied(description:"\(employeeType) doesn't have access to \(ride)")
            }
        }
    }else if entrant is Vendor{
        if let vendor = entrant as? Vendor, let vendorType=vendor.vendorType?.rawValue{
            if vendor.rideAccess.contains(ride){
                print("\(vendorType) has access to \(ride)")
            }else{
                throw AccessError.accessDenied(description:"\(vendorType) doesn't have access to \(ride)")
            }
        }
    }
}

func checkAreaAccess(of entrant: Entrant, to area: AreaAccess)throws{
    if entrant is Guest{
        if let guest = entrant as? Guest, let guestType=guest.guestType?.rawValue{
            if guest.areaAccess.contains(area){
                print("\(guestType) has access to \(area)")
            }else{
                throw AccessError.accessDenied(description:"\(guestType) doesn't have access to \(area)")
            }
        }
    }else if entrant is Employee{
        if let employee = entrant as? Employee, let employeeType=employee.employeeType?.rawValue{
            if employee.areaAccess.contains(area){
                print("\(employeeType) has access to \(area)")
            }else{
                throw AccessError.accessDenied(description:"\(employeeType) doesn't have access to \(area)")
            }
        }
    }else if entrant is Vendor{
        if let vendor = entrant as? Vendor, let vendorType=vendor.vendorType?.rawValue{
            if vendor.areaAccess.contains(area){
                print("\(vendorType) has access to \(area)")
            }else{
                throw AccessError.accessDenied(description:"\(vendorType) doesn't have access to \(area)")
            }
        }
    }
}


func checkDiscounts(of entrant:Entrant)throws{
    if entrant is Guest{
        if let guest = entrant as? Guest, let guestType=guest.guestType?.rawValue{
            if let discount=guest.foodDiscount?.rawValue{
                print("\(guestType) has \(discount) discount for food")
            }else{
                throw AccessError.noDiscount(description: "\(guestType) doesn't have discount for food")
            }
            if let discount=guest.merchandiceDiscount?.rawValue{
                print("\(guestType) has \(discount) discount for food")
            }else{
                throw AccessError.noDiscount(description: "\(guestType) doesn't have discount for merchandice")
            }
        }
    }else if entrant is Employee{
        if let employee = entrant as? Employee, let employeeType=employee.employeeType?.rawValue{
            if let discount=employee.foodDiscount?.rawValue{
                print("\(employeeType) has \(discount) discount for food")
            }else{
                throw AccessError.noDiscount(description: "\(employeeType) doesn't have discount for food")
            }
            if let discount=employee.merchandiceDiscount?.rawValue{
                print("\(employeeType) has \(discount) discount for food")
            }else{
                throw AccessError.noDiscount(description: "\(employeeType) doesn't have discount for merchandice")
            }
        }
    }else if entrant is Vendor{
        if let vendor = entrant as? Vendor, let vendorType=vendor.vendorType?.rawValue{
            if let discount=vendor.foodDiscount?.rawValue{
                print("\(vendorType) has \(discount) discount for food")
            }else{
                throw AccessError.noDiscount(description: "\(vendorType) doesn't have discount for food")
            }
            if let discount=vendor.merchandiceDiscount?.rawValue{
                print("\(vendorType) has \(discount) discount for food")
            }else{
                throw AccessError.noDiscount(description: "\(vendorType) doesn't have discount for merchandice")
            }
        }
    }
}


