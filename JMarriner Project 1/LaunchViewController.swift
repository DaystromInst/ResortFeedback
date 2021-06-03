//
//  LaunchViewController.swift
//  JMarriner Project 1
//
//  Created by admin on 5/4/21.
//

import UIKit

class LaunchViewController: UIViewController
{

    @IBOutlet weak var logoV: UIImageView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        UIImageView.animate(withDuration: 8.0, animations: {
            self.logoV.transform = CGAffineTransform(rotationAngle: CGFloat(36000.0))
        })
        
        Timer.scheduledTimer(timeInterval: 11.0, target: self, selector: #selector(launch), userInfo: nil, repeats: false)
        
    }
    
    @objc func launch()
    {
        print("fired timer")
        performSegue(withIdentifier: "Launch", sender: self)
    }

}
