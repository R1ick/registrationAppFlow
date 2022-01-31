//
//  WelcomeVC.swift
//  RegistrationFlowApp
//
//  Created by Ярослав Антонович on 29.01.2022.
//

import UIKit

final class WelcomeVC: UIViewController {
    
    let ud = UserDefaults.standard
    
    var accData = CreateAccVC()
    
    var email = ""
    var pass = ""

    let emailKey = "emailKey"
    let passKey = "passKey"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signInTapped(_ sender: UIButton) {
        saveData()
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func saveData() {
        
    }
    
    func loadData() {
        
    }
}
