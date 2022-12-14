//
//  MainView.swift
//  MapMarker
//
//  Created by kxx: on 2022/12/14.
//

import SwiftUI
import MapKit

struct MainView: View {
    let place: IdentifiablePlace
    @State var region: MKCoordinateRegion

    
    var body: some View {
        Map(coordinateRegion: $region,
                  annotationItems: [place])
        { place in
            MapAnnotation(coordinate: place.location) {
                Rectangle()
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(place: .init(lat: 37.5148181, long: 127.0617657), region: MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.5148181, longitude: 127.0617657), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
                 )
    }
}


struct IdentifiablePlace: Identifiable {
    let id: UUID
    let location: CLLocationCoordinate2D
    init(id: UUID = UUID(), lat: Double, long: Double) {
        self.id = id
        self.location = CLLocationCoordinate2D(
            latitude: lat,
            longitude: long)
    }
}
