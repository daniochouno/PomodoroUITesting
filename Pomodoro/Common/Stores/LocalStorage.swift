//
//  LocalStorage.swift
//  Pomodoro
//
//  Created by daniel.martinez on 15/9/15.
//  Copyright © 2015 com.igz. All rights reserved.
//

import Foundation

private let _LocalStorageSharedInstance = LocalStorage()

class LocalStorage : NSObject {
    
    // Default values:
    var minutes: Int = 2
    var seconds: Int = 0
    
    static let sharedInstance = LocalStorage()
    
}