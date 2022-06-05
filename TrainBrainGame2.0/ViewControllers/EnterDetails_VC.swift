//
//  EnterDetails_VCViewController.swift
//  TrainBrainGame2.0
//
//  Created by Steven Caridi on 10/3/22.
//

import UIKit

class EnterDetails_VC: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextfield: UITextField!

    let service = DataService.shared

    override func viewDidLoad() {
        super.viewDidLoad()

        nameTextField.text = UserDefaults.standard.string(forKey: "NameKey")
        ageTextfield.text = UserDefaults.standard.string(forKey: "AgeKey")
    }
 
    @IBAction func continueTapped(_ sender: Any) {
        UserDefaults.standard.set(nameTextField.text, forKey: "NameKey")
        UserDefaults.standard.set(ageTextfield.text, forKey: "AgeKey")
    }
}
