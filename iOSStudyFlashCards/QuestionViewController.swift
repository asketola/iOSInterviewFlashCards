//
//  QuestionViewController.swift
//  
//
//  Created by Annemarie Ketola on 9/2/15.
//
//

import UIKit
import Parse

class QuestionViewController: UIViewController {

  @IBOutlet weak var qLabel: UILabel!
  @IBOutlet weak var questionLabel: UILabel!
  
  var questionVariable = String()
  var questionObject1: PFObject?
  var answer = String()
  var originalQuestion : String?
  var maxValue = UInt32()
  
    override func viewDidLoad() {
        super.viewDidLoad()
      
      var leftSwipe = UISwipeGestureRecognizer(target: self, action: Selector("handleSwipes:"))
      var upSwipe = UISwipeGestureRecognizer(target: self, action: Selector("handleSwipes:"))
      
      leftSwipe.direction = .Left
      upSwipe.direction = .Up
      
      view.addGestureRecognizer(leftSwipe)
      view.addGestureRecognizer(upSwipe)
      
      if originalQuestion != nil {
        questionLabel.text = originalQuestion
      } else {
        getAQuestion()
      }
      
    } // close viewDidLoad

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
  func handleSwipes(sender:UISwipeGestureRecognizer) {
    if (sender.direction == .Left){
      performSegueWithIdentifier("SHOW_ANSWER", sender: self)
      
    }
    if (sender.direction == .Up){
      getAQuestion()
    }
  }
  
  func getAQuestion() {
    var questionNumber: Int = Int(arc4random_uniform(maxValue) + 1)
    println(questionNumber)
  
    var query = PFQuery(className: questionVariable)
    query.whereKey("questionNumber", equalTo: questionNumber)
    query.findObjectsInBackgroundWithBlock { (questionObjects: [AnyObject]?, error: NSError?) -> Void in
      if error == nil {
        if let questionObjects = questionObjects as? [PFObject] {
          for questionObject in questionObjects {
            self.questionObject1 = questionObject
            var question: AnyObject? = questionObject["question"]
            var answer1:  AnyObject? = questionObject["answer"]
            self.answer = (answer1 as? String)!
            self.originalQuestion = (question as? String)!
            //              println("\(question)")
            //              println("\(self.answer)")
            self.questionLabel.text = question as? String
            }
        }
      } else {
        println("Error")
        self.questionLabel.text  = "Question Loading Error"
      }
    }
  }
  

  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "SHOW_ANSWER" {
      if let destinationVC = segue.destinationViewController as? AnswerViewController{
        destinationVC.answerVariable = self.answer
        destinationVC.questionVariable = self.questionVariable
        destinationVC.originalQuestion = self.originalQuestion!
        destinationVC.maxValue = self.maxValue
      }
    }
  }

  @IBAction func homeButtonPressed(sender: AnyObject) {
  }

}
