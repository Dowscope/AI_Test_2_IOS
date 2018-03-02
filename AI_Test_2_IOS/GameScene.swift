//
//  GameScene.swift
//  AI_Test_2_IOS
//
//  Created by Timothy Dowling on 2018-03-01.
//  Copyright © 2018 Timothy Dowling. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var entityManager: EntityManager!
    var train1: Train!
    
    override func didMove(to view: SKView) {
        anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        entityManager = EntityManager(scene: self)
        
        let pathPoints: [GKGraphNode2D] = [
            GKGraphNode2D(point: float2(-100, 0)),
            GKGraphNode2D(point: float2(-90, 0)),
            GKGraphNode2D(point: float2(-50, 0)),
            GKGraphNode2D(point: float2(0, 0)),
            GKGraphNode2D(point: float2(50,0)),
            GKGraphNode2D(point: float2(100, 0))
        ]
        
        
        
        for p in pathPoints {
            let s = SKShapeNode(circleOfRadius: 10)
            s.position = p.toCGPoint
            s.fillColor = .orange
            s.lineWidth = 0
            addChild(s)
        }
        
        let path = GKPath(graphNodes: pathPoints, radius: 200)
        
        train1 = Train(startingPosition: pathPoints[0].toCGPoint, color: .lightGray, path: path)
        entityManager.add(entity: train1)
    }
    
    override func update(_ currentTime: TimeInterval) {
        entityManager.update(dt: currentTime)
    }
}
