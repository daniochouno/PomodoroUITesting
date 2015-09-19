//
//  SettingsInteractor.swift
//  Pomodoro
//
//  Created by daniel.martinez on 15/9/15.
//  Copyright © 2015 com.igz. All rights reserved.
//

import Foundation

protocol SettingsInteractorInput {
    func currentValues()
    func storeValues(values: [Int])
}

protocol SettingsInteractorOutput {
    func currentValuesRetrieved(values: [Int])
    func storedValues(isOK: Bool)
}

class SettingsInteractor: NSObject, SettingsInteractorInput {

    var output: SettingsInteractorOutput?
    var dataManager: SettingsDataManager
    
    override init() {
        self.dataManager = SettingsDataManager.sharedInstance
        super.init()
    }
    
    func currentValues() {
        dataManager.currentValues( { values in
            self.output?.currentValuesRetrieved(values)
        } )
    }
    
    func storeValues(values: [Int]) {
        dataManager.storeValues(values, completion: { isOK in
            self.output?.storedValues(isOK)
        } )
    }

}