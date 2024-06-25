//
//  LoginViewController.swift
//  LoginApp
//
//  Created by Kibbcom on 31/05/24.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var loginPassField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginClicked(_ sender: Any) {
        guard let loginEmail = loginField.text else { return }
        guard let loginPassword = loginPassField.text else { return }
        
        Auth.auth().signIn(withEmail: loginEmail, password: loginPassword) { firebaseResult, error in
            if let error = error {
                print("error while logging- \(error.localizedDescription)")
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
