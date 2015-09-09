//
//  ViewController.swift
//  iOSStudyFlashCards
//
//  Created by Annemarie Ketola on 9/1/15.
//  Copyright (c) 2015 Up Early, LLC. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {
  
  @IBOutlet weak var headerLabel: UILabel!
  @IBOutlet weak var pickTopicLabel: UILabel!
  
  var typeOfQuestion = String()
  var maxValue = UInt32()

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  

  @IBAction func swiftTopicsButtonPressed(sender: AnyObject) {
    typeOfQuestion = "SwiftTopics"
    maxValue = 9
    performSegueWithIdentifier("SHOW_QUESTION", sender: self)
  }
  
  @IBAction func objCTopicsButtonPressed(sender: AnyObject) {
    typeOfQuestion = "ObjCTopics"
    maxValue = 36
    performSegueWithIdentifier("SHOW_QUESTION", sender: self)
  }
  
  @IBAction func generaliOSTopicsButtonPressed(sender: AnyObject) {
    typeOfQuestion = "GeneraliOSTopics"
    maxValue = 51
    performSegueWithIdentifier("SHOW_QUESTION", sender: self)
  }
  
  @IBAction func randomQuestionsButtonPressed(sender: AnyObject) {
    typeOfQuestion = "SwiftVsObjCs"
    maxValue = 8
    performSegueWithIdentifier("SHOW_QUESTION", sender: self)
  }
  
  @IBAction func objCCodingProblemsButtonPressed(sender: AnyObject) {
    typeOfQuestion = "ObjCCodingProblems"
    maxValue = 1
    performSegueWithIdentifier("SHOW_QUESTION", sender: self)
  }
  
  @IBAction func swiftCodingProblemsButtonPressed(sender: AnyObject) {
    typeOfQuestion = "SwiftCodingProblems"
    maxValue = 75
    performSegueWithIdentifier("SHOW_QUESTION", sender: self)
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "SHOW_QUESTION" {
      if let destinationVC = segue.destinationViewController as? QuestionViewController{
        destinationVC.questionVariable = typeOfQuestion
        destinationVC.maxValue = maxValue
      }
    }
  }


}

