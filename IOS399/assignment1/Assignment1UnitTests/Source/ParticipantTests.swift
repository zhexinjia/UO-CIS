//
//  ParticipantTests.swift
//  Assignment1UnitTests
//
//  Created by Charles Augustine.
//
//


import XCTest


class ParticipantTests: XCTestCase {
	func testMetersPerMinuteForSwimmingWithNilFavoriteSport() {
		let testParticipant = TestParticipant(name: "Foo")

		XCTAssertEqual(testParticipant.metersPerMinuteForSport(.Swimming, randomValue: 0.5), 43, "Participant extension metersPerMinutePerSport(_:) did not return 43 for Sport.Swimming when favoriteSport was nil")
	}

	func testMetersPerMinuteForSwimmingWithSwimmingFavoriteSport() {
		let testParticipant = TestParticipant(name: "Foo")
		testParticipant.favoriteSport = .Swimming

		XCTAssertEqual(testParticipant.metersPerMinuteForSport(.Swimming, randomValue: 0.5), 40, "Participant extension metersPerMinutePerSport(_:) did not return 40 for Sport.Swimming when favoriteSport was Sport.Swimming")
	}

	func testMetersPerMinuteForSwimmingWithNonSwimmingFavoriteSport() {
		let testParticipant = TestParticipant(name: "Foo")
		testParticipant.favoriteSport = .Running

		XCTAssertEqual(testParticipant.metersPerMinuteForSport(.Swimming, randomValue: 0.5), 47, "Participant extension metersPerMinutePerSport(_:) did not return 47 for Sport.Swimming when favoriteSport was not Sport.Swimming")
	}
	
	func testMetersPerMinuteForCyclingWithNilFavoriteSport() {
		let testParticipant = TestParticipant(name: "Foo")

		XCTAssertEqual(testParticipant.metersPerMinuteForSport(.Cycling, randomValue: 0.5), 500, "Participant extension metersPerMinutePerSport(_:) did not return 500 for Sport.Cycling when favoriteSport was nil")
	}

	func testMetersPerMinuteForCyclingWithCyclingFavoriteSport() {
		let testParticipant = TestParticipant(name: "Foo")
		testParticipant.favoriteSport = .Cycling

		XCTAssertEqual(testParticipant.metersPerMinuteForSport(.Cycling, randomValue: 0.5), 475, "Participant extension metersPerMinutePerSport(_:) did not return 475 for Sport.Cycling when favoriteSport was Sport.Cycling")
	}

	func testMetersPerMinuteForCyclingWithNonCyclingFavoriteSport() {
		let testParticipant = TestParticipant(name: "Foo")
		testParticipant.favoriteSport = .Running

		XCTAssertEqual(testParticipant.metersPerMinuteForSport(.Cycling, randomValue: 0.5), 550, "Participant extension metersPerMinutePerSport(_:) did not return 550 for Sport.Cycling when favoriteSport was not Sport.Cycling")
	}
	
	func testMetersPerMinuteForRunningWithNilFavoriteSport() {
		let testParticipant = TestParticipant(name: "Foo")

		XCTAssertEqual(testParticipant.metersPerMinuteForSport(.Running, randomValue: 0.5), 157, "Participant extension metersPerMinutePerSport(_:) did not return 157 for Sport.Running when favoriteSport was nil")
	}

	func testMetersPerMinuteForRunningWithRunningFavoriteSport() {
		let testParticipant = TestParticipant(name: "Foo")
		testParticipant.favoriteSport = .Running

		XCTAssertEqual(testParticipant.metersPerMinuteForSport(.Running, randomValue: 0.5), 149, "Participant extension metersPerMinutePerSport(_:) did not return 149 for Sport.Running when favoriteSport was Sport.Running")
	}

	func testMetersPerMinuteForRunningWithNonRunningFavoriteSport() {
		let testParticipant = TestParticipant(name: "Foo")
		testParticipant.favoriteSport = .Swimming

		XCTAssertEqual(testParticipant.metersPerMinuteForSport(.Running, randomValue: 0.5), 172, "Participant extension metersPerMinutePerSport(_:) did not return 172 for Sport.Running when favoriteSport was not Sport.Running")
	}

	func testTimeInMinutesToCompleteSportInTriathlon() {
		let testParticipant = TestParticipant(name: "Foo")

		let randomValue = 0.5
		let value = testParticipant.timeInMinutesToCompleteSport(.Swimming, inTriathlon: Triathlon.HalfIronman, randomValue: randomValue)
		let expectedValue = Triathlon.HalfIronman.distanceInMetersForSport(.Swimming) / testParticipant.metersPerMinuteForSport(.Swimming, randomValue: randomValue)

		XCTAssertEqual(value, expectedValue, "Participant extension timeInMinutesToCompleteSport(_:inTriathlon:) did not result in the same value as triathlon.distanceInMetersForSport / metersPerMinuteForSport")
	}
}
