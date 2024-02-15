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
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 36.374299921337936, longitude: 127.3656787132686), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    
    @State private var searchText: String = ""
    
    @State private var share: Bool = false
    
    var body: some View {
        NavigationStack {
            Map(coordinateRegion: $region, showsUserLocation: true)
                .overlay (
                    ZStack {
                        Rectangle()
                            .frame(width: 331, height: 48)
                            .cornerRadius(12)
                            .foregroundColor(.white)
                            .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                        HStack(spacing: 10) {
                            Image("Search")
                                .resizable()
                                .frame(width: 24, height: 24)
                            TextField("대전구 유성동", text: $searchText)
                                .frame(width: 253, height: 24)
                        }
                    }
                        .offset(x: 0, y: -300)
                )
                .overlay (
                    NavigationLink {
                        TimeView()
//                        self.share = true
                    } label: {
                        ZStack {
                            Rectangle()
                                .frame(width: 156, height: 40)
                                .cornerRadius(20)
                                .foregroundColor(.white)
                                .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                            HStack(spacing: 5) {
                                Image("ParkingLocation")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                Text("내 주차장 공유하기")
                                    .font(Font.custom("PretendardVariable", size: 12))
                                    .frame(width: 102, height: 24)
                                    .foregroundColor(.black)
                            }
                        }
                    }
                        .offset(x: -87.5, y: -240)
                )
                .overlay (
                    NavigationLink {
                        BuyView()
                    } label: {
                        Image("Target")
                            .resizable()
                            .frame(width: 36, height: 36)
                    }
                        .offset(x: 140, y: -240)
                )
//        Map(position: $cameraPosition, selection: $mapSelection) {
////            Marker("My location", systemImage: "paperplane", coordinate: .userLocation)
////                .tint(.blue)
//                        
//            Annotation("My location", coordinate: .userLocation) {
//                Image("Pin")
//                    .frame(width: 33.63528, height: 42.01764)
//                //                  .background(Color(red: 0.34, green: 0.37, blue: 0.98))
//                //                ZStack {
//                //                    Circle()
//                //                        .frame(width: 32, height: 32)
//                //                        .foregroundColor(.blue.opacity(0.25))
//                //
//                //                    Circle()
//                //                        .frame(width: 20, height: 20)
//                //                        .foregroundColor(.white)
//                //
//                //                    Circle()
//                //                        .frame(width: 12, height: 12)
//                //                        .foregroundColor(.blue)
//                //                }
//                }
//            }
        }
        .toolbarBackground(Color.white, for: .tabBar)
//        .navigationDestination(isPresented: $share, destination: {
//            TimeView()
//        })
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
