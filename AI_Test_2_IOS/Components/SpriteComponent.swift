//
//  SpriteComponent.swift
//  AI_Test_2_IOS
//
//  Created by Timothy Dowling on 2018-03-01.
//  Copyright © 2018 Timothy Dowling. All rights reserved.
//

import GameplayKit

class SpriteComponent: GKComponent {
    
    var node: SKShapeNode
    
    init(startingPoint: CGPoint, color: SKColor){
        node = SKShapeNode(rectOf: CGSize(width: 32, height: 32))
        super.init()
        
        node.fillColor = color
        node.lineWidth = 0
        node.position = startingPoint
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
