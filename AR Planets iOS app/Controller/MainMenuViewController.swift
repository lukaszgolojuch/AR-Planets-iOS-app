//
//  MainMenuViewController.swift
//  AR Planets iOS app
//
//  Created by Łukasz Gołojuch on 4/10/22.
//

import UIKit

class MainMenuViewController: UITableViewController {
    
    var selectedPlanetName = "jupiter"
    let headerTitles = ["Planets", "Earth", "Sun and Moon", "Solar system"]
    
    let namesArrays = NamesArrays()
    
    var array = [[String]] ()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        array.append(namesArrays.planetNamesArrays)
        array.append(namesArrays.earthNamesArrays)
        array.append(namesArrays.sunAndMoonNamesArray)
        array.append(namesArrays.solarSystem)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return array.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath)
        
        let planet = self.array[indexPath.section][indexPath.row]
        cell.textLabel?.text = planet
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
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section < headerTitles.count {
                return headerTitles[section]
            }
        return nil
    }
}
