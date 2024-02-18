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
        // locationManager.distanceFilter = 10
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
    
    func getCurrentLatitudeString() -> String? {
        guard let latitude = userLocation?.latitude else {
            return nil
        }
        return String(format: "%.6f", latitude)
    }
    
    func getCurrentLongitudeString() -> String? {
        guard let longitude = userLocation?.longitude else {
            return nil
        }
        return String(format: "%.6f", longitude)
    }
}
