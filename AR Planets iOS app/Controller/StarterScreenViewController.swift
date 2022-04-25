//
//  StarterScreenViewController.swift
//  AR Planets iOS app
//
//  Created by Łukasz Gołojuch on 4/25/22.
//

import UIKit

class StarterScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func planetsButtonTapped(_ sender: UIButton) {
        print("planets")
        self.performSegue(withIdentifier: "planetsSeague", sender: "planets")
    }
    
    @IBAction func earthButtonTapped(_ sender: UIButton) {
        print("earth")
        self.performSegue(withIdentifier: "earthSeague", sender: "earth")
    }
    
    @IBAction func moonAndSunButtonTapped(_ sender: UIButton) {
        print("moonAndSun")
        self.performSegue(withIdentifier: "moonAndSunSeague", sender: "moonAndSun")
    }
   
    @IBAction func solarSystemButtonTapped(_ sender: UIButton) {
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
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return false
    }
}
