//
//  SettingsViewController.swift
//  Pomodoro
//
//  Created by daniel.martinez on 15/9/15.
//  Copyright © 2015 com.igz. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, SettingsInteractorOutput {
    
    @IBOutlet weak var minutes: UITextField!
    @IBOutlet weak var seconds: UITextField!
    
    var interactor = SettingsInteractor()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
    func initialize() {
        interactor.output = self
        interactor.currentValues()
    }
    
    func currentValuesRetrieved(values: [Int]) {
        minutes.text = String(format: "%02d", values[0])
        seconds.text = String(format: "%02d", values[1])
    }
    
    @IBAction func cancel(sender: UIBarButtonItem) {
        pop()
    }
    
    @IBAction func save(sender: UIBarButtonItem) {
        let _minutes = Int(minutes.text!)
        let _seconds = Int(seconds.text!)
        interactor.storeValues( [ _minutes!, _seconds! ] )
    }
    
    func storedValues() {
        pop()
    }
    
    func pop() {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
}