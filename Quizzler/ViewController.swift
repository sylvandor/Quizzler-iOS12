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
        
        updateUI()
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        let userAnswer = sender.tag == 1 ? true : false
        
        checkAnswer(userAnswer)
       
        nextQuestion()
        updateUI()
    }
    
    
    func updateUI() {
//        progressBar
        
        let question = questions.list[currentQuestionIndex]
        
        questionLabel.text = question.questionText
    }
    

    func nextQuestion() {
        currentQuestionIndex = currentQuestionIndex < questions.list.count - 1 ?  currentQuestionIndex + 1 : 0
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
   
    }
    

    
}
