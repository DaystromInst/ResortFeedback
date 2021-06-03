//
//  RoomTalkCtrl.swift
//  JMarriner Project 1
//
//  Created by admin on 5/6/21.
//

import UIKit

class RoomTalkCtrl: UIViewController, SurveyBase
{
    var q1Ans: Int = 1
    
    var q2Ans: Int = 1
    
    var q3Ans: String?
    
    @IBOutlet weak var q1Lb: UILabel!
    @IBOutlet weak var q2Lb: UILabel!
    @IBOutlet weak var q3Lb: UILabel!
    
    @IBOutlet weak var q1Bar: UISegmentedControl!
    @IBOutlet weak var q2Bar: UISegmentedControl!
    @IBOutlet weak var q3Field: UITextField!
    
    @IBOutlet weak var DoneBtn: UIButton!
    @IBOutlet weak var thankLb: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    func confirmSurvey()
    {
        q1Ans = q1Bar.selectedSegmentIndex + 1
        q2Ans = q2Bar.selectedSegmentIndex + 1
        q3Ans = q3Field.text!
        
        let name = ViewController.usern!
        
        DataHandle.inst.saveSurv(usr: name, q1: q1Ans, q2: q2Ans, q3: q3Ans!, type: "room")
        
    }
    
    func getFolder() -> Bool
    {
        let name = ViewController.usern!
        
        let success = DataHandle.inst.checkSurv(user: name)
        
        return success
        
    }
    
    
    @IBAction func Finish(_ sender: Any)
    {
        if let txt = q3Field.text, txt.isEmpty
        {
            print("Q3 field is empty!")
            return
        }

        confirmSurvey()
        
        q1Bar.isHidden = true
        q2Bar.isHidden = true
        q3Field.isHidden = true
        
        q1Lb.isHidden = true
        q2Lb.isHidden = true
        q3Lb.isHidden = true
        
        DoneBtn.isHidden = true
        thankLb.isHidden = false
            
    }
    

}
