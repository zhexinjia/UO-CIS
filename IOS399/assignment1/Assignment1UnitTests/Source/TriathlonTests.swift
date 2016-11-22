//
//  TriathlonTests.swift
//  Assignment1UnitTests
//
//  Created by Charles Augustine.
//
//


import XCTest
@testable import Assignment1


class TriathlonTests: XCTestCase {
	func testSprintDistances() {
		XCTAssertEqual(Triathlon.Sprint.distanceInMetersForSport(.Swimming), 750, "Triathlon.Sprint.distanceInMetersForSport(_:) did not return expected distance of 750 meters for Sport.Swimming")
		XCTAssertEqual(Triathlon.Sprint.distanceInMetersForSport(.Cycling), 20000, "Triathlon.Sprint.distanceInMetersForSport(_:) did not return expected distance of 20000 meters for Sport.Cycling")
		XCTAssertEqual(Triathlon.Sprint.distanceInMetersForSport(.Running), 5000, "Triathlon.Sprint.distanceInMetersForSport(_:) did not return expected distance of 5000 meters for Sport.Running")
	}

	func testOlympicDistances() {
		XCTAssertEqual(Triathlon.Olympic.distanceInMetersForSport(.Swimming), 1500, "Triathlon.Olympic.distanceInMetersForSport(_:) did not return expected distance of 1500 meters for Sport.Swimming")
		XCTAssertEqual(Triathlon.Olympic.distanceInMetersForSport(.Cycling), 40000, "Triathlon.Olympic.distanceInMetersForSport(_:) did not return expected distance of 40000 meters for Sport.Cycling")
		XCTAssertEqual(Triathlon.Olympic.distanceInMetersForSport(.Running), 10000, "Triathlon.Olympic.distanceInMetersForSport(_:) did not return expected distance of 10000 meters for Sport.Running")
	}

	func testHalfIronmanDistances() {
		XCTAssertEqual(Triathlon.HalfIronman.distanceInMetersForSport(.Swimming), 1930, "Triathlon.HalfIronman.distanceInMetersForSport(_:) did not return expected distance of 1930 meters for Sport.Swimming")
		XCTAssertEqual(Triathlon.HalfIronman.distanceInMetersForSport(.Cycling), 90000, "Triathlon.HalfIronman.distanceInMetersForSport(_:) did not return expected distance of 90000 meters for Sport.Cycling")
		XCTAssertEqual(Triathlon.HalfIronman.distanceInMetersForSport(.Running), 21090, "Triathlon.HalfIronman.distanceInMetersForSport(_:) did not return expected distance of 21090 meters for Sport.Running")
	}

	func testIronmanDistances() {
		XCTAssertEqual(Triathlon.Ironman.distanceInMetersForSport(.Swimming), 3860, "Triathlon.Ironman.distanceInMetersForSport(_:) did not return expected distance of 3860 meters for Sport.Swimming")
		XCTAssertEqual(Triathlon.Ironman.distanceInMetersForSport(.Cycling), 180000, "Triathlon.Ironman.distanceInMetersForSport(_:) did not return expected distance of 180000 meters for Sport.Cycling")
		XCTAssertEqual(Triathlon.Ironman.distanceInMetersForSport(.Running), 42200, "Triathlon.Ironman.distanceInMetersForSport(_:) did not return expected distance of 42200 meters for Sport.Running")
	}

	func testTriathlonSports() {
		XCTAssertEqual(Triathlon.Sports[0], Sport.Swimming, "Triathlon.Sports[0] was not Sport.Swimming")
		XCTAssertEqual(Triathlon.Sports[1], Sport.Cycling, "Triathlon.Sports[1] was not Sport.Cycling")
		XCTAssertEqual(Triathlon.Sports[2], Sport.Running, "Triathlon.Sports[2] was not Sport.Running")
	}
}
