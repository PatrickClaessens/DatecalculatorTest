//
//  ViewController.swift
//  DateCalculator
//
//  Created by Patrick Claessens on 07/05/2019.
//  Copyright © 2019 Patrick Claessens. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    weak var tabVC: NSTabViewController?
    
    @IBOutlet var popUpButton: NSPopUpButton!
    @IBOutlet var containerView: NSView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func popUpButtonChanged(_ sender: NSPopUpButton) {
        tabVC?.selectedTabViewItemIndex = sender.indexOfSelectedItem
    }
    override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
        tabVC = segue.destinationController as? NSTabViewController
    }
}

