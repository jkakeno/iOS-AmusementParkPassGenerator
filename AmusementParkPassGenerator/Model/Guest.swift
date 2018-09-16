//
//  Guest.swift
//  AmusementParkPassGenerator
//
//  Created by Jun Kakeno on 9/2/18.
//  Copyright © 2018 Jun Kakeno. All rights reserved.
//

import Foundation


class Guest:Entrant{
    override init() {
        super.init()
    }
    
    //Classic
    convenience init(classic mainType:MainType?,guestType:GuestType?)throws{
        self.init()
        guard let mainType=mainType else {
            throw Errors.emptyField(description: "Select a category from main menu")
        }
        guard let guestType=guestType else {
            throw Errors.emptyField(description: "Select a category from the employee sub menu")
        }
        self.mainType=mainType
        self.guestType=guestType
        self.areaAccess=[.amusementPark]
        self.rideAccess=[.allRides]
    }
    
    //Vip
    convenience init(vip mainType:MainType?,guestType:GuestType?) throws{
        self.init()
        guard let mainType=mainType else {
            throw Errors.emptyField(description: "Select a category from main menu")
        }
        guard let guestType=guestType else {
            throw Errors.emptyField(description: "Select a category from the employee sub menu")
        }
        self.mainType=mainType
        self.guestType=guestType
        self.areaAccess=[.amusementPark]
        self.rideAccess=[.allRides,.skipLines]
        self.foodDiscount = .ten
        self.merchandiceDiscount = .twenty
    }
    
    //Minor
    convenience init(minor mainType:MainType?,guestType:GuestType?,dateOfBirth:String)throws {
        self.init()
        guard let mainType=mainType else {
            throw Errors.emptyField(description: "Select a category from main menu")
        }
        guard let guestType=guestType else {
            throw Errors.emptyField(description: "Select a category from the employee sub menu")
        }
        //Format the string to date
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        let birthDate = formatter.date(from: dateOfBirth)
        //Get the current date
        let currentDate = Date()
        
        //Get the year difference between the dateOfBirth and the currentDate
        if let birthDate=birthDate{
            //Check that dateOfBirth is before currentDate
            if birthDate < currentDate{
                //Get the time interval between dateOfBirth and currentDate
                let timeInterval=DateInterval(start: birthDate, end: currentDate)
                //Convert the time interval to years
                let guestAge=timeInterval.duration/3.154e+7
                //If guest age is more than 5 years old throw error otherwise set free pass
                if guestAge > 5.0 {
                    throw FreePassError.doesNotQualify(description: "Guest needs to be less than 5 years old to qualify for free pass")
                }else{
                    freePass=true
                }
                //If dateOfBirth is after currentDate throw error
            }else{
                throw FreePassError.dateOfBirthIncorrect(description: "Date of birth needs to be before today's date")
            }
            //If dateOfBirth field is empty throw error
        }else{
            throw FreePassError.emptyField(description: "Date of birth field is empty")
        }
        
        self.mainType=mainType
        self.guestType=guestType
        self.areaAccess=[.amusementPark]
        self.rideAccess=[.allRides]
    }
    
    //Senior
    convenience init(senior mainType:MainType?,guestType:GuestType?,dateOfBirth:String,firstName: String, lastName: String)throws{
        self.init()
        
        //Format the string to date
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        let birthDate = formatter.date(from: dateOfBirth)
        
        guard let mainType=mainType else {
            throw Errors.emptyField(description: "Select a category from main menu")
        }
        guard let guestType=guestType else {
            throw Errors.emptyField(description: "Select a category from the employee sub menu")
        }
        
        if dateOfBirth.isEmpty {
            throw Errors.emptyField(description:"Date of birth field is empty")
        }else{
            self.dateOfBirth=birthDate
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
        self.guestType=guestType
        self.areaAccess=[.amusementPark]
        self.rideAccess=[.allRides,.skipLines]
        self.foodDiscount = .ten
        self.merchandiceDiscount = .ten
    }
    
    //Season
    convenience init(season mainType:MainType?, guestType:GuestType?,dateOfBirth:String,firstName: String, lastName: String,streetAddress:String,city:String,state:String,zipCode:String)throws {
        self.init()
        
        //Format the string to date
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        let birthDate = formatter.date(from: dateOfBirth)
        
        guard let mainType=mainType else {
            throw Errors.emptyField(description: "Select a category from main menu")
        }
        guard let guestType=guestType else {
            throw Errors.emptyField(description: "Select a category from the employee sub menu")
        }
        
        if dateOfBirth.isEmpty {
            throw Errors.emptyField(description:"Date of birth field is empty")
        }else{
            self.dateOfBirth=birthDate
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
        self.guestType=guestType
        self.areaAccess=[.amusementPark]
        self.rideAccess=[.allRides,.skipLines]
        self.foodDiscount = .ten
        self.merchandiceDiscount = .twenty
    }
}

