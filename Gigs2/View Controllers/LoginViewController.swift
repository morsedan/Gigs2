//
//  LoginViewController.swift
//  Gigs2
//
//  Created by morse on 5/30/19.
//  Copyright © 2019 morse. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet var loginTypeSegmentedControl: UISegmentedControl!
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var signInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginTypeChanged(_ sender: Any) {
    }
    
    @IBAction func signInButtonTapped(_ sender: Any) {
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
