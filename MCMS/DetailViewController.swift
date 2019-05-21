//
//  DetailViewController.swift
//  MCMS
//
//  Created by Justine Linscott on 5/21/19.
//  Copyright © 2019 Justine Linscott. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var editTextField: UITextField!
    @IBOutlet weak var detailTextField: UITextField!
    @IBOutlet weak var detailLabel: UILabel!
    
    var creature: MagicalCreatures!

    override func viewDidLoad() {
        super.viewDidLoad()
        editTextField.isHidden = true
        detailTextField.isHidden = true
        saveButton.isHidden = true
        title = creature.name
        detailLabel.text = creature.detail
    }
    
    @IBAction func editButtonPressed(_ sender: UIButton) {
        if (editButton.titleLabel?.text == "Edit") {
            editButton.setTitle("Done", for: .normal)
            editTextField.isHidden = false
            detailTextField.isHidden = false
        }
        else {
            creature.name = editTextField.text!
            creature.detail = detailTextField.text!
            editTextField.isHidden = true
            detailTextField.isHidden = true
            saveButton.isHidden = false
            editButton.setTitle("Edit", for: .normal)
            title = creature.name
            detailLabel.text = creature.detail
            detailTextField.text = ""
            editTextField.text = ""
        }
    }

}
