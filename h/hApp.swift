//
//  hApp.swift
//  h
//
//  Created by 袁禹 on 2024/9/10.
//

import SwiftUI
import AppKit

@main
struct hApp: App {
    @State private var statusItem: NSStatusItem?
    let appDelegate = AppDelegate()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    setupStatusBarItem()
                }
        }
        .commands {
            CommandGroup(replacing: .newItem) {}
        }
    }
    
    private func setupStatusBarItem() {
        if statusItem == nil {
            statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
            
            if let button = statusItem?.button {
                button.image = NSImage(systemSymbolName: "star.fill", accessibilityDescription: "Status Bar Icon")
            }
            
            let menu = NSMenu()
            let donateItem = NSMenuItem(title: "Donate", action: #selector(AppDelegate.donate), keyEquivalent: "d")
            donateItem.target = appDelegate
            menu.addItem(donateItem)
            
            let settingsItem = NSMenuItem(title: "Settings", action: #selector(AppDelegate.openSettings), keyEquivalent: "s")
            settingsItem.target = appDelegate
            menu.addItem(settingsItem)
            
            menu.addItem(NSMenuItem.separator())
            menu.addItem(NSMenuItem(title: "Quit", action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q"))
            statusItem?.menu = menu
        }
    }
   
}

class AppDelegate: NSObject {
    var settingsWindow: NSWindow?

    @objc func donate() {
        // Implement donation logic here
        print("Donate action triggered")
    }
    
    @objc func openSettings() {
        if settingsWindow == nil {
            let contentView = NSHostingView(rootView: SettingsView())
            
            settingsWindow = NSWindow(
                contentRect: NSRect(x: 100, y: 100, width: 800, height: 600),
                styleMask: [.titled, .closable, .miniaturizable, .resizable],
                backing: .buffered,
                defer: false
            )
            settingsWindow?.title = "设置"
            settingsWindow?.contentView = contentView
            settingsWindow?.minSize = NSSize(width: 800, height: 600)
            settingsWindow?.maxSize = NSSize(width: 800, height: 600)
        }
        
        settingsWindow?.setFrame(NSRect(x: 100, y: 100, width: 800, height: 600), display: true)
        settingsWindow?.makeKeyAndOrderFront(nil)
    }
}
