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

    }
    
    func updateUIAAfterGuess() {
        guessedLetterField.resignFirstResponder()
        guessedLetterField.text = ""
    }
    
    @IBAction func pressedLetterFieldChanged(_ sender: UITextField) {
        print("Hey! The guessedLetterFieldChanged!!! ")
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

