//
//  HeadspaceyApp.swift
//  Headspacey
//
//  Created by Shriya on 4/15/24.
//

import SwiftUI

@main
struct HeadspaceyApp: App {
    // Initialize the property with a default value
    @State private var isFavorited: Bool = false

    init() {
        // Set the appearance of the tab bar
        UITabBar.appearance().barTintColor = UIColor(red: 5/255, green: 7/255, blue: 38/255, alpha: 1) // Set background color
        UITabBar.appearance().tintColor = .white // Set selected item color
        UITabBar.appearance().unselectedItemTintColor = UIColor(red: 157/255, green: 165/255, blue: 184/255, alpha: 1) // Set unselected item color
        UITabBar.appearance().layoutMargins = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView(isFavorited: $isFavorited)
        }
    }
}
