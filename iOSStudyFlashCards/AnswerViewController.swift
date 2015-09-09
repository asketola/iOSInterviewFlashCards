//
//  AnswerViewController.swift
//  
//
//  Created by Annemarie Ketola on 9/2/15.
//
//

import UIKit
import Parse

class AnswerViewController: UIViewController {

  @IBOutlet weak var aLabel: UILabel!
  @IBOutlet weak var answerScrollView: UIScrollView!
  @IBOutlet weak var answerLabel: UILabel!
  
  var answerVariable = String()
  var questionVariable = String()
  var originalQuestion = String()
  var maxValue = UInt32()
  
    override func viewDidLoad() {
        super.viewDidLoad()
      
      var rightSwipe = UISwipeGestureRecognizer(target: self, action: Selector("handleSwipes:"))
      var upSwipe = UISwipeGestureRecognizer(target: self, action: Selector("handleSwipes:"))
      
      rightSwipe.direction = .Right
      upSwipe.direction = .Up
      
      view.addGestureRecognizer(rightSwipe)
      view.addGestureRecognizer(upSwipe)
      
      answerLabel.text = answerVariable
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
  func handleSwipes(sender:UISwipeGestureRecognizer) {
    if (sender.direction == .Right){
      performSegueWithIdentifier("SHOW_QUESTION_AGAIN", sender: self)
      // show old question
    }
    if (sender.direction == .Up){
      performSegueWithIdentifier("SHOW_NEW_QUESTION", sender: self)
      // get a new question
    }
  }
  

  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "SHOW_QUESTION_AGAIN" {
      if let destinationVC = segue.destinationViewController as? QuestionViewController{
        destinationVC.originalQuestion = self.originalQuestion
        destinationVC.questionVariable = self.questionVariable
        destinationVC.answer = self.answerVariable
      }
    }
    if segue.identifier == "SHOW_NEW_QUESTION" {
      if let destinationVC = segue.destinationViewController as? QuestionViewController {
        destinationVC.questionVariable = self.questionVariable
        destinationVC.maxValue = self.maxValue
      }
    }
  }

}
