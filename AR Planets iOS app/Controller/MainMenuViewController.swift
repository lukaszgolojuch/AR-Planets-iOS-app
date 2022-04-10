//
//  MainMenuViewController.swift
//  AR Planets iOS app
//
//  Created by Łukasz Gołojuch on 4/10/22.
//

import UIKit

class MainMenuViewController: UITableViewController {
    
    //Array of planet names - all planet names must be build only with small letters
    private let planetNamesArrays = [
        "jupiter",
        "mars",
        "mercury",
        "neptun",
        "uranus",
        "venus"
    ]

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return planetNamesArrays.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath)
        
        let planet = self.planetNamesArrays[indexPath.section]
        cell.textLabel?.text = planet
        return cell
    }
}
