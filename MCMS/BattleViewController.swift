//
//  BattleViewController.swift
//  MCMS
//
//  Created by Justine Linscott on 5/21/19.
//  Copyright © 2019 Justine Linscott. All rights reserved.
//

import UIKit

class BattleViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    
    @IBOutlet weak var firstTableView: UITableView!
    @IBOutlet weak var chosenLabel: UILabel!
    @IBOutlet weak var computerLabel: UILabel!
    @IBOutlet weak var winnerLabel: UILabel!
    
    
    
    var creatures: [MagicalCreatures] = []
    var cell = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        winnerLabel.isHidden = true
        let randNum = Int.random(in: 0...(creatures.count-1))
        computerLabel.text = creatures[randNum].name
    }
    
    @IBAction func changeButtonPressed(_ sender: UIButton) {
        let randNum = Int.random(in: 0...(creatures.count-1))
        computerLabel.text = creatures[randNum].name
    }
    
    @IBAction func fightButtonPressed(_ sender: UIButton) {
        winnerLabel.isHidden = false
        let randNumChosen = Int.random(in: 0...(creatures.count-1))
        let randNumComputer = Int.random(in: 0...(creatures.count-1))
        if computerLabel.text == chosenLabel.text {
            winnerLabel.text = "It's a tie!"
        } else {
        if randNumChosen > randNumComputer {
            winnerLabel.text = "Your creature won!"
        } else {
            winnerLabel.text = "Your creature lost "
        }
        }
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        cell = indexPath.row
        chosenLabel.text = creatures[cell].name
        chosenLabel.adjustsFontSizeToFitWidth = true
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
