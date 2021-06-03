//
//  SurveyBase.swift
//  JMarriner Project 1
//
//  Created by admin on 4/27/21.
//

import UIKit

protocol SurveyBase: UIViewController
{
    var q1Ans: Int { get set }
    var q2Ans: Int { get set }
    var q3Ans: String? { get set }
    
    
    func viewDidLoad()
    
    func confirmSurvey()
    
    func getFolder() -> Bool
    
}
