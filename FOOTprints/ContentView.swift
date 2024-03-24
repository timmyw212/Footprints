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
    
    @State var travelMeth = Double()
    @State var selection = true
    
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
                    .disabled(!tracking)
            }
                Spacer()
                HStack {
                    Button {
                        travelMeth = 4.0
                        selection = false
                    }
                label: { Text("Walk")
                        .font(.headline)
                            .frame(minWidth: 0, maxWidth: 100, minHeight: 60, maxHeight: 60)
                        .accentColor(.blue)
                        .cornerRadius(30)
}
                    Button {
                        travelMeth = 2.0
                        selection = false
                    }
                label: { Text("Train")
                        .font(.headline)
                            .frame(minWidth: 0, maxWidth: 100, minHeight: 60, maxHeight: 60)
                        .accentColor(.blue)
                        .cornerRadius(30)}
                    Button {
                        travelMeth = 1.0
                        selection = false
                    }
                label: { Text("Bus")
                        .font(.headline)
                            .frame(minWidth: 0, maxWidth: 100, minHeight: 60, maxHeight: 60)
                        .accentColor(.blue)
                        .cornerRadius(30)}
                    Button {
                        travelMeth = 0.5
                        selection = false
                    }
                label: { Text("Car")
                        .font(.headline)
                            .frame(minWidth: 0, maxWidth: 100, minHeight: 60, maxHeight: 60)
                        .accentColor(.blue)
                        .cornerRadius(30)
                        
                }
                }
                Spacer()
                Button {
                    pos2 = manager.region.center
                    dist = pos1.distance(from: pos2)
                    user.distanceTraveled = dist
                    user.points = travelMeth
                    print(dist)
                    try? codableFiles.save(user, withFilename: fileName)
                    tracking = true
                    selection = true
                }
            label: {Text("Stop Tracking")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .font(.title2)
                    .disabled(tracking || selection)
                
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
