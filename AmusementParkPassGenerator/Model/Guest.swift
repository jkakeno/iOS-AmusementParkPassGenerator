//
//  Guest.swift
//  AmusementParkPassGenerator
//
//  Created by Jun Kakeno on 9/2/18.
//  Copyright © 2018 Jun Kakeno. All rights reserved.
//

import Foundation

enum FreePassError: Error{
    case doesNotQuality(description:String)
    case dateOfBirthIncorrect(description:String)
    case emptyField(description:String)
}

enum GuestType:String{
    case classic
    case vip
    case minor
}

class Guest:Entrant{
    var foodDiscount: Double?
    var merchandiceDiscount: Double?
    var freePass:Bool=false
    var type:String?
    
    override init() {
        super.init()
    }
    //Initializer for classic guest
    convenience init(type:GuestType.RawValue){
        self.init()
        self.type=type
    }
    //Initializer for vip guest
    convenience init(type:GuestType.RawValue,vipAccess:String,foodDiscount:Double,merchandiceDiscount:Double){
        self.init()
        self.rideAccess.append(vipAccess)
        self.foodDiscount=foodDiscount
        self.merchandiceDiscount=merchandiceDiscount
        self.type=type
    }
    //Initializer for minor guest
    convenience init(type:GuestType.RawValue,dateOfBirth:String)throws{
        self.init()
        self.type=type
        //Format the string date enter by the user to date type
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        let dateOfBirth = formatter.date(from: dateOfBirth)
        
        //Get the current date
        let currentDate = Date()
        
        //Get the year difference between the dateOfBirth and the currentDate
        if let dateOfBirth=dateOfBirth{
            //Check that dateOfBirth is before currentDate
            if dateOfBirth < currentDate{
                //Get the time interval between dateOfBirth and currentDate
                let timeInterval=DateInterval(start: dateOfBirth, end: currentDate)
                //Convert the time interval to years
                let guestAge=timeInterval.duration/3.154e+7
                //If guest age is more than 5 years old throw error otherwise set free pass
                if guestAge > 5.0 {
                    throw FreePassError.doesNotQuality(description: "\(type) guest needs to be less than 5 years old to qualify for free pass")
                }else{
                    freePass=true
                }
                //If dateOfBirth is after currentDate throw error
            }else{
                throw FreePassError.dateOfBirthIncorrect(description: "Date of birth needs to be before today's date")
            }
            //If dateOfBirth field is empty throw error
        }else{
            throw FreePassError.emptyField(description: "\(type) guest needs a date of birth")
        }
    }
}
