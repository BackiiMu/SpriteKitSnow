//
//  SnowScene.swift
//  SpriteKitProject
//
//  Created by adam on 2023/12/28.
//

import Foundation
import SpriteKit

class SnowScene: SKScene {

    private var presentingView: SKView?
    private var emitter: SKEmitterNode?
    private var sceneView: SKView?
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        scaleMode = .resizeFill
        backgroundColor = UIColor.clear
        presentingView = view
    }
    
    // 눈 내리는 효과 시작
    func startEmitter(view: UIView) {
        if self.sceneView != nil {
            return
        }
        
        self.sceneView = SKView(frame: view.frame)
            
        guard let sceneView = self.sceneView else {
            return
        }
        
        sceneView.backgroundColor = UIColor.clear
        sceneView.presentScene(self)
        
        // 터치 비활성화 (아래 뷰가 터치되도록)
        sceneView.isUserInteractionEnabled = false
        
        view.addSubview(sceneView)
        
        self.emitter = SKEmitterNode(fileNamed: "Snow.sks")
        guard
            let emitter = self.emitter,
            let presentingView = presentingView
            else { return }

        emitter.particlePositionRange = CGVectorMake(CGRectGetWidth(presentingView.bounds), 0)
        emitter.position = CGPointMake(CGRectGetMidX(presentingView.bounds), CGRectGetHeight(presentingView.bounds))
        emitter.targetNode = self

        addChild(emitter)
    }
    
    // 눈 내리는 효과 정지
    func stopEmitter() {
        guard let sceneView = self.sceneView else {
            return
        }
        
        sceneView.presentScene(nil)
        sceneView.removeFromSuperview()
        self.sceneView = nil
        
        guard let emitter = emitter else { return }
        emitter.particleBirthRate = 0.0
        emitter.targetNode = nil
        emitter.removeFromParent()
        self.emitter = nil
    }
}
