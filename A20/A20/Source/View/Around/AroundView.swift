//
//  AroundView.swift
//  A20
//
//  Created by 드즈 on 2/13/24.
//

import SwiftUI
import MapKit

struct AroundView: View {
    @State private var cameraPosition: MapCameraPosition = .region(.userRegion)
//    @State private var searchText = ""
//    @State private var results = [MKMapItem]()
    @State private var mapSelection: MKMapItem?
    
    
    var body: some View {
        NavigationStack {
        Map(position: $cameraPosition, selection: $mapSelection) {
//            Marker("My location", systemImage: "paperplane", coordinate: .userLocation)
//                .tint(.blue)
                        
            Annotation("My location", coordinate: .userLocation) {
                Image("Pin")
                    .frame(width: 33.63528, height: 42.01764)
                //                  .background(Color(red: 0.34, green: 0.37, blue: 0.98))
                //                ZStack {
                //                    Circle()
                //                        .frame(width: 32, height: 32)
                //                        .foregroundColor(.blue.opacity(0.25))
                //
                //                    Circle()
                //                        .frame(width: 20, height: 20)
                //                        .foregroundColor(.white)
                //
                //                    Circle()
                //                        .frame(width: 12, height: 12)
                //                        .foregroundColor(.blue)
                //                }
                }
            }
        }
        .toolbarBackground(Color.white, for: .tabBar)
    }
}

extension CLLocationCoordinate2D {
    static var userLocation: CLLocationCoordinate2D {
        return .init(latitude: 36.374299921337936, longitude: 127.3656787132686)
    }
}

extension MKCoordinateRegion {
    static var userRegion: MKCoordinateRegion {
        return .init(center: .userLocation, latitudinalMeters: 10000, longitudinalMeters: 10000)
    }
}


#Preview {
    AroundView()
}
