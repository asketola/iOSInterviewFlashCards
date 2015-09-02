//
//  ViewController.swift
//  iOSStudyFlashCards
//
//  Created by Annemarie Ketola on 9/1/15.
//  Copyright (c) 2015 Up Early, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var headerLabel: UILabel!
  @IBOutlet weak var pickTopicLabel: UILabel!
  
  var typeOfQuestion = String()

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  

  @IBAction func swiftTopicsButtonPressed(sender: AnyObject) {
    typeOfQuestion = "swiftTopic"
    performSegueWithIdentifier("SHOW_QUESTION", sender: self)
  }
  
  @IBAction func objCTopicsButtonPressed(sender: AnyObject) {
    typeOfQuestion = "objCTopic"
    performSegueWithIdentifier("SHOW_QUESTION", sender: self)
  }
  

  @IBAction func generaliOSTopicsButtonPressed(sender: AnyObject) {
    typeOfQuestion = "generaliOSTopic"
    performSegueWithIdentifier("SHOW_QUESTION", sender: self)
  }
  
  @IBAction func randomQuestionsButtonPressed(sender: AnyObject) {
    typeOfQuestion = "randomQuestion"
    performSegueWithIdentifier("SHOW_QUESTION", sender: self)
  }
  
  @IBAction func objCCodingProblemsButtonPressed(sender: AnyObject) {
    typeOfQuestion = "objCCodingProblem"
    performSegueWithIdentifier("SHOW_QUESTION", sender: self)
  }
  
  @IBAction func swiftCodingProblemsButtonPressed(sender: AnyObject) {
    typeOfQuestion = "swiftCodingProblem"
    performSegueWithIdentifier("SHOW_QUESTION", sender: self)
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "SHOW_QUESTION" {
      if let destinationVC = segue.destinationViewController as? QuestionViewController{
        destinationVC.questionVariable = typeOfQuestion
      }
    }
  }


}

