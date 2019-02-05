//
//  ViewController.swift
//  WordGarden
//
//  Created by Sarah Minji Kim on 1/29/19.
//  Copyright © 2019 Sarah Minji Kim. All rights reserved.
//Original Copy

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var flowerImageView: UIImageView!
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var guessCountLabel: UILabel!
    @IBOutlet weak var guessLetterButton: UIButton!
    @IBOutlet weak var guessedLetterField: UITextField!
    @IBOutlet weak var userGuessLabel: UILabel!
    
    var wordToGuess = "CODE"
    var lettersGuessed = ""
    
    let maxNumberOfWrongGuesses = 8
    var wrongGuessesRemaining = 8
    var guessCount = 0
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guessLetterButton.isEnabled = false
        playAgainButton.isHidden = true
        formatUserGuessLabel()

    }
    
    func updateUIAAfterGuess() {
        guessedLetterField.resignFirstResponder()
        guessedLetterField.text = ""
    }
    
    @IBAction func pressedLetterFieldChanged(_ sender: UITextField) {
        print("Hey! The guessedLetterFieldChanged!!! ")
    }
    
    func formatUserGuessLabel (){
        var revealedWord = ""
        lettersGuessed += guessedLetterField.text!
        for letter in wordToGuess {
            if lettersGuessed.contains(letter) {
                revealedWord = revealedWord + "\(letter)"
            }else {
                revealedWord += " _"
            }
        }
        revealedWord.removeFirst()
        userGuessLabel.text =  revealedWord
    }
    func guessALetter () {
        formatUserGuessLabel()
        guessCount += 1
        
        //shows the next flower image with one less pedal
        let currentLetterGuessed = guessedLetterField.text!
        if !wordToGuess.contains (currentLetterGuessed) {
            wrongGuessesRemaining = wrongGuessesRemaining - 1
            flowerImageView.image = UIImage(named: "flower\(wrongGuessesRemaining)")
        }

        
        let revealedWord = userGuessLabel.text!
        //stop game
        
        if wrongGuessesRemaining == 0 {
            playAgainButton.isHidden = false
            guessedLetterField.isEnabled = false
            guessLetterButton.isEnabled = false
            guessCountLabel.text = "So Sorry you're all out of guesses. Try Again? "
        }else if !revealedWord.contains("_") {
            // youve won a game
            playAgainButton.isHidden = false
            guessedLetterField.isHidden = false
            guessLetterButton.isEnabled = false
            guessCountLabel.text =  "You've got it! It took you \(guessCount) guesses to guess the word!"
        }else {
        //update guess count
            let guess = (guessCount == 1 ? "Guess":"Guesses")
            guessCountLabel.text = "You've made \(guessCount) \(guess)"
            

            }
        }

    @IBAction func guessedLetterFieldChanged(_ sender: UITextField) {
            if let letterGuessed = guessedLetterField.text?.last {
                guessedLetterField.text = "\(letterGuessed)"
                guessedLetterField.isEnabled = true
                
            }else{
                //            disable the button if I dont have a single character in the guessedLetterField
                guessLetterButton.isEnabled = false
                
            }
        }
    

        

    @IBAction func doneKeyPressed(_ sender: UITextField) {
        guessALetter()
        updateUIAAfterGuess()
    }
    
    @IBAction func guessLetterButtonPressed(_ sender: UIButton) {
        updateUIAAfterGuess()
    }
    
    @IBAction func playAgainButtonPressed(_ sender: UIButton) {
        playAgainButton.isHidden = true
        guessedLetterField.isEnabled = true
        guessLetterButton.isEnabled = false
        flowerImageView.image = UIImage (named: "flower8")
        wrongGuessesRemaining = maxNumberOfWrongGuesses
        lettersGuessed = ""
        formatUserGuessLabel()
        guessCountLabel.text = " You've made 0 Guesses."
        guessCount = 0
    }
    
}

