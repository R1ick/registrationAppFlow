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
    
    var email = "test"
    var pass = "test"
    var name: String? = ""

    let emailKey = "emailKey"
    let passKey = "passKey"
    let userNameKey = "userNameKey"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateData(with: email, password: pass, and: name)
        print("WelcomeVC email: \(email), password: \(pass), name (optional): \(name)")
    }
    
    @IBAction func signInTapped(_ sender: UIButton) {
        saveData()
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func saveData() {
        print("SAVED")
        ud.set(email, forKey: emailKey)
        ud.set(pass, forKey: passKey)
        ud.set(name, forKey: userNameKey)
    }
    
    func loadData() {
        print("LOAD")
        email = ud.string(forKey: emailKey) ?? "fail"
        pass = ud.string(forKey: passKey) ?? "fail"
        name = ud.string(forKey: userNameKey) ?? "fail"
    }
    
    private func updateData(with email: String, password pass: String, and name: String?) {
        self.email = email
        self.pass = pass
        self.name = name
    }
}
