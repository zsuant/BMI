//
//  SecondViewController2.swift
//  BMI
//
//  Created by 이수겸 on 2022/12/16.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var bmiLVLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
    var bmi: BMI?
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeUI()
        
        guard let bmi = bmi else { return }
        bmiLabel.text = "\(bmi.value)"
        bmiLabel.backgroundColor = bmi.matchColor
        bmiLVLabel.text = bmi.level
        adviceLabel.text = bmi.advice

    }
    
    func makeUI() {
        
        bmiLabel.clipsToBounds = true
        bmiLabel.layer.cornerRadius = 8
        bmiLabel.backgroundColor = .gray
        
        backButton.clipsToBounds = true
        backButton.layer.cornerRadius = 5
       
    }

    @IBAction func backButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        
    }
 

}
