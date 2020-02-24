//
//  ViewController.swift
//  Calculator
//
//  Created by Thallapalli Rajachandra on 21/02/20.
//  Copyright © 2020 Thallapalli Rajachandra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let numbers = [0,1,2,3,4,5,6,7,8,9] //number tags
    let operations = [10, 11, 12, 13, 14,15,16,17] //operations tags
    var firstNumber = ""
    var secondNumber = ""
    var operation = 0
    
    @IBOutlet weak var resultLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        
        /*if sender.tag == 16 {
            let currentText = resultLabel.text
            if (currentText?.contains("+"))! {
                resultLabel.text = "-\(currentText)"
            } else if ((currentText?.contains("-"))!) {
                resultLabel.text = "+\(currentText)"
            }
        } */
        
        if sender.tag == 17{
              allClear()
          }else{
              
              if sender.tag == 10 { resultLabel.text = calculations(firstNumber , secondNumber, operation)}
              
          if numbers.contains(sender.tag){
              if operation == 0{
                  firstNumber = firstNumber + String(sender.tag)
                  resultLabel.text = String(firstNumber)
              }else{
                 secondNumber = secondNumber + String(sender.tag)
                  resultLabel.text = String(secondNumber)
              }
          }else if operations.contains(sender.tag){
              
              if operation == 0{
                  operation = sender.tag
              }
              else{
                  let res = calculations(firstNumber , secondNumber, operation)
                  firstNumber = res
                  secondNumber = ""
                  operation = sender.tag
                  resultLabel.text = res
              }
          }
        }
    }


    func allClear(){
        firstNumber = ""
        secondNumber = ""
        operation = 0
        resultLabel.text = "0"
    }
    func calculations(_ firstNum: String, _ secondNum: String, _ operationsPassed: Int) -> String {
        let first = Int(firstNum) ?? 0
        let second = Int(secondNum) ?? 0
        var result = 0
        
        switch operationsPassed{
            case 11:
                result = first + second
            case 12:
                result = first - second
            case 13:
                result = first * second
            case 14:
                result = first / second
            case 15:
                result = first % second
        default:
            result = 0
        }
        return String(result)
    }

}
