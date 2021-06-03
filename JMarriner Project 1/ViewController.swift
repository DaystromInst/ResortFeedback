//
//  ViewController.swift
//  JMarriner Project 1
//
//  Created by admin on 4/19/21.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var Username: UITextField!
    @IBOutlet weak var Pass: UITextField!
    @IBOutlet weak var Incorrect: UILabel!
    
    static var usern: String?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        //Incorrect.isHidden = true
        // Do any additional setup after loading the view.
    }

    @IBAction func Validate(_ sender: UIButton)
    {
        let success = DataHandle.inst.verifyLogin(User: Username.text!, Pass: Pass.text!)
        if success
        {
            ViewController.usern = Username.text
            performSegue(withIdentifier: "LogSG", sender: self) // Jump to the Main menu vc
        }
        else
        {
            Incorrect.isHidden = false
        }
    }
}

