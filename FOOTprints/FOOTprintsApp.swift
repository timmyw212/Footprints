//
//  roadtripApp.swift
//  roadtrip
//
//  Created by Kevin Bui on 3/23/24.
//

import SwiftUI

@main
struct FOOTprintsApp: App {
    @StateObject var locationManager = LocationManager()
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
