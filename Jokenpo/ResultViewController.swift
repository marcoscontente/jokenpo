//
//  ResultViewController.swift
//  Jokenpo
//
//  Created by Marcos V G Contente on 19/10/18.
//  Copyright © 2018 marcoscontente. All rights reserved.
//

import UIKit

enum Janken: String {
    case Rock = "Rock"
    case Paper = "Paper"
    case Scissors = "Scissors"
    
    static func getRandomJanken() -> Janken {
        let janken = ["Rock", "Paper", "Scissors"]
        let randomJaken = Int(arc4random_uniform(3))
        return Janken(rawValue: janken[randomJaken])!
    }
}

class ResultViewController: UIViewController {

    @IBOutlet weak var resultImageView: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    
    var playerGame: Janken!
    var machineGame = Janken.getRandomJanken()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayResult()
    }
    
    func displayResult() {
        var image: String?
        var text: String?
        let battle = "\(playerGame.rawValue) vs \(machineGame.rawValue)"
        switch (playerGame, machineGame) {
        case let (player, machine) where player == machine:
            image = "tie"
            text = "\(battle): It's a Tie!"
        case (.Rock, .Scissors), (.Paper, .Rock), (.Scissors, .Paper):
            image = "\(playerGame.rawValue)-\(machineGame.rawValue)"
            text = "\(battle): You Win!"
        default:
            image = "\(machineGame.rawValue)-\(playerGame.rawValue)"
            text = "\(battle): You Lose!"
        }
        
        resultLabel.text = text
        resultImageView.image = UIImage(named: (image?.lowercased())!)
    }
    
    
    @IBAction func playAgain(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
