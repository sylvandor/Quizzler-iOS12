//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let questions = QuestionBank()
    
    var currentQuestionIndex: Int! = 0
    var correctAnswers = 0
    var score: Int = 0
    
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
        if currentQuestionIndex < questions.list.count {
            questionLabel.text = questions.list[currentQuestionIndex].questionText
            scoreLabel.text = "Score: \(score)"
            progressLabel.text = "\(currentQuestionIndex + 1)/\(questions.list.count)"
            
            progressBar.frame.size.width = (view.frame.size.width / CGFloat(questions.list.count)) * CGFloat(currentQuestionIndex + 1)
        } else {
            let alert = UIAlertController(title: "Awesome", message: "You've finished all of the questions, would you like to start over?", preferredStyle: .alert)
            
            let restartAction = UIAlertAction(title:"Restart", style: .default, handler:
            { (UIAlertAction) in
                self.startOver()})
            
            alert.addAction(restartAction)
            
            present(alert, animated:true, completion: nil)
        }
    }

    func nextQuestion() {
        currentQuestionIndex += 1
    }
    
    
    func checkAnswer(_ userAnswer: Bool) {
        let question = questions.list[currentQuestionIndex]
        if userAnswer == question.answer {
            ProgressHUD.showSuccess("Correct")
            score += 1
        } else {
            ProgressHUD.showError("Incorrect")
        }
    }
    
    func startOver() {
        currentQuestionIndex = 0
        score = 0
        updateUI()
    }
}
