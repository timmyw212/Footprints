//
//  ContentView.swift
//  roadtrip
//
//  Created by Kevin Bui on 3/23/24.
//

import MapKit
import SwiftUI
import CoreLocation

struct ContentView: View {
    @StateObject var manager = LocationManager()
    
    @State var tracking = false
    
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
                    
                }
            label: {Text("Start Trackering")
                    .fontWeight(.bold)
                    .font(.title2)
            }
                Spacer()
                Button {
                    
                }
            label: {Text("Stop Tracking")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .font(.title2)
                
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
