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
    
    var email = ""
    var password = ""
    var userName: String? = ""
    var counter = 0
    var users = [User]()
    
    override func viewWillAppear(_ animated: Bool) {
        let welcomeVC = WelcomeVC()
        if counter > 0 {
            welcomeVC.getUsersFromUD(users: &users)
            print(users)
        }
        email = welcomeVC.email
        password = welcomeVC.pass
        userName = welcomeVC.name
        print("SIGNINVC email: \(email), password: \(password), userName: \(userName)")
    }

    @IBAction func emailDidEditing(_ sender: Any) {
        guard let text = emailTextField.text else { return }
        if !VerificationService.isValidEmail(email: text) {
            emailErrorLabel.text = "Incorrect email or password"
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
        for user in users {
            if user.email == emailTextField.text,
               user.password == passwordTextField.text {
                self.userName = user.name
            }
        }
        if counter > 0 {
            emailErrorLabel.isHidden = true
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            guard let mainVC = storyboard.instantiateViewController(withIdentifier: "main") as? MainVC else { return }
            mainVC.welcome = "Welcome \(self.userName ?? "fail load name")"
            self.navigationController?.pushViewController(mainVC, animated: true)
        } else {
            emailErrorLabel.isHidden = false
        }
//        if emailTextField.text == self.email && passwordTextField.text == self.password {
//            emailErrorLabel.isHidden = true
//            let storyboard = UIStoryboard(name: "Main", bundle: nil)
//            guard let mainVC = storyboard.instantiateViewController(withIdentifier: "main") as? MainVC else { return }
//            mainVC.welcome = "Welcome \(self.userName ?? "fail load name")"
//            self.navigationController?.pushViewController(mainVC, animated: true)
//        } else {
//            emailErrorLabel.isHidden = false
//        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.counter += 1
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
