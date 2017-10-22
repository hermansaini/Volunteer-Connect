//
//  ProfilePage.swift
//  Volunteer Connect
//
//  Created by Herman Saini on 10/21/17.
//  Copyright © 2017 Herman Saini. All rights reserved.
//

import UIKit

class ProfilePage: UIViewController {

    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var profileDesc: UITextView!
    var putEvent = false;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profilePic.image = UIImage(named: "Tommy")
        self.view.backgroundColor = UIColor.orange;
        profileDesc.backgroundColor = UIColor.clear;
        // Do any additional setup after loading the view.
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
