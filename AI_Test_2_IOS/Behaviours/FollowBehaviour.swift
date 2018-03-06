//
//  FollowBehaviour.swift
//  AI_Test_2_IOS
//
//  Created by Timothy Dowling on 2018-03-01.
//  Copyright © 2018 Timothy Dowling. All rights reserved.
//

import GameplayKit

class FollowBehaviour: GKBehavior {
    
    init(maxSpeed: Float, path: GKPath) {
        super.init()
        
        setWeight(1.0, for: GKGoal(toStayOn: path, maxPredictionTime: 1000.0))
        setWeight(1.0, for: GKGoal(toFollow: path, maxPredictionTime: 1000.0, forward: true))
    }
}
