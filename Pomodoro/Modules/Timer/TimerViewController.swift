//
//  ViewController.swift
//  Pomodoro
//
//  Created by daniel.martinez on 15/9/15.
//  Copyright © 2015 com.igz. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController, TimerInteractorOutput {

    @IBOutlet weak var minutes: UILabel!
    @IBOutlet weak var seconds: UILabel!
    @IBOutlet weak var actionName: UILabel!
    
    var timer: NSTimer?
    
    var interactor = TimerInteractor()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewWillAppear(animated: Bool) {
        initialize()
    }
    
    override func viewDidDisappear(animated: Bool) {
        stop()
    }
    
    func setup() {
        interactor.output = self
    }
    
    func initialize() {
        interactor.currentValues()
    }
    
    func currentValuesRetrieved(values: [Int]) {
        minutes.text = String(format: "%02d", values[0])
        seconds.text = String(format: "%02d", values[1])
    }
    
    @IBAction func tapOn(button: AnyObject) {
        if (timer != nil) {
            stop()
        } else {
            start()
        }
    }
    
    func start() {
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("update:"), userInfo: nil, repeats: true)
        actionName.text = "reset"
    }
    
    func stop() {
        if (timer != nil) {
            timer?.invalidate()
            timer = nil
        }
        actionName.text = "start"
        initialize()
    }
    
    func update(timer: NSTimer) {
        var _seconds = Int(seconds.text!)!
        if (_seconds == 0) {
            var _minutes = Int(minutes.text!)!
            if (_minutes == 0) {
                snooze()
            } else {
                _minutes = _minutes - 1
            }
            minutes.text = String(format: "%02d", _minutes)
            _seconds = 59
        } else {
            _seconds = _seconds - 1
        }
        seconds.text = String(format: "%02d", _seconds)
    }
    
    func snooze() {
        print("Snooze!!!!")
        stop()
    }

}

