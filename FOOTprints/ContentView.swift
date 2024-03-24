//
//  ContentView.swift
//  roadtrip
//
//  Created by Kevin Bui on 3/23/24.
//

import MapKit
import SwiftUI
import CoreLocation
import CodableFiles

struct ContentView: View {
    @StateObject var manager = LocationManager()

    let codableFiles = CodableFiles.shared
    @State var fileName = "Users"
    @State var user = User()
    @State var pos1 = CLLocationCoordinate2D()
    @State var pos2 = CLLocationCoordinate2D()
    @State var dist = Double()
    
    @State var tracking = true
    
    var body: some View {
        ZStack {
            Image("tracker_bg")
                .resizable()
                .ignoresSafeArea()
            VStack {
                Image("Footprints_bg")
                    .resizable()
                    .frame(width: 350, height: 200)
                    .foregroundColor(Color.black)
                Spacer()
                Map(initialPosition: MapCameraPosition.region(manager.region)) {
                    UserAnnotation()
                }
                    .edgesIgnoringSafeArea(.all)
                    .frame(width:350, height: 350)
                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                    .padding()
                Spacer()
                Button {
                    user = User(name: "Tim", distanceTraveled: 0)
                    tracking = false
                    pos1 = manager.region.center
                    print(pos1)
                }
            label: {Text("Start Trackering")
                    .fontWeight(.bold)
                    .font(.title2)
            }
                Spacer()
                Button {
                    pos2 = manager.region.center
                    dist = pos1.distance(from: pos2)
                    user.distanceTraveled = dist
                    print(dist)
                    try? codableFiles.save(user, withFilename: fileName)
                    tracking = true
                }
            label: {Text("Stop Tracking")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .font(.title2)
                    .disabled(tracking)
                
            }
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
