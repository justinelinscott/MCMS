//
//  ViewController.swift
//  MCMS
//
//  Created by Justine Linscott on 5/21/19.
//  Copyright © 2019 Justine Linscott. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var newCreatureDetailTextField: UITextField!
    @IBOutlet weak var newCreatureNameTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var creatures: [MagicalCreatures] = []
    var indexOfCreature = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        let name1 = "dragon"
        let name2 = "griffon"
        let name3 = "dinosaur"
        creatures = [MagicalCreatures(name: name1, detail: "purple", image: UIImage(named: "dragon")!, accessories: ["Ill Gotten Gold", "Fire"]), MagicalCreatures(name: name2, detail: "yellow", image: UIImage(named: "griffon")!, accessories: ["feathers", "wings"]), MagicalCreatures(name: name3, detail: "blue", image: UIImage(named: "dinosaur")!, accessories: ["sword", "shoes"])]
    }
    
    @IBAction func addButtonPressed(_ sender: UIButton) {
        creatures.append(MagicalCreatures(name: newCreatureNameTextField.text!, detail: newCreatureDetailTextField.text!, image: UIImage(named: "noimage")!))
        newCreatureNameTextField.text = ""
        newCreatureDetailTextField.text = ""
        tableView.reloadData()
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return creatures.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID") as! UITableViewCell
        let creature = creatures[indexPath.row]
        cell.textLabel?.text = creature.name
        cell.detailTextLabel?.text = creature.detail
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        indexOfCreature = tableView.indexPathForSelectedRow!.row
        let creature = creatures[indexOfCreature]
        let dvc = segue.destination as! DetailViewController
        dvc.creature = creature
    }

    @IBAction func save(sender: UIStoryboardSegue) {
        if let dvc = sender.source as? DetailViewController {
            creatures[indexOfCreature] = dvc.creature
            tableView.reloadData()
        }
    }

}

