//
//  SignInVC.swift
//  RegistrationFlowApp
//
//  Created by Ярослав Антонович on 29.01.2022.
//

import UIKit

class SignInVC: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailErrorLabel: UILabel!
    @IBOutlet weak var passwordErrorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func emailDidEditing(_ sender: Any) {
        guard let text = emailTextField.text else { return }
        if !VerificationService.isValidEmail(email: text) {
            emailErrorLabel.text = "Can't find user"
            emailErrorLabel.isHidden = false
        } else {
            emailErrorLabel.isHidden = true
        }
    }

    @IBAction func passwordDidEditing(_ sender: Any) {
        guard let text = passwordTextField.text else { return }
        if text.count < 8 {
            passwordErrorLabel.isHidden = false
        } else {
            passwordErrorLabel.isHidden = true
        }
    }
    
    @IBAction func signUpTapped(_ sender: Any) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toMain" {
            guard let destination = segue.destination as? MainVC else { return }
            destination.navigationItem.title = "Main"
        } else {
            guard segue.identifier == "toSignUp" else { return }
            guard let destination = segue.destination as? CreateAccVC else { return }
            destination.navigationItem.title = "Create an account"
        }
    }
}
