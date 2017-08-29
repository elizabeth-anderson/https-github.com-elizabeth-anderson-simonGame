//
//  ViewController.swift
//  simonGame
//
//  Created by Elizabeth on 8/24/17.
//  Copyright © 2017 Elizabeth. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet var colorDisplays: [UIView]!
   

    @IBAction func onStartButtonPressed(_ sender: Any)
    
    {
        flashColor(number: 0)
    }
    
  
    
    
    
    
    func flashColor(number:Int)
    {
        UIView.transition(with: colorDisplays[number], duration: 0.5, options: .transitionCrossDissolve, animations: {
            self.colorDisplays[number]
        }, completion: <#T##((Bool) -> Void)?##((Bool) -> Void)?##(Bool) -> Void#>)
        UIView.transition(with: colorDisplays[number], duration:0.5 , options: .transitionCrossDissolve, animations:
            {
            self.colorDisplays[number].alpha = 1.0
        }, completion: nil)
    }

    
    
}

