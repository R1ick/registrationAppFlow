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
    
    @IBOutlet weak var codeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()


        getRandomCode()
    }
    
    
    @IBAction func didEditingCodeTF(_ sender: UITextField) {
        guard let text = sender.text else { return }
        let storyboard = UIStoryboard(name: "SignUpStoryboard", bundle: nil)
        let nextVC = storyboard.instantiateViewController(withIdentifier: "welcome")
        if String(num) == text {
            show(nextVC, sender: nil)
        }
    }
    
    func getRandomCode() {
        self.codeLabel.text = "'\(num)' Enter the code here"
    }
}
