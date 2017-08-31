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
    @IBOutlet weak var backgroundView: UIView!
    var pattern = [Int]()
    var timer = Timer()
    var index = 0
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    @IBAction func onStartButtonPressed(_ sender: Any)
        
    {
        for _ in 0...10 {
            addToPattern()
        }
        
        displayPattern()
    }
    
    
    func flashColor(number:Int)
    {
        UIView.transition(with: colorDisplays[number], duration: 0.5, options: .transitionCrossDissolve, animations: {
            self.colorDisplays[number].alpha = 1.0
        }) { (true) in
            UIView.transition(with: self.colorDisplays[number], duration:0.7 , options: .transitionCrossDissolve, animations:
                {
                    self.colorDisplays[number].alpha = 0.4
            }, completion: nil)
        }
        
    }
    func displayPattern()
    {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: (#selector(ViewController.nextColor)), userInfo: nil, repeats: true)
    }
    
    @objc func nextColor()
    {
        if index < pattern.count
        {
            flashColor(number: pattern[index])
            index += 1
        }
        else
        {
            timer.invalidate()
            index = 0
        }
    }
    public func addToPattern()
    {
        pattern.append(Int(arc4random_uniform(4)))
    }
    
    @IBAction func onColorTapped(_ sender: UITapGestureRecognizer)
    {
        for number in 0..<colorDisplays.count
        {
            if colorDisplays[number].frame.contains(sender.location(in: backgroundView))
            {
                flashColor(number: number)
                
            }
        }
    }
}

