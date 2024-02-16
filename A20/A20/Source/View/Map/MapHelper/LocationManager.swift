//
//  LocationManager.swift
//  A20
//
//  Created by 드즈 on 2/16/24.
//

import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private var locationManager = CLLocationManager()
    @Published var userLocation: CLLocationCoordinate2D?

    override init() {
        super.init()
        setupLocationManager()
    }

    func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.startUpdatingLocation()
        // 위치 업데이트 간격을 설정하려면 아래 라인을 추가할 수 있습니다.
        // locationManager.distanceFilter = 10 // 10 미터 이상 이동시에 업데이트
    }

    func requestLocationPermission() {
        locationManager.requestWhenInUseAuthorization()
    }

    func startUpdatingLocation() {
        locationManager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first?.coordinate {
            userLocation = location
        }
    }
    
    // 현재 위치의 위도를 문자열로 반환
        func getCurrentLatitudeString() -> String? {
            guard let latitude = userLocation?.latitude else {
                return nil
            }
            return String(format: "%.6f", latitude)
        }

        // 현재 위치의 경도를 문자열로 반환
        func getCurrentLongitudeString() -> String? {
            guard let longitude = userLocation?.longitude else {
                return nil
            }
            return String(format: "%.6f", longitude)
        }
}
