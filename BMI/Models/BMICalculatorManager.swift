//
//  BMICalculatorManager.swift
//  BMI
//
//  Created by 이수겸 on 2022/12/18.
//

import UIKit


class BMICalculatorManager {
    
    private var bmi: BMI?
    // 속성은 외부에서 집적적으로 접근 못하게 private로 지정 (메서드를 통해 접근하도록)
    

    
    func getBMI(height: String, weight: String) -> BMI {
        calculateBMI(height: height, weight: weight)
        return bmi ?? BMI(value: 0.00, matchColor: .black, level: "문제발생", advice: "")
    }
    
    
    func calculateBMI(height: String, weight: String) {
        guard let h = Double(height), let w = Double(weight) else { return }
        var bmiNumber = w / (h * h) * 10000
        bmiNumber = round(bmiNumber * 100) / 100
        
        var adviceLoss = round((w - 23*h*h/10000)*10) / 10
        var adviceGain = round((18.5*h*h/10000 - w)*10) / 10
        
        if bmiNumber <= 18.5 {
            bmi = BMI(value: bmiNumber, matchColor: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1),
                      level: "저체중",
                      advice: "\(adviceGain)kg 찌우셔야 합니다")
            
        } else if bmiNumber < 23 {
            bmi = BMI(value: bmiNumber, matchColor: #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1),
                      level: "표준", advice: "")
           
            
        } else if bmiNumber < 25{
            bmi = BMI(value: bmiNumber, matchColor: #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1),
                      level: "과체중",
                      advice: "\(adviceLoss)kg 빼셔야 합니다")

        } else if bmiNumber < 30 {
            bmi = BMI(value: bmiNumber, matchColor: #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1),
                      level: "중도비만",
                      advice: "\(adviceLoss)kg 빼셔야 합니다")
            
        } else {
            bmi = BMI(value: bmiNumber, matchColor: #colorLiteral(red: 0.7451614738, green: 0, blue: 0, alpha: 1),
                      level: "고도비만",
                      advice: "\(adviceLoss)kg 빼셔야 합니다")

        }
        
    }
    

}
