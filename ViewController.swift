//
//  ViewController.swift
//  TextValidation
//
//  Created by Andrew Higbee on 10/1/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var usernameErrorLabel: UILabel!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var submitButtonPress: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        errorLabel.isHidden = true
        usernameErrorLabel.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let username = userNameTextField.text else { return }
        var destination = segue.destination as! ViewController2
        destination.welcomeScreenLabelHolder = "Welcome \(username)"
    }
    
    @IBAction func submitButton(_ sender: UIButton) {
        guard let username = userNameTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        
        var emailSuccess = false
        // let passwordArray = password?.components(separatedBy: "")
        
        //        if isPasswordHasEightCharacter(password: password){
        //            if isPasswordHasNumberAndCharacter(password: password) {
        //                if isPasswordHasNumberAndCharacter(password: password) {
        //                    performSegue(withIdentifier: "passwordSuccess", sender: submitButtonPress)
        //                } else {
        //                    errorLabel.text = "You must have a capital letter and special character in your password."
        //                }
        //            } else {
        //                errorLabel.text = "You must..."
        //            }
        //
        //        } else {
        //            errorLabel.text = "You must have 9 characters or numbers in your password."
        //        }
        
        if isUsernameSucessful(username: username) {
            usernameErrorLabel.isHidden = false
            usernameErrorLabel.text = "Valid email."
            emailSuccess = true
        } else {
            usernameErrorLabel.isHidden = false
            usernameErrorLabel.text = "Please enter a valid email."
        }
        
        if isPasswordSuccessful(password: password) && emailSuccess {
            errorLabel.isHidden = false
            errorLabel.text = "Success"
            performSegue(withIdentifier: "passwordSuccess", sender: submitButtonPress)
        } else {
            errorLabel.isHidden = false
            errorLabel.text = "Please use a minimum of 8 characters, a lowercase letter, a capital letter, a number, and one of these special characters @$#!%*)(?.,+=<>&."
        }
    }
}

func isUsernameSucessful(username: String) -> Bool {
    let usernameRegex = NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
    
    return usernameRegex.evaluate(with: username)
}

func isPasswordSuccessful(password: String) -> Bool {
    let passwordRegex = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!/%*)(?.,+=<>&])(?=.*[0-9])(?=.*[A-Z]).{8,}$")

    return passwordRegex.evaluate(with: password)
}
//
//    func isPasswordSuccess(password: String) -> Bool {
//        let passWordRegEx = "/^.*(?=.{6,})(?=.*[A-Z])(?=.*[a-zA-Z])(?=.*\\d)|(?=.*[!#$%&? ]).*$\""
//        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passWordRegEx)
//        return passwordTest.evaluate(with: password)
//
//    func isPasswordHasEightCharacter(password: String) -> Bool {
//        let passWordRegEx = "^.{8,}$"
//        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passWordRegEx)
//        return passwordTest.evaluate(with: password)
//    }
//
//    func isPasswordHasNumberAndCharacter(password: String) -> Bool {
//        let passRegEx = "(?=[^a-z]*[a-z])[^0-9]*[0-9].*"
//        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passRegEx)
//        return passwordTest.evaluate(with: password)
//    }
//
//    func isPasswordHasNumberAndCharacterSign(password: String) -> Bool {
//        let passWordRegEx = "[a-zA-Z0-9!@#$%^&*]+"
//        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passWordRegEx)
//        return passwordTest.evaluate(with: password)
//    }

