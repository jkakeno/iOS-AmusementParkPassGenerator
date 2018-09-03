//
//  Entrant.swift
//  AmusementParkPassGenerator
//
//  Created by Jun Kakeno on 9/2/18.
//  Copyright © 2018 Jun Kakeno. All rights reserved.
//

import Foundation


class Entrant{
    var areaAccess: [String] = []
    var rideAccess: [String] = []
    
    init(){
        self.areaAccess.append(AreaAccess.amusementPark.rawValue)
        self.rideAccess.append(RideAccess.allRides.rawValue)
    }
}
