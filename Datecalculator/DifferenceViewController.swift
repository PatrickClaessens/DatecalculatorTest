//
//  DifferenceViewController.swift
//  DateCalculator
//
//  Created by Patrick Claessens on 12/05/2019.
//  Copyright © 2019 Patrick Claessens. All rights reserved.
//

import Cocoa

class DifferenceViewController: NSViewController {
    
    @IBOutlet var startDayLabel: NSTextField!
    @IBOutlet var startDatePicker: NSDatePicker!
    @IBOutlet var endDateLabel: NSTextField!
    @IBOutlet var endDatePicker: NSDatePicker!
    @IBOutlet var differenceLabel: NSTextField!
    @IBOutlet var differenceInDaysLabel: NSTextField!
    
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
        startDatePicker.dateValue = now
        endDatePicker.dateValue = now
        updateLabels()
    }
    
    @objc func datePickerChanged(_ datePicker: NSDatePicker!) {
        updateLabels()
    }
    
    func updateLabels() {
        // Dees kan beter Claessens 🤨
        let startDate = startDatePicker.dateValue
        let endDate = endDatePicker.dateValue
        
        guard startDate != endDate else {
            differenceInDaysLabel.isHidden = true
            differenceLabel.stringValue = ""
            return
        }
        
        dateComponentFormatter.allowedUnits = [.year, .month, .day]
        differenceLabel.stringValue = dateComponentFormatter.string(from: startDate, to: endDate)!
        dateComponentFormatter.allowedUnits = [.day]
        differenceInDaysLabel.stringValue = dateComponentFormatter.string(from: startDate, to: endDate)!
        differenceInDaysLabel.isHidden = differenceInDaysLabel.stringValue == differenceLabel.stringValue
        startDayLabel.stringValue = dateFormatter.string(from: startDate)
        endDateLabel.stringValue = dateFormatter.string(from: endDate)
    }
}
