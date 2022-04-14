//
//  ViewController.swift
//  AR Planets iOS app
//
//  Created by Łukasz Gołojuch on 4/10/22.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    var planetName: String?
    private var addX: Float = 0.0
    private var addY: Float = 0.0
    private var addZ: Float = 0.0
    let namesArrays = NamesArrays()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(planetName!)
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = false
        
        if planetName == "Solar system" {
            solarSystem()
        }
        else {
            createPlanet()

            if planetName == "saturn" {
                createSaturnRings()
            }
        }
        
        sceneView.autoenablesDefaultLighting = true
    }
    
    private func solarSystem(){
        for planet in namesArrays.planetNamesArrays {
            planetName = planet
            createPlanet()
            if planet == "saturn" {
                createSaturnRings()
            }
            addX += 0.15
            addY += 0.10
            addZ += 0.15
        }
    }
    
    private func createPlanet() {
        let sphere = SCNSphere(radius: 0.1)
        let material = SCNMaterial()
        material.diffuse.contents = UIImage(named: "art.scnassets/\(planetName!).jpg")
        sphere.materials = [material]
        
        let node = SCNNode()
        node.position = SCNVector3(
            x: 0 + addX,
            y: -0.1 + addY,
            z: -1 - addZ)
        node.geometry = sphere
        
        sceneView.scene.rootNode.addChildNode(node)
    }
    
    private func createSaturnRings() {
        let saturnRing = SCNTube(innerRadius: 0.15,
                                 outerRadius: 0.40,
                                 height: 0.005)
        let material = SCNMaterial()
        material.diffuse.contents = UIImage(named: "art.scnassets/saturnRing.png")
        
        saturnRing.materials = [material]
        let node = SCNNode()
        node.position = SCNVector3(
            x: 0 + addX,
            y: -0.1 + addY,
            z: -1 - addZ)
        node.geometry = saturnRing
        
        sceneView.scene.rootNode.addChildNode(node)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

}
