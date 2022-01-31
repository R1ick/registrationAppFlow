//
//  MainVC.swift
//  RegistrationFlowApp
//
//  Created by Ярослав Антонович on 29.01.2022.
//

import UIKit

class MainVC: UIViewController {

    var welcome = ""
    @IBOutlet weak var welcomeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        welcomeLabel.text = welcome
    }
    
    
}
