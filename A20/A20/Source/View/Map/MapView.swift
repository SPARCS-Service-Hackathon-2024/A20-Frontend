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
                    isShared: $0.isShared.lowercased() == "true"
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
                Button {
                    
                } label: {
                    Image("Target")
                        .resizable()
                        .frame(width: 36, height: 36)
                }
                    .offset(x: 140, y: -240)
            )
            .overlay (
                Button (action: {
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
                }, label: {
                    Circle()
                        .foregroundColor(.yellow)
                })
                .offset(x: 0, y: 0)
            )
            .onAppear {
                
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

//import SwiftUI
//import MapKit
//
//struct AroundView: View {
//    @StateObject var mapViewModel = MapViewModel(parkingInfoDataString: ParkingInfo(arrayLiteral: ParkingInfoElement(lat: "", lon: "", id: "", isShared: "")))
//
//    @State private var cameraPosition: MapCameraPosition = .region(MKCoordinateRegion(center: .customLocation, span: 0.5))
////    @State private var searchText = ""
////    @State private var results = [MKMapItem]()
//    @State private var mapSelection: MKMapItem?
//    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 36.374299921337936, longitude: 127.3656787132686), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
//
//    @State private var searchText: String = ""
//
//    @State private var share: Bool = false
//
//    @Binding var locationManager: LocationManager
//
//    var body: some View {
//        NavigationStack {
//            Map(position: $cameraPosition, selection: $mapSelection) {
////                Marker("My location", systemImage: "paperplane", coordinate: .userLocation)
////                //                .tint(.blue)
//                Annotation("My location", coordinate: locationManager.userLocation ?? CLLocationCoordinate2D(latitude: 36.374299921337936, longitude: 127.3656787132686)) {
//                    Image("Pin")
//                        .frame(width: 33.63528, height: 42.01764)
//                                      .background(Color(red: 0.34, green: 0.37, blue: 0.98))
//                                    ZStack {
//                                        Circle()
//                                            .frame(width: 32, height: 32)
//                                            .foregroundColor(.red.opacity(0.25))
//
//                                        Circle()
//                                            .frame(width: 20, height: 20)
//                                            .foregroundColor(.white)
//
//                                        Circle()
//                                            .frame(width: 12, height: 12)
//                                            .foregroundColor(.red)
//                                    }
//                }
//            }
//            .overlay (
//                ZStack {
//                    Rectangle()
//                        .frame(width: 331, height: 48)
//                        .cornerRadius(12)
//                        .foregroundColor(.white)
//                        .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
//                    HStack(spacing: 10) {
//                        Image("Search")
//                            .resizable()
//                            .frame(width: 24, height: 24)
//                        TextField("대전구 유성동", text: $searchText)
//                            .frame(width: 253, height: 24)
//                    }
//                }
//                    .offset(x: 0, y: -300)
//            )
//            .overlay (
//                NavigationLink {
//                    TimeView()
////                        self.share = true
//                } label: {
//                    ZStack {
//                        Rectangle()
//                            .frame(width: 156, height: 40)
//                            .cornerRadius(20)
//                            .foregroundColor(.white)
//                            .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
//                        HStack(spacing: 5) {
//                            Image("ParkingLocation")
//                                .resizable()
//                                .frame(width: 24, height: 24)
//                            Text("내 주차장 공유하기")
//                                .font(Font.custom("PretendardVariable", size: 12))
//                                .frame(width: 102, height: 24)
//                                .foregroundColor(.black)
//                        }
//                    }
//                }
//                    .offset(x: -87.5, y: -240)
//            )
//            .overlay (
//                NavigationLink {
//                    BuyView()
//                } label: {
//                    Image("Target")
//                        .resizable()
//                        .frame(width: 36, height: 36)
//                }
//                    .offset(x: 140, y: -240)
//            )
//            // NavigationStack 바로 안쪽에 생성
//            .onAppear {
//                self.cameraPosition = locationManager.userLocation
//                mapViewModel.lat = locationManager.getLatitudeString()
//                mapViewModel.lon = locationManager.getLongitudeString()
//                Task {
//                    do {
//                        try await mapViewModel.fetchParkingInfo()
//                    } catch {
//                        print("Error fetching data: \(error)")
//                    }
//                }
//            }
//        }
//        .toolbarBackground(Color.white, for: .tabBar)
//    }
//}
//
//extension CLLocationCoordinate2D {
//    static var customLocation: CLLocationCoordinate2D {
//        return .init(latitude: 36.374299921337936, longitude: 127.3656787132686)
//    }
//}
//
//extension MKCoordinateRegion {
//    static var customLocation: MKCoordinateRegion {
//        return .init(center: .customLocation, latitudinalMeters: 10000, longitudinalMeters: 10000)
//    }
//}
//
//
////#Preview {
////    MapView()
////}
