//
//  ViewController.swift
//  BMI
//
//  Created by 이수겸 on 2022/12/16.
//

import UIKit

class ViewController: UIViewController {
 
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!

    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    
    @IBOutlet weak var calculateButton: UIButton!
    
    var bmiManager = BMICalculatorManager()
 
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        makeUI()
    }

    func makeUI() {
        heightTextField.delegate = self
        weightTextField.delegate = self
         
        mainLabel.text = "키와 몸무게를 입력해 주세요"
        calculateButton.clipsToBounds = true
        calculateButton.layer.cornerRadius = 5
        calculateButton.setTitle("BMI 계산하기", for: .normal)
        heightTextField.placeholder = "cm단위로 입력해 주세요"
        weightTextField.placeholder = "kg단위로 입력해 주세요"
        heightTextField.keyboardType = .numbersAndPunctuation
        weightTextField.keyboardType = .numbersAndPunctuation
        calculateButton.isEnabled = false
        
    }
    
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
    }

    
//    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
//        if heightTextField.text != "", weightTextField.text != "" {
//            mainLabel.text = "키와 몸무게를 입력하셔야만 합니다!!!"
//            mainLabel.textColor = .red
//            return true
//        }
//        return false
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecondVC" {
            let secondVC = segue.destination as! SecondViewController
            secondVC.bmi = bmiManager.getBMI(height: heightTextField.text!, weight: weightTextField.text!)
           
        }
        heightTextField.text = ""
        weightTextField.text = ""
        calculateButton.isEnabled = false
        
    }
    

}

extension ViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if Int(string) != nil || string == "" || string == "."{
            return true
        }
        return false
    }
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if heightTextField.text != "", weightTextField.text != "" {
            heightTextField.resignFirstResponder()
            weightTextField.resignFirstResponder()
            return true
        }
        else if heightTextField.text != "" {
            weightTextField.becomeFirstResponder()
            return true
        }
        return false
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        heightTextField.resignFirstResponder()
        weightTextField.resignFirstResponder()

    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if heightTextField.text != "", weightTextField.text != "" {
            calculateButton.isEnabled = true
        } else { calculateButton.isEnabled = false }
    }
    
    
}
