//
//  MainVC.swift
//  Adwise
//
//  Created by Kadir Emre on 3.12.2021.
//

import UIKit
import DWAnimatedLabel

class MainVC: UIViewController {
    
    @IBOutlet var adviceLabel: DWAnimatedLabel!
    var adviceManager = AdviceManager()
    var shownMessage  = "Next Text"

    
    override func viewDidLoad() {
        super.viewDidLoad()
        adviceLabel.animationType = .fade
        
        
    }
        
        @IBAction func getAdviceButtonTapped(_ sender: UIButton) {
            
            adviceManager.getAdvice()
            adviceLabel.startAnimation(duration: 3, nextText: shownMessage) {
                self.adviceLabel.text = self.adviceManager.mySlip?.advice
            }
                        
            

    }
}

