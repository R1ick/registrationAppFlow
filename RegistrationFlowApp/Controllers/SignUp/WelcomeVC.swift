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
//
//    let emailKey = "emailKey"
//    let passKey = "passKey"
//    let userNameKey = "userNameKey"

    var emails = [String]()
    var passwords = [String]()
    var names = [String?]()
    var users = [User]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        updateData(with: email, password: pass, and: name)
//        print("WelcomeVC email: \(email), password: \(pass), name (optional): \(name)")
    }
    
    @IBAction func signInTapped(_ sender: UIButton) {
        saveData()
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func saveData() {
        setUserToUD(email: email, password: pass, name: name)
//        ud.set(email, forKey: emailKey)
//        ud.set(pass, forKey: passKey)
//        ud.set(name, forKey: userNameKey)
    }
    
    func loadData() {
        
        print(users)
//        email = ud.string(forKey: emailKey) ?? "fail"
//        pass = ud.string(forKey: passKey) ?? "fail"
//        name = ud.string(forKey: userNameKey) ?? "fail"
    }
    
    private func updateData(with email: String, password pass: String, and name: String?) {
//        self.email = email
//        self.pass = pass
//        self.name = name
    }
    
    private func setUserToUD(email: String, password: String, name: String?) {
        emails.append(email)
        passwords.append(password)
        names.append(name ?? "")
        
        ud.set(emails, forKey: "em")
        ud.set(passwords, forKey: "pas")
        ud.set(names, forKey: "nam")
    }
    
    func getUsersFromUD(users: inout [User]) -> [User] {
        let emails = ud.array(forKey: "em")
        let passwords = ud.array(forKey: "pas")
        let names = ud.array(forKey: "nam")
        
        for i in 0...emails!.count - 1 {
            let email = emails?[i]
            let password = passwords?[i]
            let name = names?[i]
            let user = User(email: email as! String, password: password as! String, name: name as? String)
            users.append(user)
        }
        return users
    }
}
