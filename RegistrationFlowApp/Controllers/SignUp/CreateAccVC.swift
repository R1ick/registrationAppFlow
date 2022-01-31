//
//  CreateAccVC.swift
//  RegistrationFlowApp
//
//  Created by Ярослав Антонович on 29.01.2022.
//

import UIKit

class CreateAccVC: UIViewController, UIResponder {
   
    @IBOutlet weak var emailErrorLabel: UILabel!
    @IBOutlet weak var userNameLabel: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var confirmPasswTF: UITextField!
    @IBOutlet weak var confirmPassError: UILabel!
    @IBOutlet weak var signUpButton: UIButton! {
        didSet {
            signUpButton.layer.cornerRadius = 15
            signUpButton.isEnabled = false
        }
    }
    
    @IBOutlet weak var redPassView: UIView!
    @IBOutlet weak var yellowPassView: UIView!
    @IBOutlet weak var greenPassView: UIView!
    @IBOutlet weak var purplePassView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    var email = "email"
    var pass = "pass"
    
    @IBAction func didEditingEmailTF(_ sender: Any) {
        getResult(from: emailTF, with: emailErrorLabel, case: .email)
        isEnabledButton()
    }
    
    @IBAction func didEditingPasswordTF(_ sender: Any) {
        getResult(from: passwordTF, with: nil, case: .password)
        isEnabledButton()
    }
    
    @IBAction func didEditingConfPasswordTF(_ sender: Any) {
        getResult(from: passwordTF, with: confirmPassError, case: .confPassword)
        isEnabledButton()
    }
    
    @IBAction func signUpTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "SignUpStoryboard", bundle: nil)
        guard let next = storyboard.instantiateViewController(withIdentifier: "codeVC") as? CodeVerifyVC else { return }
        next.email = self.email
        next.pass  = self.pass
        
        show(next, sender: nil)
    }
    
    func keyboardWillShowNotification(_ notification) {
        
    }
    
    fileprivate func isEnabledButton() {
        if emailErrorLabel.isHidden, confirmPassError.isHidden {
            if (passwordTF.text != "" && confirmPasswTF.text != ""), (passwordTF.text == confirmPasswTF.text) {
                signUpButton.isEnabled = true
                self.email = emailTF.text!
                self.pass = passwordTF.text!
            } else {
                signUpButton.isEnabled = false
            }
        }
    }
    
    fileprivate func getResult(from textField: UITextField, with errorLabel: UILabel?, case someCase: TypeTF) {
        guard let text = textField.text else { return }
        switch someCase {
        case .email:
            if VerificationService.isValidEmail(email: text) {
                errorLabel?.isHidden = true
            } else {
                errorLabel?.isHidden = false
            }
        case .password:
            let result = VerificationService.isValidPassword(pass: text)
            switch result {
            case .veryWeak:
                self.redPassView.alpha = 0.1
                self.yellowPassView.alpha = 0.1
                self.greenPassView.alpha = 0.1
                self.purplePassView.alpha = 0.1
            case .weak:
                self.redPassView.alpha = 1
                self.yellowPassView.alpha = 0.1
                self.greenPassView.alpha = 0.1
                self.purplePassView.alpha = 0.1
            case .notVeryWeak:
                self.redPassView.alpha = 1
                self.yellowPassView.alpha = 1
                self.greenPassView.alpha = 0.1
                self.purplePassView.alpha = 0.1
            case .notVeryStrong:
                self.redPassView.alpha = 1
                self.yellowPassView.alpha = 1
                self.greenPassView.alpha = 1
                self.purplePassView.alpha = 0.1
            case .strong:
                self.redPassView.alpha = 1
                self.yellowPassView.alpha = 1
                self.greenPassView.alpha = 1
                self.purplePassView.alpha = 1
            }
        case .confPassword:
            guard let confPass = confirmPasswTF.text else { return }
            if VerificationService.isPassCofirm(pass1: text, pass2: confPass) {
                confirmPassError.isHidden = true
            } else {
                confirmPassError.isHidden = false
            }
        }
    }
}

extension CreateAccVC {
    
    enum TypeTF {
        case email
        case password
        case confPassword
    }
    
}
