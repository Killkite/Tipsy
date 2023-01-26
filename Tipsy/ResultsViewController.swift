//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Vania Aryutov on 25.01.2023.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var moneyResult: String = ""
    var finalTip: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = moneyResult
        settingsLabel.text = finalTip
}
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
