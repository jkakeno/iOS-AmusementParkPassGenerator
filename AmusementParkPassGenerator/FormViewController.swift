//
//  ViewController.swift
//  AmusementParkPassGenerator
//
//  Created by Jun Kakeno on 9/2/18.
//  Copyright © 2018 Jun Kakeno. All rights reserved.
//

import UIKit



class FormViewController: UIViewController, UITextFieldDelegate {

    var pass:Pass?
    var entrantMainType:MainType?
    var entrantSubType:SubType?
    
    //Text Fields
    @IBOutlet weak var dateOfBirthField: UITextField!
    @IBOutlet weak var dateOfVisitField: UITextField!
    @IBOutlet weak var ssnField: UITextField!
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var companyField: UITextField!
    @IBOutlet weak var streetAddressField: UITextField!
    @IBOutlet weak var cityField: UITextField!
    @IBOutlet weak var stateField: UITextField!
    @IBOutlet weak var zipCodeField: UITextField!
    

    //Main Menu Buttons
    @IBOutlet weak var guestButton: UIButton!
    @IBAction func guestButton(_ sender: UIButton) {
        print(sender.titleLabel!)
        guestSubMenu.isHidden=false
        employeeSubMenu.isHidden=true
        managerSubMenu.isHidden=true
        contractSubMenu.isHidden=true
        vendorSubMenu.isHidden=true
        
        guestButton.setTitleColor(.white, for: .normal)
        employeeButton.setTitleColor(.gray, for: .normal)
        managerButton.setTitleColor(.gray, for: .normal)
        contractButton.setTitleColor(.gray, for: .normal)
        vendorButton.setTitleColor(.gray, for: .normal)
        
        entrantMainType = .guest
        entrantSubType = nil
        
        resetFormFields()
        resetSubTypeButtons()
    }
    @IBOutlet weak var employeeButton: UIButton!
    @IBAction func employeeButton(_ sender: UIButton) {
        guestSubMenu.isHidden=true
        employeeSubMenu.isHidden=false
        managerSubMenu.isHidden=true
        contractSubMenu.isHidden=true
        vendorSubMenu.isHidden=true
        
        guestButton.setTitleColor(.gray, for: .normal)
        employeeButton.setTitleColor(.white, for: .normal)
        managerButton.setTitleColor(.gray, for: .normal)
        contractButton.setTitleColor(.gray, for: .normal)
        vendorButton.setTitleColor(.gray, for: .normal)
        
        entrantMainType = .employee
        entrantSubType = nil
        
        resetFormFields()
        resetSubTypeButtons()
    }
    @IBOutlet weak var managerButton: UIButton!
    @IBAction func managerButton(_ sender: UIButton) {
        guestSubMenu.isHidden=true
        employeeSubMenu.isHidden=true
        managerSubMenu.isHidden=false
        contractSubMenu.isHidden=true
        vendorSubMenu.isHidden=true
        
        guestButton.setTitleColor(.gray, for: .normal)
        employeeButton.setTitleColor(.gray, for: .normal)
        managerButton.setTitleColor(.white, for: .normal)
        contractButton.setTitleColor(.gray, for: .normal)
        vendorButton.setTitleColor(.gray, for: .normal)
        
        entrantMainType = .manager
        entrantSubType = nil
        
        resetFormFields()
        resetSubTypeButtons()
    }
    @IBOutlet weak var contractButton: UIButton!
    @IBAction func contractButton(_ sender: UIButton) {
        guestSubMenu.isHidden=true
        employeeSubMenu.isHidden=true
        managerSubMenu.isHidden=true
        contractSubMenu.isHidden=false
        vendorSubMenu.isHidden=true
        
        guestButton.setTitleColor(.gray, for: .normal)
        employeeButton.setTitleColor(.gray, for: .normal)
        managerButton.setTitleColor(.gray, for: .normal)
        contractButton.setTitleColor(.white, for: .normal)
        vendorButton.setTitleColor(.gray, for: .normal)
        
        entrantMainType = .contract
        entrantSubType = nil
        
        resetFormFields()
        resetSubTypeButtons()
    }
    @IBOutlet weak var vendorButton: UIButton!
    @IBAction func vendorButton(_ sender: UIButton) {
        guestSubMenu.isHidden=true
        employeeSubMenu.isHidden=true
        managerSubMenu.isHidden=true
        contractSubMenu.isHidden=true
        vendorSubMenu.isHidden=false
        
        guestButton.setTitleColor(.gray, for: .normal)
        employeeButton.setTitleColor(.gray, for: .normal)
        managerButton.setTitleColor(.gray, for: .normal)
        contractButton.setTitleColor(.gray, for: .normal)
        vendorButton.setTitleColor(.white, for: .normal)
        
        entrantMainType = .vendor
        entrantSubType = nil
        
        resetFormFields()
        resetSubTypeButtons()
    }
    
    //Guest Sub Menu Buttons
    @IBOutlet weak var guestSubMenu: UIView!
    @IBOutlet weak var minorGuestButton: UIButton!
    @IBAction func minorGuestButton(_ sender: UIButton) {
        minorGuestButton.setTitleColor(.white, for: .normal)
        classicGuestButton.setTitleColor(.gray, for: .normal)
        vipGuestButton.setTitleColor(.gray, for: .normal)
        seniorGuestButton.setTitleColor(.gray, for: .normal)
        seasonGuestButton.setTitleColor(.gray, for: .normal)
        
        dateOfBirthField.backgroundColor = .white
        dateOfVisitField.backgroundColor = .gray
        ssnField.backgroundColor = .gray
        firstNameField.backgroundColor = .gray
        lastNameField.backgroundColor = .gray
        companyField.backgroundColor = .gray
        streetAddressField.backgroundColor = .gray
        stateField.backgroundColor = .gray
        cityField.backgroundColor = .gray
        zipCodeField.backgroundColor = .gray
        
        entrantMainType = .guest
        entrantSubType = .minor

        resetFormFields()
    }
    @IBOutlet weak var classicGuestButton: UIButton!
    @IBAction func classicGuestButton(_ sender: UIButton) {
        
        minorGuestButton.setTitleColor(.gray, for: .normal)
        classicGuestButton.setTitleColor(.white, for: .normal)
        vipGuestButton.setTitleColor(.gray, for: .normal)
        seniorGuestButton.setTitleColor(.gray, for: .normal)
        seasonGuestButton.setTitleColor(.gray, for: .normal)
        
        dateOfBirthField.backgroundColor = .gray
        dateOfVisitField.backgroundColor = .gray
        ssnField.backgroundColor = .gray
        firstNameField.backgroundColor = .gray
        lastNameField.backgroundColor = .gray
        companyField.backgroundColor = .gray
        streetAddressField.backgroundColor = .gray
        stateField.backgroundColor = .gray
        cityField.backgroundColor = .gray
        zipCodeField.backgroundColor = .gray
        
        entrantMainType = .guest
        entrantSubType = .classic

        resetFormFields()
    }
    @IBOutlet weak var vipGuestButton: UIButton!
    @IBAction func vipGuestButton(_ sender: UIButton) {
        minorGuestButton.setTitleColor(.gray, for: .normal)
        classicGuestButton.setTitleColor(.gray, for: .normal)
        vipGuestButton.setTitleColor(.white, for: .normal)
        seniorGuestButton.setTitleColor(.gray, for: .normal)
        seasonGuestButton.setTitleColor(.gray, for: .normal)
        
        dateOfBirthField.backgroundColor = .gray
        dateOfVisitField.backgroundColor = .gray
        ssnField.backgroundColor = .gray
        firstNameField.backgroundColor = .gray
        lastNameField.backgroundColor = .gray
        companyField.backgroundColor = .gray
        streetAddressField.backgroundColor = .gray
        cityField.backgroundColor = .gray
        stateField.backgroundColor = .gray
        zipCodeField.backgroundColor = .gray
        
        entrantMainType = .guest
        entrantSubType = .vip
        
        resetFormFields()
    }
    @IBOutlet weak var seniorGuestButton: UIButton!
    @IBAction func seniorGuestButton(_ sender: UIButton) {
        minorGuestButton.setTitleColor(.gray, for: .normal)
        classicGuestButton.setTitleColor(.gray, for: .normal)
        vipGuestButton.setTitleColor(.gray, for: .normal)
        seniorGuestButton.setTitleColor(.white, for: .normal)
        seasonGuestButton.setTitleColor(.gray, for: .normal)
        
        dateOfBirthField.backgroundColor = .white
        dateOfVisitField.backgroundColor = .gray
        ssnField.backgroundColor = .gray
        firstNameField.backgroundColor = .white
        lastNameField.backgroundColor = .white
        companyField.backgroundColor = .gray
        streetAddressField.backgroundColor = .gray
        cityField.backgroundColor = .gray
        stateField.backgroundColor = .gray
        zipCodeField.backgroundColor = .gray

        entrantMainType = .guest
        entrantSubType = .senior
        
        resetFormFields()
    }
    @IBOutlet weak var seasonGuestButton: UIButton!
    @IBAction func seasonGuestButton(_ sender: UIButton) {
        minorGuestButton.setTitleColor(.gray, for: .normal)
        classicGuestButton.setTitleColor(.gray, for: .normal)
        vipGuestButton.setTitleColor(.gray, for: .normal)
        seniorGuestButton.setTitleColor(.gray, for: .normal)
        seasonGuestButton.setTitleColor(.white, for: .normal)
        
        dateOfBirthField.backgroundColor = .white
        dateOfVisitField.backgroundColor = .gray
        ssnField.backgroundColor = .gray
        firstNameField.backgroundColor = .white
        lastNameField.backgroundColor = .white
        companyField.backgroundColor = .gray
        streetAddressField.backgroundColor = .white
        cityField.backgroundColor = .white
        stateField.backgroundColor = .white
        zipCodeField.backgroundColor = .white
        
        entrantMainType = .guest
        entrantSubType = .season
        
        resetFormFields()
    }
    
    //Employee Sub Menu Buttons
    @IBOutlet weak var employeeSubMenu: UIView!
    @IBOutlet weak var foodServiceButton: UIButton!
    @IBAction func foodServiceButton(_ sender: UIButton) {
        foodServiceButton.setTitleColor(.white, for: .normal)
        rideServiceButton.setTitleColor(.gray, for: .normal)
        maintenanceEmployeeButton.setTitleColor(.gray, for: .normal)
        
        dateOfBirthField.backgroundColor = .white
        dateOfVisitField.backgroundColor = .gray
        ssnField.backgroundColor = .white
        firstNameField.backgroundColor = .white
        lastNameField.backgroundColor = .white
        companyField.backgroundColor = .gray
        streetAddressField.backgroundColor = .white
        cityField.backgroundColor = .white
        stateField.backgroundColor = .white
        zipCodeField.backgroundColor = .white
        
        entrantMainType = .employee
        entrantSubType = .foodServiceEmployee
        
        resetFormFields()
    }
    @IBOutlet weak var rideServiceButton: UIButton!
    @IBAction func rideServiceButton(_ sender: UIButton) {
        foodServiceButton.setTitleColor(.gray, for: .normal)
        rideServiceButton.setTitleColor(.white, for: .normal)
        maintenanceEmployeeButton.setTitleColor(.gray, for: .normal)
        
        dateOfBirthField.backgroundColor = .white
        dateOfVisitField.backgroundColor = .gray
        ssnField.backgroundColor = .white
        firstNameField.backgroundColor = .white
        lastNameField.backgroundColor = .white
        companyField.backgroundColor = .gray
        streetAddressField.backgroundColor = .white
        cityField.backgroundColor = .white
        stateField.backgroundColor = .white
        zipCodeField.backgroundColor = .white
        
        entrantMainType = .employee
        entrantSubType = .rideServiceEmployee
        
        resetFormFields()
    }
    @IBOutlet weak var maintenanceEmployeeButton: UIButton!
    @IBAction func maintenanceEmployeeButton(_ sender: UIButton) {
        foodServiceButton.setTitleColor(.gray, for: .normal)
        rideServiceButton.setTitleColor(.gray, for: .normal)
        maintenanceEmployeeButton.setTitleColor(.white, for: .normal)
        
        dateOfBirthField.backgroundColor = .white
        dateOfVisitField.backgroundColor = .gray
        ssnField.backgroundColor = .white
        firstNameField.backgroundColor = .white
        lastNameField.backgroundColor = .white
        companyField.backgroundColor = .gray
        streetAddressField.backgroundColor = .white
        cityField.backgroundColor = .white
        stateField.backgroundColor = .white
        zipCodeField.backgroundColor = .white
        
        entrantMainType = .employee
        entrantSubType = .maintenanceEmployee
        
        resetFormFields()
    }
    
    //Manager Sub Menu Buttons
    @IBOutlet weak var managerSubMenu: UIView!
    @IBOutlet weak var shiftManagerButton: UIButton!
    @IBAction func shiftManagerButton(_ sender: UIButton) {
        shiftManagerButton.setTitleColor(.white, for: .normal)
        generalManagerButton.setTitleColor(.gray, for: .normal)
        seniorManagerButton.setTitleColor(.gray, for: .normal)
        
        dateOfBirthField.backgroundColor = .white
        dateOfVisitField.backgroundColor = .gray
        ssnField.backgroundColor = .white
        firstNameField.backgroundColor = .white
        lastNameField.backgroundColor = .white
        companyField.backgroundColor = .gray
        streetAddressField.backgroundColor = .white
        cityField.backgroundColor = .white
        stateField.backgroundColor = .white
        zipCodeField.backgroundColor = .white
        
        entrantMainType = .manager
        entrantSubType = .shiftManager
        
        resetFormFields()
    }
    @IBOutlet weak var generalManagerButton: UIButton!
    @IBAction func generalManagerButton(_ sender: UIButton) {
        shiftManagerButton.setTitleColor(.gray, for: .normal)
        generalManagerButton.setTitleColor(.white, for: .normal)
        seniorManagerButton.setTitleColor(.gray, for: .normal)
        
        dateOfBirthField.backgroundColor = .white
        dateOfVisitField.backgroundColor = .gray
        ssnField.backgroundColor = .white
        firstNameField.backgroundColor = .white
        lastNameField.backgroundColor = .white
        companyField.backgroundColor = .gray
        streetAddressField.backgroundColor = .white
        cityField.backgroundColor = .white
        stateField.backgroundColor = .white
        zipCodeField.backgroundColor = .white
        
        entrantMainType = .manager
        entrantSubType = .generalManager
        
        resetFormFields()
    }
    @IBOutlet weak var seniorManagerButton: UIButton!
    @IBAction func seniorManagerButton(_ sender: UIButton) {
        shiftManagerButton.setTitleColor(.gray, for: .normal)
        generalManagerButton.setTitleColor(.gray, for: .normal)
        seniorManagerButton.setTitleColor(.white, for: .normal)
        
        dateOfBirthField.backgroundColor = .white
        dateOfVisitField.backgroundColor = .gray
        ssnField.backgroundColor = .white
        firstNameField.backgroundColor = .white
        lastNameField.backgroundColor = .white
        companyField.backgroundColor = .gray
        streetAddressField.backgroundColor = .white
        cityField.backgroundColor = .white
        stateField.backgroundColor = .white
        zipCodeField.backgroundColor = .white
        
        entrantMainType = .manager
        entrantSubType = .seniorManager
        
        resetFormFields()
    }
    
    //Contract Sub Menu Buttons
    @IBOutlet weak var contractSubMenu: UIView!
    @IBOutlet weak var project1001Button: UIButton!
    @IBAction func project1001Button(_ sender: UIButton) {
        project1001Button.setTitleColor(.white, for: .normal)
        project1002Button.setTitleColor(.gray, for: .normal)
        project1003Button.setTitleColor(.gray, for: .normal)
        project2001Button.setTitleColor(.gray, for: .normal)
        project2002Button.setTitleColor(.gray, for: .normal)
        
        dateOfBirthField.backgroundColor = .white
        dateOfVisitField.backgroundColor = .gray
        ssnField.backgroundColor = .white
        firstNameField.backgroundColor = .white
        lastNameField.backgroundColor = .white
        companyField.backgroundColor = .gray
        streetAddressField.backgroundColor = .white
        cityField.backgroundColor = .white
        stateField.backgroundColor = .white
        zipCodeField.backgroundColor = .white
        
        entrantMainType = .contract
        entrantSubType = .contract1001
        
        resetFormFields()
    }
    @IBOutlet weak var project1002Button: UIButton!
    @IBAction func project1002Button(_ sender: UIButton) {
        project1001Button.setTitleColor(.gray, for: .normal)
        project1002Button.setTitleColor(.white, for: .normal)
        project1003Button.setTitleColor(.gray, for: .normal)
        project2001Button.setTitleColor(.gray, for: .normal)
        project2002Button.setTitleColor(.gray, for: .normal)
        
        dateOfBirthField.backgroundColor = .white
        dateOfVisitField.backgroundColor = .gray
        ssnField.backgroundColor = .white
        firstNameField.backgroundColor = .white
        lastNameField.backgroundColor = .white
        companyField.backgroundColor = .gray
        streetAddressField.backgroundColor = .white
        cityField.backgroundColor = .white
        stateField.backgroundColor = .white
        zipCodeField.backgroundColor = .white
        
        entrantMainType = .contract
        entrantSubType = .contract1002
        
        resetFormFields()
    }
    @IBOutlet weak var project1003Button: UIButton!
    @IBAction func project1003Button(_ sender: UIButton) {
        project1001Button.setTitleColor(.gray, for: .normal)
        project1002Button.setTitleColor(.gray, for: .normal)
        project1003Button.setTitleColor(.white, for: .normal)
        project2001Button.setTitleColor(.gray, for: .normal)
        project2002Button.setTitleColor(.gray, for: .normal)
        
        dateOfBirthField.backgroundColor = .white
        dateOfVisitField.backgroundColor = .gray
        ssnField.backgroundColor = .white
        firstNameField.backgroundColor = .white
        lastNameField.backgroundColor = .white
        companyField.backgroundColor = .gray
        streetAddressField.backgroundColor = .white
        cityField.backgroundColor = .white
        stateField.backgroundColor = .white
        zipCodeField.backgroundColor = .white
        
        entrantMainType = .contract
        entrantSubType = .contract1003
        
        resetFormFields()
    }
    @IBOutlet weak var project2001Button: UIButton!
    @IBAction func project2001Button(_ sender: UIButton) {
        project1001Button.setTitleColor(.gray, for: .normal)
        project1002Button.setTitleColor(.gray, for: .normal)
        project1003Button.setTitleColor(.gray, for: .normal)
        project2001Button.setTitleColor(.white, for: .normal)
        project2002Button.setTitleColor(.gray, for: .normal)
        
        dateOfBirthField.backgroundColor = .white
        dateOfVisitField.backgroundColor = .gray
        ssnField.backgroundColor = .white
        firstNameField.backgroundColor = .white
        lastNameField.backgroundColor = .white
        companyField.backgroundColor = .gray
        streetAddressField.backgroundColor = .white
        cityField.backgroundColor = .white
        stateField.backgroundColor = .white
        zipCodeField.backgroundColor = .white
        
        entrantMainType = .contract
        entrantSubType = .contract2001
        
        resetFormFields()
    }
    @IBOutlet weak var project2002Button: UIButton!
    @IBAction func project2002Button(_ sender: UIButton) {
        project1001Button.setTitleColor(.gray, for: .normal)
        project1002Button.setTitleColor(.gray, for: .normal)
        project1003Button.setTitleColor(.gray, for: .normal)
        project2001Button.setTitleColor(.gray, for: .normal)
        project2002Button.setTitleColor(.white, for: .normal)
        
        dateOfBirthField.backgroundColor = .white
        dateOfVisitField.backgroundColor = .gray
        ssnField.backgroundColor = .white
        firstNameField.backgroundColor = .white
        lastNameField.backgroundColor = .white
        companyField.backgroundColor = .gray
        streetAddressField.backgroundColor = .white
        cityField.backgroundColor = .white
        stateField.backgroundColor = .white
        zipCodeField.backgroundColor = .white
        
        entrantMainType = .contract
        entrantSubType = .contract2002
        
        resetFormFields()
    }
    
    //Vendor Sub Menu Buttons
    @IBOutlet weak var vendorSubMenu: UIView!
    @IBOutlet weak var acmeButton: UIButton!
    @IBAction func acmeButton(_ sender: UIButton) {
        acmeButton.setTitleColor(.white, for: .normal)
        orkinButton.setTitleColor(.gray, for: .normal)
        fedexButton.setTitleColor(.gray, for: .normal)
        nwelectricalButton.setTitleColor(.gray, for: .normal)
        
        dateOfBirthField.backgroundColor = .white
        dateOfVisitField.backgroundColor = .white
        ssnField.backgroundColor = .gray
        firstNameField.backgroundColor = .white
        lastNameField.backgroundColor = .white
        companyField.backgroundColor = .white
        streetAddressField.backgroundColor = .gray
        cityField.backgroundColor = .gray
        stateField.backgroundColor = .gray
        zipCodeField.backgroundColor = .gray
        
        entrantMainType = .vendor
        entrantSubType = .acme
        
        resetFormFields()
    }
    @IBOutlet weak var orkinButton: UIButton!
    @IBAction func orkinButton(_ sender: UIButton) {
        acmeButton.setTitleColor(.gray, for: .normal)
        orkinButton.setTitleColor(.white, for: .normal)
        fedexButton.setTitleColor(.gray, for: .normal)
        nwelectricalButton.setTitleColor(.gray, for: .normal)
        
        dateOfBirthField.backgroundColor = .white
        dateOfVisitField.backgroundColor = .white
        ssnField.backgroundColor = .gray
        firstNameField.backgroundColor = .white
        lastNameField.backgroundColor = .white
        companyField.backgroundColor = .white
        streetAddressField.backgroundColor = .gray
        cityField.backgroundColor = .gray
        stateField.backgroundColor = .gray
        zipCodeField.backgroundColor = .gray
        
        entrantMainType = .vendor
        entrantSubType = .orkin
        
        resetFormFields()
    }
    @IBOutlet weak var fedexButton: UIButton!
    @IBAction func fedexButton(_ sender: UIButton) {
        acmeButton.setTitleColor(.gray, for: .normal)
        orkinButton.setTitleColor(.gray, for: .normal)
        fedexButton.setTitleColor(.white, for: .normal)
        nwelectricalButton.setTitleColor(.gray, for: .normal)
        
        dateOfBirthField.backgroundColor = .white
        dateOfVisitField.backgroundColor = .white
        ssnField.backgroundColor = .gray
        firstNameField.backgroundColor = .white
        lastNameField.backgroundColor = .white
        companyField.backgroundColor = .white
        streetAddressField.backgroundColor = .gray
        cityField.backgroundColor = .gray
        stateField.backgroundColor = .gray
        zipCodeField.backgroundColor = .gray
        
        entrantMainType = .vendor
        entrantSubType = .fedex
        
        resetFormFields()
    }
    @IBOutlet weak var nwelectricalButton: UIButton!
    @IBAction func nwelectricalButton(_ sender: UIButton) {
        acmeButton.setTitleColor(.gray, for: .normal)
        orkinButton.setTitleColor(.gray, for: .normal)
        fedexButton.setTitleColor(.gray, for: .normal)
        nwelectricalButton.setTitleColor(.white, for: .normal)
        
        dateOfBirthField.backgroundColor = .white
        dateOfVisitField.backgroundColor = .white
        ssnField.backgroundColor = .gray
        firstNameField.backgroundColor = .white
        lastNameField.backgroundColor = .white
        companyField.backgroundColor = .white
        streetAddressField.backgroundColor = .gray
        cityField.backgroundColor = .gray
        stateField.backgroundColor = .gray
        zipCodeField.backgroundColor = .gray
        
        entrantMainType = .vendor
        entrantSubType = .nwelectrical
        
        resetFormFields()
    }
    
    //Other buttons
    @IBAction func generatorPassButton(_ sender: UIButton) {
        if entrantMainType != nil {
            if entrantSubType != nil, let entrantSubType=entrantSubType{
                switch entrantSubType{
                case .classic:
                    do{
                        let classicGuest=try Guest(classic: entrantMainType, guestType: .classic)
                        pass=Pass(vendor: nil, employee: nil, guest: classicGuest)
                        sendPassToViewController(pass)
                    }catch{
                        //some other error
                    }
                case .minor:
                    do{
                        let minorGuest=try Guest(minor: entrantMainType, guestType: .minor, dateOfBirth: dateOfBirthField.text!)
                        pass=Pass(vendor: nil, employee: nil, guest: minorGuest)
                        sendPassToViewController(pass)
                    }catch FreePassError.emptyField(let description){
                        print(description)
                        showAlert(message: description)
                    }catch FreePassError.dateOfBirthIncorrect(let description){
                        print(description)
                        showAlert(message: description)
                    }catch FreePassError.doesNotQualify(let description){
                        print(description)
                        showAlert(message: description)
                    }catch{
                        //some other error
                    }
                case .vip:
                    do{
                        let vipGuest=try Guest(vip: entrantMainType, guestType: .vip)
                        pass=Pass(vendor: nil, employee: nil, guest: vipGuest)
                        sendPassToViewController(pass)
                    }catch Errors.emptyField(let description){
                        print(description)
                        showAlert(message: description)
                    }catch{
                        //some other error
                    }
                case .senior:
                    do{
                        let seniorGuest=try Guest(senior: entrantMainType, guestType: .senior, dateOfBirth: dateOfBirthField.text!, firstName: firstNameField.text!, lastName: lastNameField.text!)
                        pass=Pass(vendor: nil, employee: nil, guest: seniorGuest)
                        sendPassToViewController(pass)
                    }catch Errors.emptyField(let description){
                        print(description)
                        showAlert(message: description)
                    }catch{
                        //some other error
                    }
                case .season:
                    do{
                        let seasonGuest=try Guest(season: entrantMainType, guestType: .season, dateOfBirth: dateOfBirthField.text!, firstName: firstNameField.text!, lastName: lastNameField.text!, streetAddress: streetAddressField.text!, city: cityField.text!, state: stateField.text!, zipCode: zipCodeField.text!)
                        pass=Pass(vendor: nil, employee: nil, guest: seasonGuest)
                        sendPassToViewController(pass)
                    }catch Errors.emptyField(let description){
                        print(description)
                        showAlert(message: description)
                    }catch{
                        //some other error
                    }
                case .foodServiceEmployee:
                    do{
                        let employee=try Employee(entrantMainType, employeeType: .foodServiceEmployee, dateOfBirth: dateOfBirthField.text!, ssn: ssnField.text!, firstName: firstNameField.text!, lastName: lastNameField.text!, streetAddress: streetAddressField.text!, city: cityField.text!, state: stateField.text!, zipCode: zipCodeField.text!)
                        pass=Pass(vendor: nil, employee: employee, guest: nil)
                        sendPassToViewController(pass)
                    }catch Errors.emptyField(let description){
                        print(description)
                        showAlert(message: description)
                    }catch{
                        //some other error
                    }
                case .rideServiceEmployee:
                    do{
                        let employee=try Employee(entrantMainType, employeeType: .rideServiceEmployee, dateOfBirth: dateOfBirthField.text!, ssn: ssnField.text!, firstName: firstNameField.text!, lastName: lastNameField.text!, streetAddress: streetAddressField.text!, city: cityField.text!, state: stateField.text!, zipCode: zipCodeField.text!)
                        pass=Pass(vendor: nil, employee: employee, guest: nil)
                        sendPassToViewController(pass)
                    }catch Errors.emptyField(let description){
                        print(description)
                        showAlert(message: description)
                    }catch{
                        //some other error
                    }
                case .maintenanceEmployee:
                    do{
                        let employee=try Employee(entrantMainType, employeeType: .maintenanceEmployee, dateOfBirth: dateOfBirthField.text!, ssn: ssnField.text!, firstName: firstNameField.text!, lastName: lastNameField.text!, streetAddress: streetAddressField.text!, city: cityField.text!, state: stateField.text!, zipCode: zipCodeField.text!)
                        pass=Pass(vendor: nil, employee: employee, guest: nil)
                        sendPassToViewController(pass)
                    }catch Errors.emptyField(let description){
                        print(description)
                        showAlert(message: description)
                    }catch{
                        //some other error
                    }
                case .shiftManager:
                    do{
                        let employee=try Employee(entrantMainType, employeeType: .shiftManager, dateOfBirth: dateOfBirthField.text!, ssn: ssnField.text!, firstName: firstNameField.text!, lastName: lastNameField.text!, streetAddress: streetAddressField.text!, city: cityField.text!, state: stateField.text!, zipCode: zipCodeField.text!)
                        pass=Pass(vendor: nil, employee: employee, guest: nil)
                        sendPassToViewController(pass)
                    }catch Errors.emptyField(let description){
                        print(description)
                        showAlert(message: description)
                    }catch{
                        //some other error
                    }
                case .generalManager:
                    do{
                        let employee=try Employee(entrantMainType, employeeType: .generalManager, dateOfBirth: dateOfBirthField.text!, ssn: ssnField.text!, firstName: firstNameField.text!, lastName: lastNameField.text!, streetAddress: streetAddressField.text!, city: cityField.text!, state: stateField.text!, zipCode: zipCodeField.text!)
                        pass=Pass(vendor: nil, employee: employee, guest: nil)
                        sendPassToViewController(pass)
                    }catch Errors.emptyField(let description){
                        print(description)
                        showAlert(message: description)
                    }catch{
                        //some other error
                    }
                case .seniorManager:
                    do{
                        let employee=try Employee(entrantMainType, employeeType: .seniorManager, dateOfBirth: dateOfBirthField.text!, ssn: ssnField.text!, firstName: firstNameField.text!, lastName: lastNameField.text!, streetAddress: streetAddressField.text!, city: cityField.text!, state: stateField.text!, zipCode: zipCodeField.text!)
                        pass=Pass(vendor: nil, employee: employee, guest: nil)
                        sendPassToViewController(pass)
                    }catch Errors.emptyField(let description){
                        print(description)
                        showAlert(message: description)
                    }catch{
                        //some other error
                    }
                case .contract1001:
                    do{
                        let employee=try Employee(entrantMainType, employeeType: .contract1001, dateOfBirth: dateOfBirthField.text!, ssn: ssnField.text!, firstName: firstNameField.text!, lastName: lastNameField.text!, streetAddress: streetAddressField.text!, city: cityField.text!, state: stateField.text!, zipCode: zipCodeField.text!)
                        pass=Pass(vendor: nil, employee: employee, guest: nil)
                        sendPassToViewController(pass)
                    }catch Errors.emptyField(let description){
                        print(description)
                        showAlert(message: description)
                    }catch{
                        //some other error
                    }
                case .contract1002:
                    do{
                        let employee=try Employee(entrantMainType, employeeType: .contract1002, dateOfBirth: dateOfBirthField.text!, ssn: ssnField.text!, firstName: firstNameField.text!, lastName: lastNameField.text!, streetAddress: streetAddressField.text!, city: cityField.text!, state: stateField.text!, zipCode: zipCodeField.text!)
                        pass=Pass(vendor: nil, employee: employee, guest: nil)
                        sendPassToViewController(pass)
                    }catch Errors.emptyField(let description){
                        print(description)
                        showAlert(message: description)
                    }catch{
                        //some other error
                    }
                case .contract1003:
                    do{
                        let employee=try Employee(entrantMainType, employeeType: .contract1003, dateOfBirth: dateOfBirthField.text!, ssn: ssnField.text!, firstName: firstNameField.text!, lastName: lastNameField.text!, streetAddress: streetAddressField.text!, city: cityField.text!, state: stateField.text!, zipCode: zipCodeField.text!)
                        pass=Pass(vendor: nil, employee: employee, guest: nil)
                        sendPassToViewController(pass)
                    }catch Errors.emptyField(let description){
                        print(description)
                        showAlert(message: description)
                    }catch{
                        //some other error
                    }
                case .contract2001:
                    do{
                        let employee=try Employee(entrantMainType, employeeType: .contract2001, dateOfBirth: dateOfBirthField.text!, ssn: ssnField.text!, firstName: firstNameField.text!, lastName: lastNameField.text!, streetAddress: streetAddressField.text!, city: cityField.text!, state: stateField.text!, zipCode: zipCodeField.text!)
                        pass=Pass(vendor: nil, employee: employee, guest: nil)
                        sendPassToViewController(pass)
                    }catch Errors.emptyField(let description){
                        print(description)
                        showAlert(message: description)
                    }catch{
                        //some other error
                    }
                    case .contract2002:
                    do{
                        let employee=try Employee(entrantMainType, employeeType: .contract2002, dateOfBirth: dateOfBirthField.text!, ssn: ssnField.text!, firstName: firstNameField.text!, lastName: lastNameField.text!, streetAddress: streetAddressField.text!, city: cityField.text!, state: stateField.text!, zipCode: zipCodeField.text!)
                        pass=Pass(vendor: nil, employee: employee, guest: nil)
                        sendPassToViewController(pass)
                    }catch Errors.emptyField(let description){
                        print(description)
                        showAlert(message: description)
                    }catch{
                        //some other error
                    }
                case .acme:
                    do{
                        let acme=try Vendor(entrantMainType, vendorType: .acme, dateOfBirth: dateOfBirthField.text!, dateOfVisit: dateOfBirthField.text!, firstName: firstNameField.text!, lastName: lastNameField.text!)
                        pass=Pass(vendor: acme, employee: nil, guest: nil)
                        sendPassToViewController(pass)
                    }catch Errors.emptyField(let description){
                        print(description)
                        showAlert(message: description)
                    }catch{
                        //some other error
                    }
                case .fedex:
                    do{
                        let fedex=try Vendor(entrantMainType, vendorType: .fedex, dateOfBirth: dateOfBirthField.text!, dateOfVisit: dateOfBirthField.text!, firstName: firstNameField.text!, lastName: lastNameField.text!)
                        pass=Pass(vendor: fedex, employee: nil, guest: nil)
                        sendPassToViewController(pass)
                    }catch Errors.emptyField(let description){
                        print(description)
                        showAlert(message: description)
                    }catch{
                        //some other error
                    }
                case .orkin:
                    do{
                        let orkin=try Vendor(entrantMainType, vendorType: .orkin, dateOfBirth: dateOfBirthField.text!, dateOfVisit: dateOfBirthField.text!, firstName: firstNameField.text!, lastName: lastNameField.text!)
                        pass=Pass(vendor: orkin, employee: nil, guest: nil)
                        sendPassToViewController(pass)
                    }catch Errors.emptyField(let description){
                        print(description)
                        showAlert(message: description)
                    }catch{
                        //some other error
                    }
                case .nwelectrical:
                    do{
                        let nwelectrical=try Vendor(entrantMainType, vendorType: .nwelectrical, dateOfBirth: dateOfBirthField.text!, dateOfVisit: dateOfBirthField.text!, firstName: firstNameField.text!, lastName: lastNameField.text!)
                        pass=Pass(vendor: nwelectrical, employee: nil, guest: nil)
                        sendPassToViewController(pass)
                    }catch Errors.emptyField(let description){
                        print(description)
                        showAlert(message: description)
                    }catch{
                        //some other error
                    }
                }
            }else{
                print("Select an item from sub menu")
                showAlert(message: "Select an item from sub menu")
            }
        }else{
            print("Select an item from main menu")
            showAlert(message: "Select an item from main menu")
        }
    }
    @IBAction func populateDataButton(_ sender: UIButton) {
        if entrantMainType != nil{
                if entrantSubType != nil, let entrantSubType=entrantSubType{
                    switch entrantSubType{
                    case .classic:
                        dateOfBirthField.text = ""
                        dateOfVisitField.text = ""
                        ssnField.text = ""
                        firstNameField.text = ""
                        lastNameField.text = ""
                        companyField.text = ""
                        streetAddressField.text = ""
                        cityField.text = ""
                        stateField.text = ""
                        zipCodeField.text = ""
                    case .minor:
                        dateOfBirthField.text = "2014/01/20"
                        dateOfVisitField.text = ""
                        ssnField.text = ""
                        firstNameField.text = ""
                        lastNameField.text = ""
                        companyField.text = ""
                        streetAddressField.text = ""
                        cityField.text = ""
                        stateField.text = ""
                        zipCodeField.text = ""
                    case .season:
                        dateOfBirthField.text = "2000/03/20"
                        dateOfVisitField.text = ""
                        ssnField.text = ""
                        firstNameField.text = "Samantha"
                        lastNameField.text = "Paterson"
                        companyField.text = ""
                        streetAddressField.text = "120 M St"
                        cityField.text = "Waterloo"
                        stateField.text = "IA"
                        zipCodeField.text = "88300"
                    case .senior:
                        dateOfBirthField.text = "1960/05/30"
                        dateOfVisitField.text = ""
                        ssnField.text = ""
                        firstNameField.text = "John"
                        lastNameField.text = "Smith"
                        companyField.text = ""
                        streetAddressField.text = ""
                        cityField.text = ""
                        stateField.text = ""
                        zipCodeField.text = ""
                    case .vip:
                        dateOfBirthField.text = ""
                        dateOfVisitField.text = ""
                        ssnField.text = ""
                        firstNameField.text = ""
                        lastNameField.text = ""
                        companyField.text = ""
                        streetAddressField.text = ""
                        cityField.text = ""
                        stateField.text = ""
                        zipCodeField.text = ""
                    case .foodServiceEmployee:
                        dateOfBirthField.text = "2003/11/30"
                        dateOfVisitField.text = ""
                        ssnField.text = "339-22-2346"
                        firstNameField.text = "Jim"
                        lastNameField.text = "Johnson"
                        companyField.text = ""
                        streetAddressField.text = "3993 K Dr"
                        cityField.text = "Kansas"
                        stateField.text = "Kansas"
                        zipCodeField.text = "49983"
                    case .rideServiceEmployee:
                        dateOfBirthField.text = "1995/10/21"
                        dateOfVisitField.text = ""
                        ssnField.text = "883-39-9887"
                        firstNameField.text = "Kay"
                        lastNameField.text = "Chang"
                        companyField.text = ""
                        streetAddressField.text = "12 Liberty Blvd"
                        cityField.text = "New York"
                        stateField.text = "NY"
                        zipCodeField.text = "87739"
                    case .maintenanceEmployee:
                        dateOfBirthField.text = "1985/04/15"
                        dateOfVisitField.text = ""
                        ssnField.text = "988-22-4567"
                        firstNameField.text = "Pat"
                        lastNameField.text = "Roberson"
                        companyField.text = ""
                        streetAddressField.text = "998 Green Rd"
                        cityField.text = "Newtown"
                        stateField.text = "AR"
                        zipCodeField.text = "88763"
                    case .shiftManager:
                        dateOfBirthField.text = "1990/08/13"
                        dateOfVisitField.text = ""
                        ssnField.text = "445-33-3368"
                        firstNameField.text = "Katy"
                        lastNameField.text = "Williams"
                        companyField.text = ""
                        streetAddressField.text = "102 Simpsom Rd"
                        cityField.text = "Amityville"
                        stateField.text = "NY"
                        zipCodeField.text = "11009"
                    case .generalManager:
                        dateOfBirthField.text = "1996/09/10"
                        dateOfVisitField.text = ""
                        ssnField.text = "448-57-3456"
                        firstNameField.text = "Tom"
                        lastNameField.text = "Miller"
                        companyField.text = ""
                        streetAddressField.text = "881 Anderson St"
                        cityField.text = "Holbrook"
                        stateField.text = "NY"
                        zipCodeField.text = "11791"
                    case .seniorManager:
                        dateOfBirthField.text = "193/03/21"
                        dateOfVisitField.text = ""
                        ssnField.text = "865-35-7653"
                        firstNameField.text = "Michelle"
                        lastNameField.text = "Brown"
                        companyField.text = ""
                        streetAddressField.text = "82 West Glenlake Avenue"
                        cityField.text = "Lagrange"
                        stateField.text = "GA"
                        zipCodeField.text = "30240"
                    case .contract1001:
                        dateOfBirthField.text = "2000/12/23"
                        dateOfVisitField.text = ""
                        ssnField.text = "446-32-9876"
                        firstNameField.text = "Charles"
                        lastNameField.text = "Davis"
                        companyField.text = ""
                        streetAddressField.text = "8671 North Heritage St"
                        cityField.text = "Huntington"
                        stateField.text = "NY"
                        zipCodeField.text = "11743"
                    case .contract1002:
                        dateOfBirthField.text = "1982/06/21"
                        dateOfVisitField.text = ""
                        ssnField.text = "345-22-0985"
                        firstNameField.text = "Joseph"
                        lastNameField.text = "Jones"
                        companyField.text = ""
                        streetAddressField.text = "123 Charles Blvd"
                        cityField.text = "Small Village Twn"
                        stateField.text = "MS"
                        zipCodeField.text = "43323"
                    case .contract1003:
                        dateOfBirthField.text = "1997/10/25"
                        dateOfVisitField.text = ""
                        ssnField.text = "567-33-5433"
                        firstNameField.text = "Henry"
                        lastNameField.text = "Wilson"
                        companyField.text = ""
                        streetAddressField.text = "19 Brookside Dr"
                        cityField.text = "Kalispell"
                        stateField.text = "MT"
                        zipCodeField.text = "59901"
                    case .contract2001:
                        dateOfBirthField.text = "2001/02/23"
                        dateOfVisitField.text = ""
                        ssnField.text = "566-54-4433"
                        firstNameField.text = "George"
                        lastNameField.text = "Moore"
                        companyField.text = ""
                        streetAddressField.text = "899 Homestead St"
                        cityField.text = "Amityville"
                        stateField.text = "NY"
                        zipCodeField.text = "11701"
                    case .contract2002:
                        dateOfBirthField.text = "1994/07/01"
                        dateOfVisitField.text = ""
                        ssnField.text = "382-87-2233"
                        firstNameField.text = "Olivia"
                        lastNameField.text = "Carter"
                        companyField.text = ""
                        streetAddressField.text = "4165 Counts Lane"
                        cityField.text = "Cincinnati"
                        stateField.text = "KY"
                        zipCodeField.text = "45203"
                    case .acme:
                        dateOfBirthField.text = "1992/10/12"
                        dateOfVisitField.text = "2017/06/12"
                        ssnField.text = ""
                        firstNameField.text = "Ema"
                        lastNameField.text = "Perez"
                        companyField.text = "Acme"
                        streetAddressField.text = ""
                        cityField.text = ""
                        stateField.text = ""
                        zipCodeField.text = ""
                    case .orkin:
                        dateOfBirthField.text = "1994/09/30"
                        dateOfVisitField.text = "2018/10/12"
                        ssnField.text = ""
                        firstNameField.text = "Sophia"
                        lastNameField.text = "Foster"
                        companyField.text = "Orkin"
                        streetAddressField.text = ""
                        cityField.text = ""
                        stateField.text = ""
                        zipCodeField.text = ""
                    case .fedex:
                        dateOfBirthField.text = "2004/11/23"
                        dateOfVisitField.text = "2018/09/12"
                        ssnField.text = ""
                        firstNameField.text = "Isabella"
                        lastNameField.text = "Gonzales"
                        companyField.text = "FedEx"
                        streetAddressField.text = ""
                        cityField.text = ""
                        stateField.text = ""
                        zipCodeField.text = ""
                    case .nwelectrical:
                        dateOfBirthField.text = "2006/06/29"
                        dateOfVisitField.text = "2018/01/20"
                        ssnField.text = ""
                        firstNameField.text = "Charlotte"
                        lastNameField.text = "Taylor"
                        companyField.text = "New Electrical"
                        streetAddressField.text = ""
                        cityField.text = ""
                        stateField.text = ""
                        zipCodeField.text = ""
                    }
                }else{
                    print("Select an item from sub menu")
                    showAlert(message: "Select an item from sub menu")
                }
        }else{
            print("Select an item from main menu")
            showAlert(message: "Select an item from main menu")
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Tests()
        
        //Display Guest Sub Menu as default
        if entrantMainType == nil{
            guestButton.setTitleColor(.gray, for: .normal)
            employeeButton.setTitleColor(.gray, for: .normal)
            managerButton.setTitleColor(.gray, for: .normal)
            contractButton.setTitleColor(.gray, for: .normal)
            vendorButton.setTitleColor(.gray, for: .normal)
            
            guestSubMenu.isHidden=false
            employeeSubMenu.isHidden=true
            managerSubMenu.isHidden=true
            contractSubMenu.isHidden=true
            vendorSubMenu.isHidden=true

            minorGuestButton.setTitleColor(.gray, for: .normal)
            classicGuestButton.setTitleColor(.gray, for: .normal)
            vipGuestButton.setTitleColor(.gray, for: .normal)
            seniorGuestButton.setTitleColor(.gray, for: .normal)
            seasonGuestButton.setTitleColor(.gray, for: .normal)
            
            dateOfBirthField.backgroundColor = .gray
            dateOfVisitField.backgroundColor = .gray
            ssnField.backgroundColor = .gray
            firstNameField.backgroundColor = .gray
            lastNameField.backgroundColor = .gray
            companyField.backgroundColor = .gray
            streetAddressField.backgroundColor = .gray
            stateField.backgroundColor = .gray
            cityField.backgroundColor = .gray
            zipCodeField.backgroundColor = .gray
        }
    }
    
    func showAlert(message:String){
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func sendPassToViewController(_ pass:Pass?){
        if let passViewController = self.storyboard?.instantiateViewController(withIdentifier: "passViewController") as? PassViewController{
            passViewController.pass = pass
            //Show viewController
            self.present(passViewController, animated: true, completion: nil)
        }
    }
    
    func resetSubTypeButtons(){
        minorGuestButton.setTitleColor(.gray, for: .normal)
        classicGuestButton.setTitleColor(.gray, for: .normal)
        vipGuestButton.setTitleColor(.gray, for: .normal)
        seniorGuestButton.setTitleColor(.gray, for: .normal)
        seasonGuestButton.setTitleColor(.gray, for: .normal)
        
        foodServiceButton.setTitleColor(.gray, for: .normal)
        rideServiceButton.setTitleColor(.gray, for: .normal)
        maintenanceEmployeeButton.setTitleColor(.gray, for: .normal)
        
        shiftManagerButton.setTitleColor(.gray, for: .normal)
        generalManagerButton.setTitleColor(.gray, for: .normal)
        seniorManagerButton.setTitleColor(.gray, for: .normal)
        
        project1001Button.setTitleColor(.gray, for: .normal)
        project1002Button.setTitleColor(.gray, for: .normal)
        project1003Button.setTitleColor(.gray, for: .normal)
        project2001Button.setTitleColor(.gray, for: .normal)
        project2002Button.setTitleColor(.gray, for: .normal)
        
        acmeButton.setTitleColor(.gray, for: .normal)
        orkinButton.setTitleColor(.gray, for: .normal)
        fedexButton.setTitleColor(.gray, for: .normal)
        nwelectricalButton.setTitleColor(.gray, for: .normal)
    }
    
    func resetFormFields(){
        dateOfBirthField.text = ""
        dateOfVisitField.text = ""
        ssnField.text = ""
        firstNameField.text = ""
        lastNameField.text = ""
        companyField.text = ""
        streetAddressField.text = ""
        cityField.text = ""
        stateField.text = ""
        zipCodeField.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}





