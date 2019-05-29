//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    
    let questions = QuestionBank()
    
    var currentQuestionIndex: Int! = 0
    var correctAnswers = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionLabel.text = questions.list[currentQuestionIndex].questionText
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        let userAnswer = sender.tag == 1 ? true : false
        
        checkAnswer(userAnswer)
        currentQuestionIndex += 1
       
        nextQuestion()
        updateUI()
    }
    
    
    func updateUI() {
//        progressBar
    }
    

    func nextQuestion() {
        if currentQuestionIndex < questions.list.count {
            questionLabel.text = questions.list[currentQuestionIndex].questionText
        } else {
            let alert = UIAlertController(title: "Awesome", message: "You've finished all of the questions, would you like to start over?", preferredStyle: .alert)
         
            let restartAction = UIAlertAction(title:"Restart", style: .default, handler:
            { (UIAlertAction) in
                self.startOver()})
            
            alert.addAction(restartAction)
            
            present(alert, animated:true, completion: nil)
            
        }
    }
    
    
    func checkAnswer(_ userAnswer: Bool) {
        let question = questions.list[currentQuestionIndex]
        if userAnswer == question.answer {
            print("Correct")
        } else {
            print("Incorrect")
        }
    }
    
    func startOver() {
        currentQuestionIndex = 0
        nextQuestion()
    }
}
