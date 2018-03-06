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
    
    var graph = GKGraph()
    var endPos: GKGraphNode!
    
    override func didMove(to view: SKView) {
        anchorPoint = CGPoint(x: 0.4, y: 0.4)
        
        entityManager = EntityManager(scene: self)
        
        for x in 0..<5 {
            for y in 0..<5 {
                let s = SKShapeNode(circleOfRadius: 10)
                let point = CGPoint(x: x * 50, y: y * 50)
                s.position = point
                s.fillColor = .orange
                s.lineWidth = 0
                
                
                
                let ranNum = arc4random_uniform(100)
                
                if ranNum > 85 {
                    continue
                }
                
                addChild(s)
                graph.connectToLowestCostNode(node: GKGraphNode2D(point: point.toFloat2) , bidirectional: true)
            }
        }
        
        print(graph.nodes?.count)
        let startPos = graph.nodes?.first
        endPos = graph.nodes?.last
        
        let pathNodes = graph.findPath(from: startPos!, to: endPos!)
        print(pathNodes.count)
        let path = GKPath(graphNodes: pathNodes, radius: 20)
        
        
        train1 = Train(startingPosition: CGPoint.zero, color: .lightGray, path: path)
        entityManager.add(entity: train1)
    }
    
    override func update(_ currentTime: TimeInterval) {
        
        entityManager.update(dt: currentTime)
    }
}
