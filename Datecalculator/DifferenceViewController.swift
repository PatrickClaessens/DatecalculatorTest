//
//  DifferenceViewController.swift
//  DateCalculator
//
//  Created by Patrick Claessens on 12/05/2019.
//  Copyright © 2019 Patrick Claessens. All rights reserved.
//

import Cocoa

class DifferenceViewController: NSViewController {
    
    @IBOutlet var fromDayLabel: NSTextField!
    @IBOutlet var fromDatePicker: NSDatePicker!
    @IBOutlet var toDayLabel: NSTextField!
    @IBOutlet var toDatePicker: NSDatePicker!
    @IBOutlet var differenceLabel: NSTextField!
    @IBOutlet var differenceInDaysLabel: NSTextField!
    
    var from: Date {
        return fromDatePicker.dateValue
    }
    var to: Date {
        return toDatePicker.dateValue
    }
    
    let dateFormatter: DateFormatter = {
        let fd = DateFormatter()
        fd.timeStyle = .none
        fd.dateFormat = "EEE"
        return fd
    }()
    
    let dateComponentFormatter: DateComponentsFormatter = {
        let dcf = DateComponentsFormatter()
        dcf.unitsStyle = .full
        dcf.allowedUnits = [.day]
        return dcf
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let now = Date()
        fromDatePicker.dateValue = now
        toDatePicker.dateValue = now
        updateLabels()
        
    }
    
    @objc func datePickerChanged(_ datePicker: NSDatePicker!) {
        updateLabels()
    }
    
    func updateLabels() {
        guard from != to else {
            differenceInDaysLabel.isHidden = true
            differenceLabel.stringValue = ""
            return
        }
        
        dateComponentFormatter.allowedUnits = [.year, .month, .day]
        differenceLabel.stringValue = dateComponentFormatter.string(from: from, to: to)!
        dateComponentFormatter.allowedUnits = [.day]
        differenceInDaysLabel.stringValue = dateComponentFormatter.string(from: from, to: to)!
        

        differenceInDaysLabel.isHidden = differenceInDaysLabel.stringValue == differenceLabel.stringValue
        
        fromDayLabel.stringValue = dateFormatter.string(from: from)
        toDayLabel.stringValue = dateFormatter.string(from: to)
    }
}
