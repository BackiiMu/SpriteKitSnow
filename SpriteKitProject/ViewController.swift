//
//  ViewController.swift
//  SpriteKitProject
//
//  Created by adam on 2023/12/28.
//

import UIKit

class ViewController: UIViewController {

    private var snowScene = SnowScene()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func startSnow(_ sender: UIButton) {
        self.snowScene.startEmitter(view: view)
    }
    
    @IBAction func stopSnow(_ sender: UIButton) {
        
        self.snowScene.stopEmitter()
    }
}

