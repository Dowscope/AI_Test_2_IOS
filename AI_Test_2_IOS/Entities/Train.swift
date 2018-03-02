//
//  Train.swift
//  AI_Test_2_IOS
//
//  Created by Timothy Dowling on 2018-03-01.
//  Copyright © 2018 Timothy Dowling. All rights reserved.
//

import GameplayKit

class Train: GKEntity {

    init(startingPosition: CGPoint, color: SKColor, path: GKPath){
        super.init()
        
        addComponent(SpriteComponent(startingPoint: startingPosition, color: color))
        addComponent(FollowComponet(maxSpeed: 0.00001, maxAccel: 0.001, radius: 32 + 32 * 0.3, path: path))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func update(deltaTime seconds: TimeInterval) {
        for component in components {
            component.update(deltaTime: seconds)
        }
    }
}
