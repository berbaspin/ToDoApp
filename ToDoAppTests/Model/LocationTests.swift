//
//  LocationTests.swift
//  ToDoAppTests
//
//  Created by Дмитрий Бабаев on 08.02.2022.
//

import XCTest
import CoreLocation
@testable import ToDoApp

class LocationTests: XCTestCase {
    
    func testInitSetsName() {
        let location = Location(name: "Foo")
        
        XCTAssertEqual(location.name, "Foo")
    }

    func testInitSetsCoordintates() {
        let coordinate = CLLocationCoordinate2D(latitude: 1, longitude: 2)
        
        let location = Location(name: "Foo", coordinate: coordinate)
        
        XCTAssertEqual(location.coordinate?.latitude, coordinate.latitude)
        XCTAssertEqual(location.coordinate?.longitude, coordinate.longitude)
    }
    
    func testCanBeCreatedFromPlistDictionary() {
        let location = Location(name: "Foo", coordinate: CLLocationCoordinate2D(latitude: 10.0, longitude: 10.0))
        let dict: [String: Any] = ["name": "Foo",
                                   "latitude": 10.0,
                                   "longitude": 10.0]
        let createdLocation = Location(dict: dict)
        
        XCTAssertEqual(location, createdLocation)
    }
    
    func testCanBeSerializedIntoDictionary() {
        let location = Location(name: "Foo", coordinate: CLLocationCoordinate2D(latitude: 10.0, longitude: 10.0))
        
        let generatedLocation = Location(dict: location.dictionary)
        
        XCTAssertEqual(location, generatedLocation)
    }

}
