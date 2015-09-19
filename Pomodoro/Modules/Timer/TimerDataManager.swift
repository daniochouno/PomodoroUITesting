//
//  TimerDataManager.swift
//  Pomodoro
//
//  Created by daniel.martinez on 15/9/15.
//  Copyright © 2015 com.igz. All rights reserved.
//

import Foundation

private let _TimerDataManagerSharedInstance = TimerDataManager()

class TimerDataManager : NSObject {
    
    var storage: LocalStorage
    
    static let sharedInstance = TimerDataManager()
    
    override init() {
        self.storage = LocalStorage.sharedInstance
        super.init()
    }
    
    func currentValues(completion: (([Int]) -> Void)!) {
        let minutes = self.storage.minutes
        let seconds = self.storage.seconds
        completion( [ minutes, seconds ] )
    }
    
}