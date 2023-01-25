//
//  CalculatorViewController.swift
//  Tipsy
//
//  Created by Vania Aryutov on 25.01.2023.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var calculateButton: UIButton!
    
    var tipChosen:Float = 0.0
    var finalResult:Float = 0.0
    var resultsVC = ResultsViewController().self
    var splitNumberLabelString = ""
    var finalTipConvert = ""
    var tipPercentage = ""

    
    override func viewDidLoad() {
        tipChanged(zeroPctButton)
        calculateButton.isEnabled = false
        calculateButton.backgroundColor = UIColor.gray
        billTextField.addTarget(self, action: #selector(checkTextField(_:)), for: .editingChanged)
    }
    
    @objc func checkTextField(_ sender: UITextField) {
        if billTextField.text == "" {
            calculateButton.isEnabled = false
            calculateButton.backgroundColor = UIColor.gray
        } else {
            calculateButton.isEnabled = true
            calculateButton.backgroundColor = UIColor(red: 79/255, green: 173/255, blue: 113/255, alpha: 1.0)
        }
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        
        billTextField.endEditing(true)
     
        if sender == zeroPctButton {
            tipChosen = 0.0
            tipPercentage = "0%"
        } else if sender == tenPctButton {
            tipChosen = 0.1
            tipPercentage = "10%"
        } else {
            tipChosen = 0.2
            tipPercentage = "20%"
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = Int(sender.value).description
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let splitNumberFinal = Float(splitNumberLabel.text ?? "")
        let billTextFloat = Float(billTextField.text ?? "0.0")
        
        finalResult = (((billTextFloat ?? 0.0) + ((billTextFloat ?? 0.0) * tipChosen)) / splitNumberFinal!)
        
        finalTipConvert = "Split between \(Int(splitNumberFinal ?? 0.0)) people, with \(tipPercentage) tip."
        
        performSegue(withIdentifier: "ResultsSeague", sender: nil)
            }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ResultsSeague" {
            resultsVC = segue.destination as! ResultsViewController
            resultsVC.moneyResult = String(format: "%.2f%", finalResult)
            resultsVC.finalTip = finalTipConvert
        }
    }
}
