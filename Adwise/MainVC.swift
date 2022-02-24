//
//  MainVC.swift
//  Adwiser
//
//  Created by Kadir Emre on 3.12.2021.
//

import UIKit
import DWAnimatedLabel

class MainVC: UIViewController {
    
    @IBOutlet var adviceLabel: DWAnimatedLabel!
    var adviceManager = AdviceManager()
    var shownMessage  = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        adviceLabel.animationType = .fade
        
        adviceManager.getAdvice()
    }
        
        @IBAction func getAdviceButtonTapped(_ sender: UIButton) {

            shownMessage = adviceManager.resultt?.slip.advice ?? "Nothing to show today"
            adviceLabel.startAnimation(duration: 3, nextText: "\(shownMessage)") {
            }
    }
}

