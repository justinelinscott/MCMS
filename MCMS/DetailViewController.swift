//
//  DetailViewController.swift
//  MCMS
//
//  Created by Justine Linscott on 5/21/19.
//  Copyright © 2019 Justine Linscott. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var editTextField: UITextField!
    @IBOutlet weak var detailTextField: UITextField!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var accessoryTextField: UITextField!
    @IBOutlet weak var detailTableView: UITableView!
    
    var creature: MagicalCreatures!

    override func viewDidLoad() {
        super.viewDidLoad()
        editTextField.isHidden = true
        detailTextField.isHidden = true
        saveButton.isHidden = true
        title = creature.name
        detailLabel.text = creature.detail
        detailLabel.sizeToFit()
        imageView.image = creature.image
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
    
    @IBAction func addAccessoryButtonPressed(_ sender: UIButton) {
        if accessoryTextField.text == ""{
            
        } else { creature.accessories.append(accessoryTextField.text!)
            detailTableView.reloadData()
            accessoryTextField.text = ""
        }
    }
    
    @IBAction func doubleTap(_ sender: UITapGestureRecognizer) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let myPickerController = UIImagePickerController()
            myPickerController.delegate = self
            myPickerController.sourceType = .savedPhotosAlbum
            myPickerController.allowsEditing = false
            present(myPickerController, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            creature.image = image
            imageView.image = creature.image
        }
        dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return creature.accessories.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID") as! UITableViewCell
        cell.textLabel?.text = creature.accessories[indexPath.row]
        
        return cell
    }
}
