//
//  ForgotScrnController.swift
//  JMarriner Project 1
//
//  Created by admin on 4/29/21.
//

import UIKit

class ForgotScrnController: UIViewController
{

    @IBOutlet weak var Prompt: UILabel!
    @IBOutlet weak var InField: UITextField!
    @IBOutlet weak var confirmB: UIButton!
    
    var userNameGot : Bool!
    var Antworten: String!
    var pass: String!
    var strikes = 0
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        userNameGot = false
    }
    
    @IBAction func confirmation(_ sender: UIButton)
    {
        if userNameGot
        {
            if let field = InField.text, field.isEmpty
            {
                print("Caught an empty text field.")
            }
            else
            {
                var ans = InField.text?.lowercased()
                if ans == Antworten
                {
                    InField.isHidden = true
                    InField.isEnabled = false
                    confirmB.isHidden = true
                    confirmB.isEnabled = false
                    Prompt.text = ("You got it! Your password is " + pass + " \nKeep it secret! Keep it safe!")
                }
                else
                {
                    strikes += 1
                    InField.text = ""
                }
                
                if strikes == 3
                {
                    InField.isHidden = true
                    InField.isEnabled = false
                    Prompt.text = "Failed three attempts!"
                    Prompt.textColor = UIColor.red
                }
            }
        }
        else
        {
            if let field = InField.text, field.isEmpty
            {
                Prompt.text = "Username cannot be blank!"
                Prompt.textColor = UIColor.red
            }
            else
            {
                
                guard let usrIn = InField.text else { print("nil found in InField"); return }
                if !DataHandle.inst.checkUser(user: usrIn)
                {
                    print("No such user found")
                    Prompt.text = "User not found :("
                    Prompt.isHidden = false
                    Prompt.textColor = UIColor.red
                    return
                }
                let credsGot = DataHandle.inst.getCred(User: usrIn)
                
                
                userNameGot = true
                Prompt.text = credsGot.secQ
                Antworten = credsGot.secAnsw?.lowercased()
                pass = credsGot.passW
                InField.text = ""
            }

        }
    }
    
}
