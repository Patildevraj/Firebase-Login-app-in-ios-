//
//  SignUpViewController.swift
//  LoginApp
//
//  Created by Kibbcom on 31/05/24.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {

    @IBOutlet weak var signUpField: UITextField!
    @IBOutlet weak var signUpPassField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signUpclicked(_ sender: Any) {
        guard let email = signUpField.text else { return }
        guard let password = signUpPassField.text else { return }
        
        Auth.auth().createUser(withEmail: email, password: password) { firebaseResult, error in
            if let error = error {
                print("error - \(error.localizedDescription)")
            }
            else {
                self.performSegue(withIdentifier: "MyValidLoginOrSignUP", sender: self)
            }
        }
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
