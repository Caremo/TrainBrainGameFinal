//
//  ColorQuestion.swift
//  TrainBrainGame2.0
//
//  Created by Steven Caridi on 21/5/2022.
//

import Foundation
import UIKit

struct ColorQuestion: Decodable {
    let name: String
    let value: String

    var color: UIColor {
        return hexStringToUIColor(hex: value)
    }
}
