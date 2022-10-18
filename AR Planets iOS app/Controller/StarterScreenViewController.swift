//
//  StarterScreenViewController.swift
//  AR Planets iOS app
//
//  Created by Łukasz Gołojuch on 4/25/22.
//

import UIKit

class StarterScreenViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }

    @IBAction func planetsButtonTapped() {
        print("planets")
        self.performSegue(withIdentifier: "planetsSeague", sender: "planets")
    }
    
    @IBAction func earthButtonTapped() {
        print("earth")
        self.performSegue(withIdentifier: "earthSeague", sender: "earth")
    }
    
    @IBAction func moonAndSunButtonTapped() {
        print("moonAndSun")
        self.performSegue(withIdentifier: "moonAndSunSeague", sender: "moonAndSun")
    }
   
    @IBAction func solarSystemButtonTapped() {
        self.performSegue(withIdentifier: "solarSystemSegue", sender: "Solar system")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "solarSystemSegue" {
            let vc = segue.destination as! ViewController
            vc.planetName = "Solar system"
        }
        else if segue.identifier == "planetsSeague" {
            let vc = segue.destination as! MainMenuViewController
            vc.choice = "planets"
        }
        else if segue.identifier == "earthSeague" {
            let vc = segue.destination as! MainMenuViewController
            vc.choice = "earth"
        }
        else if segue.identifier == "moonAndSunSeague" {
            let vc = segue.destination as! MainMenuViewController
            vc.choice = "sunAndMoon"
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
            case 0:
                planetsButtonTapped()
            case 1:
                earthButtonTapped()
            case 2:
                moonAndSunButtonTapped()
            default:
                solarSystemButtonTapped()
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return false
    }
}
