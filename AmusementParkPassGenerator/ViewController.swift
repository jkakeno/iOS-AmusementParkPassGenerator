//
//  ViewController.swift
//  AmusementParkPassGenerator
//
//  Created by Jun Kakeno on 9/2/18.
//  Copyright © 2018 Jun Kakeno. All rights reserved.
//

import UIKit

enum AreaAccess:String{
    case amusementPark
    case kitchen
    case rideControl
    case maintenance
    case office
}

enum RideAccess:String{
    case allRides
    case skipLines
}

enum Discounts: Double{
    case tenPercent = 0.1
    case fifteenPercent = 0.15
    case twentyPercent = 0.2
    case twentyFivePercent = 0.25
}

enum AccessError: Error {
    case notAllowed(description: String)
    case noDiscount(description:String)
}

class ViewController: UIViewController {

    var classicGuest:Guest?
    var vipGuest:Guest?
    var minorGuest:Guest?
    var foodServiceEmployee: Employee?
    var rideServiceEmployee: Employee?
    var maintenanceEmployee: Employee?
    var managerEmployee: Employee?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

//////////////////////////////////////////////  OBJECTS  ////////////////////////////////////////////////////
        
        //Create a classic guest
        classicGuest=Guest(type: GuestType.classic.rawValue)
        
        //Create a vip guest
        vipGuest=Guest(type: GuestType.vip.rawValue,vipAccess: RideAccess.skipLines.rawValue,foodDiscount:Discounts.tenPercent.rawValue,merchandiceDiscount:Discounts.twentyPercent.rawValue)
        
        //Create a minor guest
        do{
            minorGuest=try Guest(type:GuestType.minor.rawValue,dateOfBirth: "2014/09/05")
        }catch FreePassError.doesNotQuality(let description){
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
//            minorGuest=try Guest(type:GuestType.minor.rawValue,dateOfBirth: "2010/09/05")
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
//            minorGuest=try Guest(type:GuestType.minor.rawValue,dateOfBirth: "")
//        }catch FreePassError.doesNotQuality(let description){
//            print(description)
//        }catch FreePassError.dateOfBirthIncorrect(let description){
//            print(description)
//        }catch FreePassError.emptyField(let description){
//            print(description)
//        }catch{
//            //some other error
//        }
        
        //Create a food service employee
        do{
            foodServiceEmployee=try Employee(type:EmployeeType.foodService.rawValue,firstName: "John", lastName: "Smith", streetAddress: "100 Main St", city: "St Luis", state: "AK", zipCode: "48328",accessAreas:[AreaAccess.kitchen.rawValue],foodDiscount:Discounts.fifteenPercent.rawValue,merchandiceDiscount:Discounts.twentyFivePercent.rawValue)
        }catch EmployeeInfoError.emptyField(let description){
            print(description)
        }catch{
            //some other error
        }
        
        //Create a food service employee (throws error)
//        do{
//            foodServiceEmployee=try Employee(type:EmployeeType.foodService.rawValue,firstName: "", lastName: "Smith", streetAddress: "100 Main St", city: "St Luis", state: "AK", zipCode: "48328",accessAreas:[AreaAccess.kitchen.rawValue],foodDiscount:Discounts.fifteenPercent.rawValue,merchandiceDiscount:Discounts.twentyFivePercent.rawValue)
//        }catch EmployeeInfoError.emptyField(let description){
//            print(description)
//        }catch{
//            //some other error
//        }
        
        //Create a ride service employee
        do{
            rideServiceEmployee=try Employee(type:EmployeeType.rideService.rawValue,firstName: "Martha", lastName: "Robertson", streetAddress: "200 K St", city: "New York", state: "NY", zipCode: "50003",accessAreas:[AreaAccess.rideControl.rawValue],foodDiscount:Discounts.fifteenPercent.rawValue,merchandiceDiscount:Discounts.twentyFivePercent.rawValue)
        }catch EmployeeInfoError.emptyField(let description){
            print(description)
        }catch{
            //some other error
        }

        //Create maintenance employee
        do{
            maintenanceEmployee=try Employee(type:EmployeeType.maintenance.rawValue,firstName: "Steve", lastName: "Paterson", streetAddress: "300 P St", city: "Los Angeles", state: "CA", zipCode: "1000",accessAreas:[AreaAccess.kitchen.rawValue,AreaAccess.rideControl.rawValue,AreaAccess.maintenance.rawValue],foodDiscount:Discounts.fifteenPercent.rawValue,merchandiceDiscount:Discounts.twentyFivePercent.rawValue)
        }catch EmployeeInfoError.emptyField(let description){
            print(description)
        }catch{
            //some other error
        }
        
        //Create a manager employee
        do{
            managerEmployee=try Employee(type:EmployeeType.manager.rawValue,firstName: "Nathan", lastName: "Parker", streetAddress: "500 M St", city: "Las Vegas", state: "NV", zipCode: "3200",accessAreas:[AreaAccess.kitchen.rawValue,AreaAccess.rideControl.rawValue,AreaAccess.maintenance.rawValue,AreaAccess.office.rawValue],foodDiscount:Discounts.twentyFivePercent.rawValue,merchandiceDiscount:Discounts.twentyFivePercent.rawValue)
        }catch EmployeeInfoError.emptyField(let description){
            print(description)
        }catch{
            //some other error
        }
        
        
        
///////////////////////////////////////////  TESTS  ///////////////////////////////////////////////////
        
        //Check classic guest area access, ride access and discounts
        do{
            if let classicGuest=classicGuest{
                checkRideAccess(of: classicGuest)
                try checkAreaAccess(of: classicGuest, to: AreaAccess.amusementPark.rawValue)

                //Error test cases
                try checkDiscounts(of: classicGuest)
//                try checkAreaAccess(of: classicGuest, to: AreaAccess.kitchen.rawValue)
//                try checkAreaAccess(of: classicGuest, to: AreaAccess.rideControl.rawValue)
//                try checkAreaAccess(of: classicGuest, to: AreaAccess.maintenance.rawValue)
//                try checkAreaAccess(of: classicGuest, to: AreaAccess.office.rawValue)
            }
        }catch AccessError.notAllowed(let description){
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
                checkRideAccess(of: vipGuest)
                try checkAreaAccess(of: vipGuest, to: AreaAccess.amusementPark.rawValue)
                try checkDiscounts(of: vipGuest)
                
                //Error test cases
                try checkAreaAccess(of: vipGuest, to: AreaAccess.kitchen.rawValue)
//                try checkAreaAccess(of: vipGuest, to: AreaAccess.rideControl.rawValue)
//                try checkAreaAccess(of: vipGuest, to: AreaAccess.maintenance.rawValue)
//                try checkAreaAccess(of: vipGuest, to: AreaAccess.office.rawValue)
            }
        }catch AccessError.notAllowed(let description){
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
                checkRideAccess(of: minorGuest)
                try checkAreaAccess(of: minorGuest, to: AreaAccess.amusementPark.rawValue)

                
                //Error test cases
                try checkDiscounts(of: minorGuest)
//                try checkAreaAccess(of: minorGuest, to: AreaAccess.kitchen.rawValue)
//                try checkAreaAccess(of: minorGuest, to: AreaAccess.rideControl.rawValue)
//                try checkAreaAccess(of: minorGuest, to: AreaAccess.maintenance.rawValue)
//                try checkAreaAccess(of: minorGuest, to: AreaAccess.office.rawValue)
            }
        }catch AccessError.notAllowed(let description){
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
                checkRideAccess(of: foodServiceEmployee)
                try checkAreaAccess(of: foodServiceEmployee, to: AreaAccess.amusementPark.rawValue)
                try checkAreaAccess(of: foodServiceEmployee, to: AreaAccess.kitchen.rawValue)
                try checkDiscounts(of: foodServiceEmployee)
                
                //Error test cases
                try checkAreaAccess(of: foodServiceEmployee, to: AreaAccess.rideControl.rawValue)
//                try checkAreaAccess(of: foodServiceEmployee, to: AreaAccess.maintenance.rawValue)
//                try checkAreaAccess(of: foodServiceEmployee, to: AreaAccess.office.rawValue)
            }
        }catch AccessError.notAllowed(let description){
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
            checkRideAccess(of: rideServiceEmployee)
            try checkAreaAccess(of: rideServiceEmployee, to: AreaAccess.amusementPark.rawValue)
            try checkAreaAccess(of: rideServiceEmployee, to: AreaAccess.rideControl.rawValue)
            try checkDiscounts(of: rideServiceEmployee)
            
            //Error test cases
            try checkAreaAccess(of: rideServiceEmployee, to: AreaAccess.kitchen.rawValue)
//            try checkAreaAccess(of: rideServiceEmployee, to: AreaAccess.maintenance.rawValue)
//            try checkAreaAccess(of: rideServiceEmployee, to: AreaAccess.office.rawValue)
        }
        }catch AccessError.notAllowed(let description){
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
            checkRideAccess(of: maintenanceEmployee)
            try checkAreaAccess(of: maintenanceEmployee, to: AreaAccess.amusementPark.rawValue)
            try checkAreaAccess(of: maintenanceEmployee, to: AreaAccess.kitchen.rawValue)
            try checkAreaAccess(of: maintenanceEmployee, to: AreaAccess.rideControl.rawValue)
            try checkAreaAccess(of: maintenanceEmployee, to: AreaAccess.maintenance.rawValue)
            try checkDiscounts(of: maintenanceEmployee)
            
            //Error test cases
            try checkAreaAccess(of: maintenanceEmployee, to: AreaAccess.office.rawValue)
        }
        }catch AccessError.notAllowed(let description){
            print(description)
        }catch AccessError.noDiscount(let description){
            print(description)
        }catch{
            //some other error
        }
        
        print("\n")

        //Check manager employee area access, ride access and discounts
        do{
        if let managerEmployee=managerEmployee{
            checkRideAccess(of: managerEmployee)
            try checkAreaAccess(of: managerEmployee, to: AreaAccess.amusementPark.rawValue)
            try checkAreaAccess(of: managerEmployee, to: AreaAccess.kitchen.rawValue)
            try checkAreaAccess(of: managerEmployee, to: AreaAccess.rideControl.rawValue)
            try checkAreaAccess(of: managerEmployee, to: AreaAccess.maintenance.rawValue)
            try checkAreaAccess(of: managerEmployee, to: AreaAccess.office.rawValue)
            try checkDiscounts(of: managerEmployee)
        }
        }catch AccessError.notAllowed(let description){
            print(description)
        }catch AccessError.noDiscount(let description){
            print(description)
        }catch{
            //some other error
        }
    }
    
    
    
///////////////////////////////////////////   HELPERS   //////////////////////////////////////////////
    
    func checkRideAccess(of entrant:Entrant){
        if entrant is Guest{
            if let guest = entrant as? Guest, let guestType=guest.type{
                for ride in entrant.rideAccess{
                    print("\(guestType) guest have access to \(ride)")
                }
            }
        }else if entrant is Employee{
            if let employee = entrant as? Employee, let employeeType = employee.type{
                for ride in entrant.rideAccess{
                    print("\(employeeType) employee have access to \(ride)")
                }
            }
        }
    }
    
    func checkAreaAccess(of entrant: Entrant, to area: AreaAccess.RawValue)throws{
        if entrant is Guest{
            //Cast entrant to guest
            if let guest = entrant as? Guest, guest.areaAccess.contains(area), let guestType = guest.type{
                print("\(guestType) guest have access to \(area)")
                //Cast entrant to employee
            }else{
                if let guest = entrant as? Guest, let guestType = guest.type{
                    throw AccessError.notAllowed(description: "\(guestType) guest is not allowed in \(area)")
                }
            }
        }else if entrant is Employee{
            if let employee = entrant as? Employee, employee.areaAccess.contains(area), let employeeType = employee.type{
                print("\(employeeType) employee have access to \(area)")
            }else{
                if let employee = entrant as? Employee, let employeeType = employee.type{
                    throw AccessError.notAllowed(description: "\(employeeType) employee is not allowed in \(area)")
                }
            }
        }
    }
    
    func checkDiscounts(of entrant:Entrant)throws{
        if entrant is Guest{
            //Cast entrant to guest
            if let guest = entrant as? Guest, let guestType=guest.type,let foodDiscount=guest.foodDiscount, let merchandiceDiscount=guest.merchandiceDiscount{
                print("\(guestType) guest food discount is \(foodDiscount*100)%")
                print("\(guestType) guest merchandice discount is \(merchandiceDiscount*100)%")
                //Cast entrant to employee
            }else{
                if let guest = entrant as? Guest, let guestType = guest.type{
                    throw AccessError.noDiscount(description: "\(guestType) guest doesn't have discounts")
                }
            }
        }else if entrant is Employee{
            if let employee = entrant as? Employee, let employeeType = employee.type,let foodDiscount=employee.foodDiscount, let merchandiceDiscount=employee.merchandiceDiscount{
                print("\(employeeType) employee food discount is \(foodDiscount*100)%")
                print("\(employeeType) employee merchandice discount is \(merchandiceDiscount*100)%")
            }else{
                if let employee = entrant as? Employee, let employeeType = employee.type{
                    throw AccessError.noDiscount(description: "\(employeeType) employee doesn't have discounts")
                }
            }
        }
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

