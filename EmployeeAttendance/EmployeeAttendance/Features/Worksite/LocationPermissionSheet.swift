//
//  WorksitePermissionPopup.swift
//  EmployeeAttendance
//
//  Created by James Austin Jr. on 6/24/26.
//

import CoreLocation
import CoreLocationUI
import SwiftUI

struct LocationPermissionSheet: View {
    @State private var manager = CLLocationManager()
    @State private var locationAvailableToRequest = false
    
    var body: some View {
        
        LocationButton(.currentLocation, action: {
            manager.location?.distance(from: CLLocation(latitude: 37.7749, longitude: -122.4194))
        })
    }
}
