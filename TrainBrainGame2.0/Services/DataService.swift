//
//  DataService.swift
//  TrainBrainGame2.0
//
//  Created by Steven Caridi on 21/5/2022.
//

import Foundation

class DataService {

    static let shared = DataService()

    var animalQuestions: [AnimalQuestion] = []
    var colorQuestions: [ColorQuestion] = []

    var chosenQuestions: String = ""

    private init() {
        loadQuestions()
    }

    func loadQuestions() {
        guard let url = URL(string: "https://raw.githubusercontent.com/Caremo/TrainBrainGame/main/gamedata.json") else {
            print("URL could not be created.")
            return
        }

        URLSession.shared.dataTask(with: url) { data, reponse, error in
            if let error = error {
                print(error.localizedDescription)
            }

            guard let data = data else {
                print("No data found!!!")
                return
            }

            do {
                let questions = try JSONDecoder().decode(Questions.self, from: data)
                self.animalQuestions = questions.animals
                self.colorQuestions = questions.colors
            } catch {
                print(error.localizedDescription)
            }
        }
        .resume()
    }

}
