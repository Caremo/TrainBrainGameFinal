//
//  ImagesScore_VC.swift
//  TrainBrainGame2.0
//
//  Created by Steven Caridi on 10/3/22.
//

import UIKit

class ImagesScore_VC: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet var imageViews: [UIImageView]!
    let dataService = DataService.shared

    var score: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        score = 0
        scoreLabel.text = "0"

        if dataService.chosenQuestions == "Animals" {
            startGameAnimals()
        } else if dataService.chosenQuestions == "Colors" {
            startGameColors()
        } else {
            fatalError("Something went wrong! Doesnt match Animals or Colors.... \(dataService.chosenQuestions)")
        }

        // customize button visuals
        for button in buttons {
            button.layer.cornerRadius = 10
        }
    }

    // MARK: - Animal Questions
    func startGameAnimals() {
        // get question..
        let firstQuestion = dataService.animalQuestions.randomElement()!
        wordLabel.text = firstQuestion.name.uppercased()
        
        // create possible answers
        var answers = [firstQuestion]
        for _ in 0..<3 {
            answers.append(dataService.animalQuestions.randomElement()!)
        }
        answers.shuffle()
        
        // set animals on buttons
        for index in 0..<answers.count {
            imageViews[index].image = UIImage(named: answers[index].image)
            buttons[index].titleLabel?.text = answers[index].name.uppercased()
        }
    }

    // MARK: - Color Questions
    func startGameColors() {
        // get question..
        let firstQuestion = dataService.colorQuestions.randomElement()!
        wordLabel.text = firstQuestion.name.uppercased()

        // create possible answers
        var answers = [firstQuestion]
        for _ in 0..<3 {
            answers.append(dataService.colorQuestions.randomElement()!)
        }
        answers.shuffle()

        // set colors on buttons
        for index in 0..<answers.count {
            buttons[index].backgroundColor = answers[index].color
            buttons[index].titleLabel?.text = answers[index].name.uppercased()
        }
    }

    // MARK: - Button Actions
    @IBAction func answerTapped(_ sender: UIButton) {
        if sender.titleLabel?.text == wordLabel.text {
            score += 1
            scoreLabel.text = "\(score)"
        } else {
            // here we might want to increase a "wrong" counter.
        }

        if dataService.chosenQuestions == "Animals" {
            startGameAnimals()
        } else if dataService.chosenQuestions == "Colors" {
            startGameColors()
        } else {
            fatalError("Something went wrong! Doesnt match Animals or Colors.")
        }
    }
}
