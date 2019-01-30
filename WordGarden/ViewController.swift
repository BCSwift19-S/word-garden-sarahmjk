//
//  ViewController.swift
//  WordGarden
//
//  Created by Sarah Minji Kim on 1/29/19.
//  Copyright © 2019 Sarah Minji Kim. All rights reserved.
//Original Copy

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var flowerImage: UIImageView!
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var guessCountLabel: UILabel!
    @IBOutlet weak var guessLetterButton: UIButton!
    @IBOutlet weak var guessedLetterField: UITextField!
    @IBOutlet weak var userGuessLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guessLetterButton.isEnabled = false
        playAgainButton.isHidden = true

    }
    
    func updateUIAAfterGuess() {
        guessedLetterField.resignFirstResponder()
        guessedLetterField.text = ""
    }
    
    @IBAction func pressedLetterFieldChanged(_ sender: UITextField) {
        print("Hey! The guessedLetterFieldChanged!!! ")
    }
    @IBAction func guessedLetterFieldChange (_ sender: UITextField) {
        if let letterGuessed = guessedLetterField.text?.last {
            guessedLetterField.text = "\(letterGuessed)"
             guessedLetterField.isEnabled = true
            
        }else{
//            disable the button if I dont have a single character in the guessedLetterField
        guessLetterButton.isEnabled = false
       
        }
    }
    @IBAction func doneKeyPressed(_ sender: UITextField) {
        updateUIAAfterGuess()
    }
    
    @IBAction func guessLetterButtonPressed(_ sender: UIButton) {
        updateUIAAfterGuess()
    }
    
    @IBAction func playAgainButtonPressed(_ sender: UIButton) {
    }
    
}

