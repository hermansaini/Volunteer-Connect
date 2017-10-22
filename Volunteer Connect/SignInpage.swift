//
//  SignInpage.swift
//  Volunteer Connect
//
//  Created by Herman Saini on 10/21/17.
//  Copyright © 2017 Herman Saini. All rights reserved.
//

import UIKit
import Firebase

class SignInpage: UIViewController {

    @IBOutlet weak var emailBox: UITextField!
    @IBOutlet weak var passwordBox: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.orange;

        // Do any additional setup after loading the view.
    }

    @IBAction func signUpButton(_ sender: UIButton) {
        Auth.auth().createUser(withEmail: emailBox.text!, password: passwordBox.text!) { (user, error) in
            // ...
        }
        performSegue(withIdentifier: "backToSignIn", sender: self)
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
