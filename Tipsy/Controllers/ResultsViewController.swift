//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by 여나경 on 2022/03/31.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    var result: String?
    var peopleNum: String?
    var tipPercentage: String?
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var settingLabel: UILabel!
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
    }
    
    private func setUI() {
        totalLabel.text = result
        guard let peopleNum = peopleNum, let tipPercentage = tipPercentage else {
            return
        }

        settingLabel.text = "Split between \(peopleNum) people, with \(tipPercentage)% tip."
    }
    


}
