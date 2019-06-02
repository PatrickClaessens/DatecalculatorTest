//
//  AddSubtractViewController.swift
//  DateCalculator
//
//  Created by Patrick Claessens on 18/05/2019.
//  Copyright © 2019 Patrick Claessens. All rights reserved.
//

import Cocoa

class AddSubtractViewController: NSViewController, NSTextFieldDelegate {

    var multiplier = 1 // Add: 1 subtract: -1
    
    let df: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "EEE"
        return df
    }()
    
    @IBOutlet var weekdayLabel: NSTextField!
    @IBOutlet var datePicker: NSDatePicker!
    
    @IBOutlet var yearsTextField: NSTextField!
    @IBOutlet var yearsStepper: NSStepper!
    
    @IBOutlet var monthsTextField: NSTextField!
    @IBOutlet var monthsStepper: NSStepper!
    
    @IBOutlet var daysTextField: NSTextField!
    @IBOutlet var daysStepper: NSStepper!
   
    @IBOutlet var newDateTextField: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDatePicker()
    }
    
    func setupDatePicker() {
        datePicker.dateValue = Date()
        datePicker.target = self
        datePicker.action = #selector(updateLabels)
        yearsStepper.integerValue = 0
        monthsStepper.integerValue = 0
        daysStepper.integerValue = 0
        updateLabels()
    }
    
   func controlTextDidEndEditing(_ notification: Notification) {
        updateSteppers()
    }
    
    @IBAction func radioButtonToggled(_ sender: NSButton) {
        multiplier *= -1
        updateLabels()
    }
    @IBAction func stepperClicked(_ sender: NSStepper) {
        updateLabels()
    }
    
    @objc func updateLabels() {
        yearsTextField.integerValue = yearsStepper.integerValue
        monthsTextField.integerValue = monthsStepper.integerValue
        daysTextField.integerValue = daysStepper.integerValue
        weekdayLabel.stringValue = df.string(from: datePicker.dateValue)
        newDateTextField.stringValue = newDate()
    }
    
    func updateSteppers() {
        yearsStepper.integerValue = yearsTextField.integerValue
        monthsStepper.integerValue = monthsStepper.integerValue
        daysStepper.integerValue = daysTextField.integerValue
        updateLabels()
    }
    
    func newDate() -> String {
        let years = yearsStepper.integerValue
        let months = monthsStepper.integerValue
        let days = daysStepper.integerValue
        let startDate = datePicker.dateValue
        
        guard years + months + days > 0 else {
            newDateTextField.isHidden = true
            return ""
        }
        
        let calendar = Calendar.current
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .full
        var dateComponents = DateComponents()
        dateComponents.year = years * multiplier
        dateComponents.month = months * multiplier
        dateComponents.day = days * multiplier
        let newDate = calendar.date(byAdding: dateComponents, to: startDate)
        newDateTextField.isHidden = false
        return dateFormatter.string(from: newDate ?? Date())
     }
}
