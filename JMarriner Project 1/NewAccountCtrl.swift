//
//  NewAccountCtrl.swift
//  JMarriner Project 1
//
//  Created by admin on 4/26/21.
//

import UIKit

class NewAccountCtrl: UIViewController
{

    @IBOutlet weak var Username: UITextField!
    @IBOutlet weak var Pass: UITextField!
    @IBOutlet weak var unavail: UILabel!
    @IBOutlet weak var SecuQ: UITextField!
    @IBOutlet weak var SecuAns: UITextField!
    
    let noUser = "Username/password cannot be blank!"
    let used = "Username unavailable!"
    let goodUser = "Username available!"
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func userCheck() -> Bool
    {
        let check = DataHandle.inst.checkUser(user: Username.text!)
        
        if check
        {
            return true
        }
        
        return false
    }
    
    @IBAction func Availability(_ sender: UIButton)
    {
       
        if userCheck()
        {
            unavail.text = goodUser
            unavail.textColor = UIColor.green
            unavail.isHidden = false
        }
        else
        {
            unavail.text = used
            unavail.textColor = UIColor.red
            unavail.isHidden = false
        }
    }
    
    @IBAction func Savedata(_ sender: UIButton)
    {
        if let usr = Username.text, usr.isEmpty
        {
            if let pwrd = Pass.text, pwrd.isEmpty
            {
                self.unavail.text = self.noUser
                self.unavail.textColor = UIColor.red
                self.unavail.isHidden = false
                return
            }
        }
        
        if userCheck()
        {
            guard let pword = Pass.text else
            {
                unavail.text = "Password cannot be blank!"
                unavail.textColor = UIColor.red
                unavail.isHidden = false
                return
            }
            
            guard let usr = Username.text else
            {
                unavail.text = noUser
                unavail.textColor = UIColor.red
                unavail.isHidden = false
                return
            }
            
            guard let ques = SecuQ.text else
            {
                unavail.text = "Security Question cannot be blank!"
                unavail.textColor = UIColor.red
                unavail.isHidden = false
                return
            }
            
            guard let ans = SecuAns.text else {
                unavail.text = "Your question needs an answer!"
                unavail.textColor = UIColor.red
                unavail.isHidden = false
                return
            }
            DataHandle.inst.addCred(object: [usr : pword], question: ques, answer: ans)
            
            ViewController.usern = usr
            performSegue(withIdentifier: "AcctCrtd", sender: self)
        }
    }
    
}
