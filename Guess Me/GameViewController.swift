//
//  GameViewController.swift
//  Guess Me
//
//  Created by Patcharapon Joksamut on 15/3/2562 BE.
//  Copyright © 2562 apple. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var answerTextFeild: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var incorrectLabel: UILabel!
    @IBOutlet weak var myHp: UILabel!

    let imageArray = [#imageLiteral(resourceName: "duck"), #imageLiteral(resourceName: "cat"), #imageLiteral(resourceName: "ant"), #imageLiteral(resourceName: "dog"), #imageLiteral(resourceName: "bee")]
    let answerArray = ["duck", "cat", "ant", "dog", "bee"]
    
    var currentIndex = 0
    var hp = 4

    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = imageArray[0]
        answerTextFeild.placeholder = String(repeating: "o", count: answerArray[currentIndex].count)
    }

    @IBAction func didTapSummit(_ sender: Any) {
        let answer = answerArray[currentIndex]
        let userAnswer = answerTextFeild.text!.lowercased()
        if answer == userAnswer {
            correct()
            answerTextFeild.text = ""
        } else {
            answerTextFeild.text = ""
            incorrectLabel.text = "Incorrect: \(userAnswer)!"
            incorrectLabel.isHidden = false
            hp -= 1
            myHp.text = String(repeating: "❤️", count: hp)
            if hp == 0 {
                let alert = UIAlertController(title: "GameOver", message: "You Die!", preferredStyle: .alert)
                let action = UIAlertAction(title: "OKay", style: .default) { (_) in self.dismiss(animated: true, completion: nil) }
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    func correct() {
        incorrectLabel.isHidden = true
        currentIndex += 1
        imageView.image = imageArray[currentIndex%imageArray.count]
        if (currentIndex%5) == 0 {
            let alert = UIAlertController(title: "You win", message: "Good!", preferredStyle: .alert)
            let action = UIAlertAction(title: "OKay", style: .default) { (_) in self.dismiss(animated: true, completion: nil) }
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
}

