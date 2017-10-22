//
//  ViewController.swift
//  Volunteer Connect
//
//  Created by Herman Saini on 10/21/17.
//  Copyright © 2017 Herman Saini. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    public var email:String = "";
    public let password:String = "test123";
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor.orange;
    }
    


    @IBOutlet weak var emailBox: UITextField!
    @IBOutlet weak var passwordBox: UITextField!
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.emailBox.resignFirstResponder()
        self.passwordBox.resignFirstResponder()
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func signInButton(_ sender: UIButton) {
//        email = emailBox.text!;
//            if(passwordBox.text == "test123"){
//                performSegue(withIdentifier: "mapScreen", sender: self)
//            }
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        
        
        Auth.auth().signIn(withEmail: emailBox.text!, password: passwordBox.text!)
        
        Auth.auth().addStateDidChangeListener() { auth, user in
            // 2
            if user != nil {
                // 3
                self.performSegue(withIdentifier: "mapScreen", sender: nil)
            }
        }
    
    }
    
//    @IBAction func signInButton(_ sender: UIButton) {
//        email = emailBox.text!;
//        if(passwordBox.text == "test123"){
//            performSegue(withIdentifier: "mapScreen", sender: self)
//        }
//        
//    }
}

