//
//  AppDelegate.swift
//  Datecalculator
//
//  Created by Patrick Claessens on 07/05/2019.
//  Copyright © 2019 Patrick Claessens. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        statusItem.button?.title = "🗓"
        statusItem.button?.target = self
        statusItem.button?.action = #selector(showDateCalculator)
        //statusItem.behavior = .removalAllowed
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    @objc func showDateCalculator() {
        let storyboard = NSStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateController(withIdentifier: "ViewController") as? ViewController else {
            fatalError("Unable to find viewcontroller in storyboard.")
        }
        guard let button = statusItem.button else {
            fatalError("Couldn't find status item button.")
        }
        let popoverView = NSPopover()
        popoverView.contentViewController = vc
        popoverView.behavior = .transient
        popoverView.show(relativeTo: button.bounds, of: button, preferredEdge: .maxY)
    }
    
    

}

