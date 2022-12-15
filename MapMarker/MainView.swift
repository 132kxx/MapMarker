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
            showsUserLocation: true, annotationItems: [place])
        { place in
            MapAnnotation(coordinate: place.location) {
                Image(systemName: "mappin.and.ellipse")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.red)
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(place: .init(lat: 35.1418923, long: 129.08884513801985), region: MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 35.1418923, longitude: 129.08884513801985), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
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
