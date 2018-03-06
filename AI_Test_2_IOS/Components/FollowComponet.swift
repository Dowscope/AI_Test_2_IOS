//
//  FollowComponet.swift
//  AI_Test_2_IOS
//
//  Created by Timothy Dowling on 2018-03-01.
//  Copyright © 2018 Timothy Dowling. All rights reserved.
//

import GameplayKit

class FollowComponet: GKAgent2D, GKAgentDelegate {

    var path: GKPath
    
    init(maxSpeed: Float, maxAccel: Float, radius: Float, path: GKPath) {
        self.path = path
        
        super.init()
        
        delegate = self
        self.maxSpeed = maxSpeed
        self.maxAcceleration = maxAccel
        self.radius = radius
        mass = 0.1
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func agentWillUpdate(_ agent: GKAgent) {
        if let sprite = entity?.component(ofType: SpriteComponent.self)?.node {
            position = sprite.position.toFloat2
        }
    }
    
    func agentDidUpdate(_ agent: GKAgent) {
        if let sprite = entity?.component(ofType: SpriteComponent.self)?.node {
            sprite.position = position.toCGPoint
        }
    }
    
    override func update(deltaTime seconds: TimeInterval) {
        super.update(deltaTime: seconds)
        
        behavior = FollowBehaviour(maxSpeed: maxSpeed, path: path)
    }
    
    func updatePath(_ path: GKPath){
        self.path = path
    }
}

extension CGPoint {
    var toFloat2: float2 {
        return float2(x: Float(self.x), y: Float(self.y))
    }
}

extension float2 {
    var toCGPoint: CGPoint {
        return CGPoint(x: CGFloat(self.x), y: CGFloat(self.y))
    }
}

extension GKGraphNode2D {
    var toCGPoint: CGPoint {
        return self.position.toCGPoint
    }
}
