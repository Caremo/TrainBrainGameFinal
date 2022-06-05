//
//  Instructions_VC.swift
//  TrainBrainGame2.0
//
//  Created by Steven Caridi on 10/3/22.
//

import UIKit

class Instructions_VC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        DataService.shared.chosenQuestions = sender.titleLabel?.text ?? ""
    }

}
