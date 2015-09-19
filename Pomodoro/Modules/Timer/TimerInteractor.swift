//
//  TimerInteractor.swift
//  Pomodoro
//
//  Created by daniel.martinez on 15/9/15.
//  Copyright © 2015 com.igz. All rights reserved.
//

import Foundation

protocol TimerInteractorInput {
    func currentValues()
}

protocol TimerInteractorOutput {
    func currentValuesRetrieved(values: [Int])
}

class TimerInteractor: NSObject, TimerInteractorInput {
    
    var output: TimerInteractorOutput?
    var dataManager: TimerDataManager
    
    override init() {
        self.dataManager = TimerDataManager.sharedInstance
        super.init()
    }
    
    func currentValues() {
        dataManager.currentValues( { values in
            self.output?.currentValuesRetrieved(values)
        } )
    }
    
}