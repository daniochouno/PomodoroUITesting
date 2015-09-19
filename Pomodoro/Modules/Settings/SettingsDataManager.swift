//
//  SettingsDataManager.swift
//  Pomodoro
//
//  Created by daniel.martinez on 15/9/15.
//  Copyright © 2015 com.igz. All rights reserved.
//

import Foundation

private let _SettingsDataManagerSharedInstance = SettingsDataManager()

class SettingsDataManager : NSObject {
    
    var storage: LocalStorage
    
    static let sharedInstance = SettingsDataManager()
    
    override init() {
        self.storage = LocalStorage.sharedInstance
        super.init()
    }
    
    func currentValues(completion: (([Int]) -> Void)!) {
        let minutes = self.storage.minutes
        let seconds = self.storage.seconds
        completion( [ minutes, seconds ] )
    }
    
    func storeValues(values: [Int], completion: (Void -> Void)!) {
        if (values.count == 2) {
            self.storage.minutes = values[0]
            self.storage.seconds = values[1]
        }
        completion()
    }
    
}