//
//  QuestionViewController.swift
//  
//
//  Created by Annemarie Ketola on 9/2/15.
//
//

import UIKit

class QuestionViewController: UIViewController {

  @IBOutlet weak var qLabel: UILabel!
  @IBOutlet weak var questionLabel: UILabel!
  
  var questionVariable = String()
  
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
  @IBAction func homeButtonPressed(sender: AnyObject) {
  }

}
