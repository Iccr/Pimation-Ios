//
//  ViewController.swift
//  pimation
//
//  Created by shishir sapkota on 5/19/16.
//  Copyright © 2016 shishir sapkota. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var email: String?
    var password: String?
    var isValidEmail = false
    var isValidPassword = false
    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBAction func submit(sender: AnyObject) {
        //check if the email and password field is preset or not
        
        if let tmpEmail = txtEmail.text{
            if checkValidEmail(tmpEmail){
                isValidEmail = true
            }
        }
        
        if let tmpPassword = txtPassword.text{
            if(tmpPassword.characters.count > 5 && tmpPassword.characters.count<16){
                isValidPassword = true
            }
        }
        
        if(isValidEmail && isValidPassword){
            //submit to the server
            print("submitting to server...")
            txtEmail.text = ""
            txtPassword.text = ""
            isValidPassword = false
            isValidEmail = false
        }
        
    }
    
    @IBAction func forgotpassword(sender: AnyObject) {
        //take to view asking for email id and sent email recover link
    }
    
    @IBAction func signUP(sender: AnyObject) {
        // take to the registration view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func checkValidEmail(testStr:String) -> Bool {
        // println("validate calendar: \(testStr)")
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluateWithObject(testStr)
    }


}

