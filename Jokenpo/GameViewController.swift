//
//  GameViewController.swift
//  Jokenpo
//
//  Created by Marcos V G Contente on 19/10/18.
//  Copyright © 2018 marcoscontente. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func playRock(_ sender: UIButton) {
        let controller: ResultViewController
        controller = self.storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
        controller.playerGame = getPlayerJanken(sender)
        present(controller, animated: true, completion: nil)
    }
    
    @IBAction func playPaper(_ sender: UIButton) {
        performSegue(withIdentifier: "play", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "play" {
            let controller = segue.destination as! ResultViewController
            controller.playerGame = getPlayerJanken(sender as! UIButton)
        }
    }
    
    func getPlayerJanken(_ sender: UIButton) -> Janken {
        return Janken(rawValue: sender.title(for: UIControlState())!)!
    }

}

