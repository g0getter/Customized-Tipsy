 //
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalcuatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tipRatio = 0.0
    var calculatedResult = ""
    
    @IBAction func TipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        
        switch(sender) {
        case zeroPctButton:
            tipRatio = 0.0
        case tenPctButton:
            tipRatio = 0.1
        case twentyPctButton:
            tipRatio = 0.2
        default: tipRatio = 0.0
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        print("📍\(sender.value)")
        splitNumberLabel.text = "\(Int(sender.value))"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let temp = (Double(billTextField.text ?? "0") ?? 0) * (1+tipRatio) / (Double(splitNumberLabel.text ?? "2") ?? 0)
        
        calculatedResult = String(format: "%.2f", temp)
        
        performSegue(withIdentifier: "goToResult", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as? ResultsViewController
        vc?.result = calculatedResult
        vc?.peopleNum = splitNumberLabel.text
        vc?.tipPercentage = String(format: "%.f", tipRatio * 100)
    }


}

