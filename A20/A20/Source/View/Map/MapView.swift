//
//  MapView.swift
//  A20
//
//  Created by 드즈 on 2/16/24.
//

import SwiftUI
import MapKit

struct ParkingInfoCoordinator: Identifiable {
    var id: String
    var coordinate: CLLocationCoordinate2D
    var isShared: Bool
}

struct MapView: View {
    @EnvironmentObject var locationManager: LocationManager
    @EnvironmentObject var mapViewModel: MapViewModel
    
    @State private var searchText: String = ""
    
    var parkingData: [ParkingInfoCoordinator] {
        mapViewModel.parkingInfo.map {
            ParkingInfoCoordinator(
                id: $0.id,
                coordinate: CLLocationCoordinate2D(latitude: Double($0.lat) ?? 0.0, longitude: Double($0.lon) ?? 0.0),
                isShared: $0.isShared.lowercased() == "true" // Treat isShared as Bool
            )
        }
    }
    
    @State private var click: Bool = false
    
    @State private var shared: Bool = false
    
    var body: some View {
        NavigationStack {
            Map(coordinateRegion: .constant(createRegion()), showsUserLocation: true, annotationItems: parkingData) { parkingInfo in
                MapAnnotation(coordinate: parkingInfo.coordinate) {
                    Button {
                        mapViewModel.ids = parkingInfo.id
                        Task {
                            do {
                                try await mapViewModel.fetchParkingDetail()
                            } catch {
                                print("Error fetching parking information: \(error)")
                            }
                        }
                        click = true
                    } label: {
                        if parkingInfo.isShared {
                            ZStack {
                                Image("Union")
                                ZStack {
                                    HStack {
                                        ZStack {
                                            Circle()
                                                .frame(width: 31, height: 31)
                                                .foregroundColor(Color(red: 0.06, green: 0, blue: 0.42))
                                            Text("공유")
                                                .font(Font.custom("PretendardVariable", size: 12))
                                                .foregroundColor(.white)
                                        }
                                        Spacer()
                                    }
                                }
                                .padding(.bottom, 7.5)
                                .padding(.leading, 5)
                            }
                            .frame(width: 81, height: 81)
                        } else {
                            Image("Pin")
                                .frame(width: 33, height: 42)
                        }
                    }
                }
            }
            .sheet(isPresented: $click, content: {
                SelectView()
            })
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
                    InfoView()
                } label: {
                    if shared {
                        ZStack {
                            Rectangle()
                                .frame(width: 104, height: 40)
                                .cornerRadius(20)
                                .foregroundColor(.white)
                                .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                            HStack(spacing: 5) {
                                Image("ParkingLocation")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                Text("내 주차장")
                                    .frame(width: 52, height: 24)
                                    .font(Font.custom("PretendardVariable", size: 12))
                                    .foregroundColor(.black)
                            }
                        }
                    } else {
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
                }
                    .offset(x: -87.5, y: -240)
            )
            .overlay (
                NavigationLink /*Button*/ {
                    SelectView()
                } label: {
                    Image("Target")
                        .resizable()
                        .frame(width: 36, height: 36)
                }
                    .offset(x: 140, y: -240)
            )
            .onAppear {
                locationManager.requestLocationPermission()
                
                mapViewModel.lat = locationManager.getCurrentLatitudeString() ?? ""
                mapViewModel.lon = locationManager.getCurrentLongitudeString() ?? ""
                
                Task {
                    do {
                        try await mapViewModel.fetchParkingInfo()
                    } catch {
                        print("Error fetching parking information: \(error)")
                    }
                }
                print(locationManager.userLocation ?? "")
            }
        }
    }

    private func createRegion() -> MKCoordinateRegion {
        if let userLocation = locationManager.userLocation {
            return MKCoordinateRegion(center: userLocation, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
        } else {
            return MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 36.353853, longitude: 127.34260), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
        }
    }
}
