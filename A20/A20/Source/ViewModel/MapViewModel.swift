//
//  MapViewModel.swift
//  A20
//
//  Created by 드즈 on 2/14/24.
//

import SwiftUI

fileprivate let URLString: String = "https://test.hackathon.sparcs.net/"

//@MainActor // or Task (Main Thread)
class MapViewModel: ObservableObject {
    @Published var parkingInfo: ParkingInfo
    @Published var parkingDetail: ParkingDetail
    
    var lat: String = ""
    var lon: String = ""
    
    var ids: String = ""
    
    var infoURLString: String = "https://test.hackathon.sparcs.net/parkinglot/init?lat={위도}&lon={경도}"
    var detailURLString: String = "https://test.hackathon.sparcs.net/parkinglot/:id"
    
    init(parkingInfoDataString: ParkingInfo, parkingDetailDataString: ParkingDetail) {
        self.parkingInfo = parkingInfoDataString
        self.parkingDetail = parkingDetailDataString
    }
    
    func fetchParkingInfo() async throws -> Void {
        infoURLString = "https://test.hackathon.sparcs.net/parkinglot/init?lat=\(self.lat)&lon=\(self.lon)"
        
        print(infoURLString)
        
        // URL
        guard let URL = URL(string: infoURLString) else {
            throw DataFetchError.invalidURL
        }
        
        // Request
        var Request = URLRequest(url: URL)
        Request.httpMethod = "GET"
        Request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // Session
        let (data, _) = try await URLSession.shared.data(for: Request)
        
        // Decoding
        print("DEBUG: \(String(data: data, encoding: .utf8))")
        let decodedData = try JSONDecoder().decode(ParkingInfo.self, from: data)
        
        // Task (Main Thread)
        DispatchQueue.main.async {
            self.parkingInfo = decodedData
        }
        
        return
    }
    
    func fetchParkingDetail() async throws -> Void {
        detailURLString = "https://test.hackathon.sparcs.net/parkinglot/\(self.ids)"
        
        print(URLString)
        
        // URL
        guard let URL = URL(string: URLString) else {
            throw DataFetchError.invalidURL
        }
        
        // Request
        var Request = URLRequest(url: URL)
        Request.httpMethod = "GET"
        Request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // Session
        let (data, _) = try await URLSession.shared.data(for: Request)
        
        // Decoding
        print("DEBUG: \(String(data: data, encoding: .utf8))")
        let decodedData = try JSONDecoder().decode(ParkingDetail.self, from: data)
        
        // Task (Main Thread)
        DispatchQueue.main.async {
            self.parkingDetail = decodedData
        }
        
        return
    }
}
