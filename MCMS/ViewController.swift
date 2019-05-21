//
//  ViewController.swift
//  MCMS
//
//  Created by Justine Linscott on 5/21/19.
//  Copyright © 2019 Justine Linscott. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var newCreatureTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var creatures: [MagicalCreatures] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        let name1 = "dragon"
        let name2 = "griffon"
        let name3 = "dinosaur"
        creatures = [MagicalCreatures(name: name1), MagicalCreatures(name: name2), MagicalCreatures(name: name3)]
    }
    
    @IBAction func addButtonPressed(_ sender: UIButton) {
        creatures.append(MagicalCreatures(name: newCreatureTextField.text!))
        newCreatureTextField.text = ""
        tableView.reloadData()
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return creatures.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID") as! UITableViewCell
        let creature = creatures[indexPath.row]
        cell.textLabel?.text = creature.name
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let creature = creatures[tableView.indexPathForSelectedRow!.row]
        let dvc = segue.destination as! DetailViewController
        dvc.creature = creature
    }


}

