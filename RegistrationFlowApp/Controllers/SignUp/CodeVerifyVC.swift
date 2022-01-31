//
//  CodeVerifyVC.swift
//  RegistrationFlowApp
//
//  Created by Ярослав Антонович on 29.01.2022.
//

import UIKit

class CodeVerifyVC: UIViewController {

    lazy var num = Int.random(in: 1000...99999)
    
    var email = ""
    var pass = ""
    var name: String = ""
    
    @IBOutlet weak var codeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getRandomCode()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateData(with: email, and: pass)
        print("CodeVerifyVC email: \(email), password: \(pass)")
    }
    
    
    @IBAction func didEditingCodeTF(_ sender: UITextField) {
        guard let text = sender.text else { return }
        let storyboard = UIStoryboard(name: "SignUpStoryboard", bundle: nil)
        guard let nextVC = storyboard.instantiateViewController(withIdentifier: "welcome") as? WelcomeVC else { return }
        nextVC.email = self.email
        nextVC.pass = self.pass
        nextVC.name = self.name
        if String(num) == text {
            self.navigationController?.pushViewController(nextVC, animated: true)
        }
    }
    
    func getRandomCode() {
        self.codeLabel.text = "'\(num)' Enter the code here"
    }
    
    private func updateData(with email: String, and pass: String) {
        self.email = email
        self.pass = pass
    }
}
