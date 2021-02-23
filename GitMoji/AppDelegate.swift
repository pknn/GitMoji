//
//  AppDelegate.swift
//  GitMoji
//
//  Created by Pakanon Pantisawat on 23/02/2021.
//

import Cocoa
import SwiftUI

@available(OSX 11.0, *)
@main
class AppDelegate: NSObject, NSApplicationDelegate {

    var popover: NSPopover! = NSPopover()
    var statusBarItem: NSStatusItem!


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        initializePopover()
        initializeStatusBarItem()
    }
    
    @objc func togglePopover(_ sender: AnyObject?) {
        if let button = self.statusBarItem.button {
            if self.popover.isShown {
                self.popover.performClose(sender)
            } else {
                self.popover.show(relativeTo: button.bounds, of: button, preferredEdge: .minY)
            }
        }
    }
    
    private func initializePopover() {
        let contentView = ContentView()
        self.popover.contentSize = NSSize(width: 300, height: 400)
        self.popover.behavior = .transient
        self.popover.contentViewController = NSHostingController(rootView: contentView)
    }
    
    private func initializeStatusBarItem() {
        self.statusBarItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        
        if let button = self.statusBarItem.button {
            button.image = NSImage(systemSymbolName: "pencil.circle", accessibilityDescription: "Add Gitmoji")
            button.action = #selector(togglePopover(_:))
        }
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

