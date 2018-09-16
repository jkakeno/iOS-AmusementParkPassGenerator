//
//  PassViewController.swift
//  AmusementParkPassGenerator
//
//  Created by EG1 on 9/9/18.
//  Copyright © 2018 Jun Kakeno. All rights reserved.
//

import UIKit
//Imported to use AudioServices
import AudioToolbox

class PassViewController: UIViewController {
    
    var pass:Pass?
    var entrantMainType:MainType?
    var guestType:GuestType?
    var employeeType:EmployeeType?
    var vendorType:VendorType?
    var soundId: SystemSoundID = 0

    //Pass labels
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var passTypeLabel: UILabel!
    @IBOutlet weak var rideAccessLabel: UILabel!
    @IBOutlet weak var foodDiscountLabel: UILabel!
    @IBOutlet weak var merchandiceDiscountLabel: UILabel!
    @IBOutlet weak var testResultLabel: UILabel!
    
    //Test Button Stacks
    @IBOutlet weak var areaAccessStack: UIView!
    @IBOutlet weak var discountAccessStack: UIView!
    @IBOutlet weak var rideAccessStack: UIView!
    
    
    //Test Main Access Butons
    @IBOutlet weak var areaAccessButton: UIButton!
    @IBAction func areaAccessButton(_ sender: UIButton) {
        areaAccessStack.isHidden=false
        rideAccessStack.isHidden=true
        discountAccessStack.isHidden=true
    }
    @IBOutlet weak var rideAccessButton: UIButton!
    @IBAction func rideAccessButton(_ sender: UIButton) {
        areaAccessStack.isHidden=true
        rideAccessStack.isHidden=false
        discountAccessStack.isHidden=true
    }
    @IBOutlet weak var discountAccessButton: UIButton!
    @IBAction func discountAccessButton(_ sender: UIButton) {
        areaAccessStack.isHidden=true
        rideAccessStack.isHidden=true
        discountAccessStack.isHidden=false
    }
    
    //Test Sub Access Buttons
    @IBOutlet weak var parkAccessButton: UIButton!
    @IBAction func parkAccessButton(_ sender: UIButton) {
        do{
        let accessMsg=try pass?.checkAreaAccess(to: .amusementPark)
            testResultLabel.backgroundColor = .green
            testResultLabel.text=accessMsg
            playSound(resource: "AccessGranted", type: "wav")
        }catch AccessError.accessDenied(let description){
            print(description)
            testResultLabel.backgroundColor = .red
            testResultLabel.textColor = .black
            testResultLabel.text=description
            playSound(resource: "AccessDenied", type: "wav")
        }catch{
            //some other error
        }
    }
    @IBOutlet weak var kitchenAccessButton: UIButton!
    @IBAction func kitchenAccessButton(_ sender: UIButton) {
        do{
            let accessMsg=try pass?.checkAreaAccess(to: .kitchen)
            testResultLabel.backgroundColor = .green
            testResultLabel.text=accessMsg
            playSound(resource: "AccessGranted", type: "wav")
        }catch AccessError.accessDenied(let description){
            print(description)
            testResultLabel.backgroundColor = .red
            testResultLabel.textColor = .black
            testResultLabel.text=description
            playSound(resource: "AccessDenied", type: "wav")
        }catch{
            //some other error
        }
    }
    @IBOutlet weak var rideControlAccessButton: UIButton!
    @IBAction func rideControlAccessButton(_ sender: UIButton) {
        do{
            let accessMsg=try pass?.checkAreaAccess(to: .rideControl)
            testResultLabel.backgroundColor = .green
            testResultLabel.text=accessMsg
            playSound(resource: "AccessGranted", type: "wav")
        }catch AccessError.accessDenied(let description){
            print(description)
            testResultLabel.backgroundColor = .red
            testResultLabel.textColor = .black
            testResultLabel.text=description
            playSound(resource: "AccessDenied", type: "wav")
        }catch{
            //some other error
        }
    }
    @IBOutlet weak var maintenanceAccessButton: UIButton!
    @IBAction func maintenanceAccessButton(_ sender: UIButton) {
        do{
            let accessMsg=try pass?.checkAreaAccess(to: .maintenance)
            testResultLabel.backgroundColor = .green
            testResultLabel.text=accessMsg
            playSound(resource: "AccessGranted", type: "wav")
        }catch AccessError.accessDenied(let description){
            print(description)
            testResultLabel.backgroundColor = .red
            testResultLabel.textColor = .black
            testResultLabel.text=description
            playSound(resource: "AccessDenied", type: "wav")
        }catch{
            //some other error
        }
    }
    @IBOutlet weak var officeAccessButton: UIButton!
    @IBAction func officeAccessButton(_ sender: UIButton) {
        do{
            let accessMsg=try pass?.checkAreaAccess(to: .office)
            testResultLabel.backgroundColor = .green
            testResultLabel.text=accessMsg
            playSound(resource: "AccessGranted", type: "wav")
        }catch AccessError.accessDenied(let description){
            print(description)
            testResultLabel.backgroundColor = .red
            testResultLabel.textColor = .black
            testResultLabel.text=description
            playSound(resource: "AccessDenied", type: "wav")
        }catch{
            //some other error
        }
    }
    @IBOutlet weak var foodDiscountButton: UIButton!
    @IBAction func foodDiscountButton(_ sender: UIButton) {
        do{
            let discountMsg=try pass?.checkFoodDiscount()
            testResultLabel.backgroundColor = .green
            testResultLabel.text=discountMsg
            playSound(resource: "AccessGranted", type: "wav")
        }catch AccessError.noDiscount(let description){
            print(description)
            testResultLabel.backgroundColor = .red
            testResultLabel.textColor = .black
            testResultLabel.text=description
            playSound(resource: "AccessDenied", type: "wav")
        }catch{
            //some other error
        }
    }
    @IBOutlet weak var merchandiceDiscountButton: UIButton!
    @IBAction func merchandiceDiscountButton(_ sender: UIButton) {
        do{
            let discountMsg=try pass?.checkMerchandiceDiscount()
            testResultLabel.backgroundColor = .green
            testResultLabel.text=discountMsg
            playSound(resource: "AccessGranted", type: "wav")
        }catch AccessError.noDiscount(let description){
            print(description)
            testResultLabel.backgroundColor = .red
            testResultLabel.textColor = .black
            testResultLabel.text=description
            playSound(resource: "AccessDenied", type: "wav")
        }catch{
            //some other error
        }
    }
    @IBOutlet weak var allRideAccessButton: UIButton!
    @IBAction func allRidesAccessButton(_ sender: UIButton) {
        do{
            let accessMsg=try pass?.checkRideAccess(to: .allRides)
            testResultLabel.backgroundColor = .green
            testResultLabel.text=accessMsg
            playSound(resource: "AccessGranted", type: "wav")
        }catch AccessError.accessDenied(let description){
            print(description)
            testResultLabel.backgroundColor = .red
            testResultLabel.textColor = .black
            testResultLabel.text=description
            playSound(resource: "AccessDenied", type: "wav")
        }catch{
            //some other error
        }
    }
    @IBOutlet weak var skipLinesButton: UIButton!
    @IBAction func skipLinesButtons(_ sender: UIButton) {
        do{
            let accessMsg=try pass?.checkRideAccess(to: .skipLines)
            testResultLabel.backgroundColor = .green
            testResultLabel.text=accessMsg
            playSound(resource: "AccessGranted", type: "wav")
        }catch AccessError.accessDenied(let description){
            print(description)
            testResultLabel.backgroundColor = .red
            testResultLabel.textColor = .black
            testResultLabel.text=description
            playSound(resource: "AccessDenied", type: "wav")
        }catch{
            //some other error
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        areaAccessStack.isHidden=true
        rideAccessStack.isHidden=true
        discountAccessStack.isHidden=true
        
        if let pass=pass{
            if let guest=pass.guest{
                firstNameLabel.text=guest.firstName
                lastNameLabel.text=guest.lastName
                passTypeLabel.text=guest.guestType?.rawValue
                
                var rideAccessString=""
                for ride in guest.rideAccess{
                    rideAccessString += ride.rawValue + " "
                }
                rideAccessLabel.text=rideAccessString
                
                if let foodDiscount=guest.foodDiscount?.rawValue{
                    foodDiscountLabel.text="Food discount \(foodDiscount)"
                }else{
                    foodDiscountLabel.isHidden=true
                }
                if let merchandiceDiscount=guest.merchandiceDiscount?.rawValue{
                    merchandiceDiscountLabel.text="Merchandice discount \(merchandiceDiscount)"
                }else{
                    merchandiceDiscountLabel.isHidden=true
                }
            }
            if let vendor=pass.vendor{
                firstNameLabel.text=vendor.firstName
                lastNameLabel.text=vendor.lastName
                passTypeLabel.text=vendor.vendorType?.rawValue
                
                var rideAccessString=""
                for ride in vendor.rideAccess{
                    rideAccessString += ride.rawValue + " "
                }
                rideAccessLabel.text=rideAccessString
                
                if let foodDiscount=vendor.foodDiscount?.rawValue{
                    foodDiscountLabel.text="Food discount \(foodDiscount)"
                }else{
                    foodDiscountLabel.isHidden=true
                }
                if let merchandiceDiscount=vendor.merchandiceDiscount?.rawValue{
                    merchandiceDiscountLabel.text="Merchandice discount \(merchandiceDiscount)"
                }else{
                    merchandiceDiscountLabel.isHidden=true
                }
            }
            if let employee=pass.employee{
                firstNameLabel.text=employee.firstName
                lastNameLabel.text=employee.lastName
                passTypeLabel.text=employee.employeeType?.rawValue
                
                var rideAccessString=""
                for ride in employee.rideAccess{
                    rideAccessString += ride.rawValue + " "
                }
                rideAccessLabel.text=rideAccessString
                
                if let foodDiscount=employee.foodDiscount?.rawValue{
                    foodDiscountLabel.text="Food discount \(foodDiscount)"
                }else{
                    foodDiscountLabel.isHidden=true
                }
                if let merchandiceDiscount=employee.merchandiceDiscount?.rawValue{
                    merchandiceDiscountLabel.text="Merchandice discount \(merchandiceDiscount)"
                }else{
                    merchandiceDiscountLabel.isHidden=true
                }
            }
        }
    }

    func playSound(resource: String, type: String){
        let path = Bundle.main.path(forResource: resource, ofType: type)
        let soundUrl = URL(fileURLWithPath: path!)
        AudioServicesCreateSystemSoundID(soundUrl as CFURL, &soundId)
        AudioServicesPlaySystemSound(soundId)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
