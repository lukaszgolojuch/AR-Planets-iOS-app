//
//  MainMenuViewController.swift
//  AR Planets iOS app
//
//  Created by Łukasz Gołojuch on 4/10/22.
//

import UIKit

class MainMenuViewController: UITableViewController {
    
    var choice: String?
    var selectedPlanetName = "jupiter"
    
    let namesArrays = NamesArrays()
    
    var array = [[String]] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if choice == "planets" {
            navigationItem.title = "Planets"
            array.append(namesArrays.planetNamesArrays)
        }
        else if choice == "earth" {
            navigationItem.title = "Earth"
            array.append(namesArrays.earthNamesArrays)
        }
        else if choice == "sunAndMoon" {
            navigationItem.title = "Sun and Moon"
            array.append(namesArrays.sunAndMoonNamesArray)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return array.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! PlanetsCellController
        
        let planet = self.array[indexPath.section][indexPath.row]
        
        cell.planetNameLabel?.text = planet
        cell.planetIconImage?.image = UIImage(named: planet)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedPlanetName = array[indexPath.section][indexPath.row]
        self.performSegue(withIdentifier: "ShowPlanetSeague", sender: selectedPlanetName)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "ShowPlanetSeague") {
            let vc = segue.destination as! ViewController
            
            vc.planetName = selectedPlanetName
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return false
    }
}
