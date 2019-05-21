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
    @IBOutlet weak var editTextField: UITextField!
    
    var creature: MagicalCreatures!

    override func viewDidLoad() {
        super.viewDidLoad()
        editTextField.isHidden = true
        title = creature.name
    }
    
    @IBAction func editButtonPressed(_ sender: UIButton) {
        if (editButton.titleLabel?.text == "Edit") {
            editButton.setTitle("Done", for: .normal)
            editTextField.isHidden = false
        }
        else {
            creature.name = editTextField.text!
            editTextField.isHidden = true
            editButton.setTitle("Edit", for: .normal)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
