//
//  LocationManager.swift
//  EmployeeAttendance
//
//  Created by James Austin Jr. on 6/29/26.
//

import CoreLocation

@Observable
class LocationManager: NSObject, CLLocationManagerDelegate {
    @ObservationIgnored
    private let manager = CLLocationManager()
    var lastKnownLocation: CLLocationCoordinate2D?
    
    // Reference: https://gist.github.com/robertmryan/e70aef8595fd79ad30f773c876d155a5
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        let status = manager.authorizationStatus
        if status == .authorizedAlways || status == .authorizedWhenInUse {
            manager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        lastKnownLocation = locations.last?.coordinate
    }
}
