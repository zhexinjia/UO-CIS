//
//  TriathlonEvent.swift
//  Assignment1UnitTests
//
//  Created by Charles Augustine.
//
//


import XCTest


class TriathlonEventTests: XCTestCase {
	func testInitializer() {
		let sprintTriathlonEvent = TriathlonEvent(triathlon: .Sprint)
		XCTAssertEqual(sprintTriathlonEvent.triathlon, Triathlon.Sprint, "TriathlonEvent initializer init(triathlon:) invoked with Triathlon.Sprint, but triathlon property was different")

		let olympicTriathlonEvent = TriathlonEvent(triathlon: .Olympic)
		XCTAssertEqual(olympicTriathlonEvent.triathlon, Triathlon.Olympic, "TriathlonEvent initializer init(triathlon:) invoked with Triathlon.Olympic, but triathlon property was different")

		let halfIronmanTriathlonEvent = TriathlonEvent(triathlon: .HalfIronman)
		XCTAssertEqual(halfIronmanTriathlonEvent.triathlon, Triathlon.HalfIronman, "TriathlonEvent initializer init(triathlon:) invoked with Triathlon.HalfIronman, but triathlon property was different")

		let ironmanTriathlonEvent = TriathlonEvent(triathlon: .Ironman)
		XCTAssertEqual(ironmanTriathlonEvent.triathlon, Triathlon.Ironman, "TriathlonEvent initializer init(triathlon:) invoked with Triathlon.Ironman, but triathlon property was different")
	}

	func testInitialEventPerformed() {
		let triathlonEvent = TriathlonEvent(triathlon: .HalfIronman)
		XCTAssertFalse(triathlonEvent.eventPerformed, "TriathlonEvent had initial eventPerformed value of true")
	}

	func testRegisterParticipant() {
		let triathlonEvent = TriathlonEvent(triathlon: .HalfIronman)

		let testParticipantOne = TestParticipant(name: "Foo")
		triathlonEvent.registerParticipant(testParticipantOne)
		XCTAssertEqual(triathlonEvent.registeredParticipants.map { $0.name }, [testParticipantOne.name], "TriathlonEvent registeredParticipants did not contain the expected participant after one call registerParticipant(_:)")
		XCTAssertEqual(triathlonEvent.raceTimeForParticipant(testParticipantOne), 0, "TriathlonEvent initial race time was not 0 for participant after calling registerParticipant(_:)")

		let testParticipantTwo = TestParticipant(name: "Bar")
		triathlonEvent.registerParticipant(testParticipantTwo)
		XCTAssertEqual(triathlonEvent.registeredParticipants.map { $0.name }, [testParticipantOne.name, testParticipantTwo.name], "TriathlonEvent registeredParticipants did not contain the expected participants after two calls registerParticipant(_:)")
		XCTAssertEqual(triathlonEvent.raceTimeForParticipant(testParticipantTwo), 0, "TriathlonEvent initial race time was not 0 for participant after calling registerParticipant(_:)")
	}

	func testRaceTimeForParticipantWithUnregisteredParticipant() {
		let triathlonEvent = TriathlonEvent(triathlon: .HalfIronman)

		let testParticipantOne = TestParticipant(name: "Foo")
		XCTAssertNil(triathlonEvent.raceTimeForParticipant(testParticipantOne), "TriathlonEvent race time for unregistered participant was not nil")
	}

	func testRunSportForParticipantAndRaceTimeForParticipantFinishingValueLow() {
		let triathlonEvent = TriathlonEvent(triathlon: .HalfIronman)

		let testParticipant = TestParticipant(name: "Foo")
		triathlonEvent.registerParticipant(testParticipant)
		triathlonEvent.runSport(Sport.Swimming, forParticipant: testParticipant, randomValue: 0.05)
		let raceTime = triathlonEvent.raceTimeForParticipant(testParticipant)
		XCTAssertNotNil(raceTime, "TriathlonEvent race time for registered participant after call to runSport(_:forParticipant_:) with a random value of 0.05 was nil")
		if let someRaceTime = raceTime {
			XCTAssertGreaterThan(someRaceTime, 0, "TriathlonEvent race time for registered participant after call to runSport(_:forParticipant_:) with a random value of 0.05 was not greater than 0")
		}
	}
	
	func testRunSportForParticipantAndRaceTimeForParticipantFinishingValueHigh() {
		let triathlonEvent = TriathlonEvent(triathlon: .HalfIronman)

		let testParticipant = TestParticipant(name: "Foo")
		triathlonEvent.registerParticipant(testParticipant)
		triathlonEvent.runSport(Sport.Swimming, forParticipant: testParticipant, randomValue: 1.0)
		let raceTime = triathlonEvent.raceTimeForParticipant(testParticipant)
		XCTAssertNotNil(raceTime, "TriathlonEvent race time for registered participant after call to runSport(_:forParticipant_:) with a random value of 1.0 was nil")
		if let someRaceTime = raceTime {
			XCTAssertGreaterThan(someRaceTime, 0, "TriathlonEvent race time for registered participant after call to runSport(_:forParticipant_:) with a random value of 1.0 was not greater than 0")
		}
	}
	
	func testRunSportForParticipantAndRaceTimeForParticipantNoFavoriteNonFinishingValueLow() {
		let triathlonEvent = TriathlonEvent(triathlon: .HalfIronman)

		let testParticipant = TestParticipant(name: "Foo")
		triathlonEvent.registerParticipant(testParticipant)
		triathlonEvent.runSport(Sport.Swimming, forParticipant: testParticipant, randomValue: 0.0)
		let raceTime = triathlonEvent.raceTimeForParticipant(testParticipant)
		XCTAssertNil(raceTime, "TriathlonEvent race time for registered participant after call to runSport(_:forParticipant_:) with a random value of 0.0 was not nil")
	}

	func testRunSportForParticipantAndRaceTimeForParticipantNoFavoriteNonFinishingValueHigh() {
		let triathlonEvent = TriathlonEvent(triathlon: .HalfIronman)

		let testParticipant = TestParticipant(name: "Foo")
		triathlonEvent.registerParticipant(testParticipant)
		triathlonEvent.runSport(Sport.Swimming, forParticipant: testParticipant, randomValue: 0.04)
		let raceTime = triathlonEvent.raceTimeForParticipant(testParticipant)
		XCTAssertNil(raceTime, "TriathlonEvent race time for registered participant after call to runSport(_:forParticipant_:) with a random value of 0.04 was not nil")
	}

	func testRunSportForParticipantAndRaceTimeForParticipantWithFavoriteNonFinishingValue() {
		let triathlonEvent = TriathlonEvent(triathlon: .HalfIronman)

		let testParticipant = TestParticipant(name: "Foo")
		testParticipant.favoriteSport = .Swimming
		triathlonEvent.registerParticipant(testParticipant)
		triathlonEvent.runSport(Sport.Swimming, forParticipant: testParticipant, randomValue: 0.0)
		let raceTime = triathlonEvent.raceTimeForParticipant(testParticipant)
		XCTAssertNotNil(raceTime, "TriathlonEvent race time for registered participant after call to runSport(_:forParticipant_:) with a favorite sport and a random value of 0.0 was nil")
	}

	func testRunSportForParticipantAndRaceTimeForParticipantNoFavoriteNonFinishingValue() {
		let triathlonEvent = TriathlonEvent(triathlon: .HalfIronman)

		let testParticipant = TestParticipant(name: "Foo")
		testParticipant.favoriteSport = .Running
		triathlonEvent.registerParticipant(testParticipant)
		triathlonEvent.runSport(Sport.Swimming, forParticipant: testParticipant, randomValue: 0.0)
		let raceTime = triathlonEvent.raceTimeForParticipant(testParticipant)
		XCTAssertNil(raceTime, "TriathlonEvent race time for registered participant after call to runSport(_:forParticipant_:) with a non favorite sport and a random value of 0.0 was not nil")
	}

	func testRunSportForParticipantAndRaceTimeForParticipantWithFavoriteNonFinishingValueTwo() {
		let triathlonEvent = TriathlonEvent(triathlon: .HalfIronman)

		let testParticipant = TestParticipant(name: "Foo")
		testParticipant.favoriteSport = .Running
		triathlonEvent.registerParticipant(testParticipant)
		triathlonEvent.runSport(Sport.Running, forParticipant: testParticipant, randomValue: 0.0)
		let raceTime = triathlonEvent.raceTimeForParticipant(testParticipant)
		XCTAssertNotNil(raceTime, "TriathlonEvent race time for registered participant after call to runSport(_:forParticipant_:) with a favorite sport and a random value of 0.0 was nil")
	}

	func testRunSportForParticipantAndRaceTimeForParticipantNoFavoriteNonFinishingValueTwo() {
		let triathlonEvent = TriathlonEvent(triathlon: .HalfIronman)

		let testParticipant = TestParticipant(name: "Foo")
		testParticipant.favoriteSport = .Swimming
		triathlonEvent.registerParticipant(testParticipant)
		triathlonEvent.runSport(Sport.Running, forParticipant: testParticipant, randomValue: 0.0)
		let raceTime = triathlonEvent.raceTimeForParticipant(testParticipant)
		XCTAssertNil(raceTime, "TriathlonEvent race time for registered participant after call to runSport(_:forParticipant_:) with a non favorite sport and a random value of 0.0 was not nil")
	}

	func testPerformEventSetsEventPerformed() {
		let triathlonEvent = TriathlonEvent(triathlon: .HalfIronman)

		triathlonEvent.performEvent()
		XCTAssertTrue(triathlonEvent.eventPerformed, "TriathlonEvent eventPerformed false after call to performEvent(_:)")
	}

	func testPerformEventNonZeroOrNilRaceTimes() {
		// Tests a randomized function, so the test is performed some fairly large number of times
		continueAfterFailure = false
		for _ in 0...1000 {
			let triathlonEvent = TriathlonEvent(triathlon: .HalfIronman)

			let testParticipantOne = TestParticipant(name: "Foo")
			triathlonEvent.registerParticipant(testParticipantOne)
			let testParticipantTwo = TestParticipant(name: "Bar")
			triathlonEvent.registerParticipant(testParticipantTwo)

			triathlonEvent.performEvent()

			let testParticipantOneRaceTime = triathlonEvent.raceTimeForParticipant(testParticipantOne)
			if let someRaceTime = testParticipantOneRaceTime {
				XCTAssertGreaterThan(someRaceTime, 0)
			}

			let testParticipantTwoRaceTime = triathlonEvent.raceTimeForParticipant(testParticipantTwo)
			if let someRaceTime = testParticipantTwoRaceTime {
				XCTAssertGreaterThan(someRaceTime, 0)
			}
		}
	}

	func testWinner() {
		// Tests a randomized function, so the test is performed some fairly large number of times
		continueAfterFailure = false
		for _ in 0...1000 {
			let triathlonEvent = TriathlonEvent(triathlon: .HalfIronman)

			let testParticipantOne = TestParticipant(name: "Foo")
			triathlonEvent.registerParticipant(testParticipantOne)
			let testParticipantTwo = TestParticipant(name: "Bar")
			triathlonEvent.registerParticipant(testParticipantTwo)

			triathlonEvent.performEvent()

			let testParticipantOneRaceTime = triathlonEvent.raceTimeForParticipant(testParticipantOne)
			let testParticipantTwoRaceTime = triathlonEvent.raceTimeForParticipant(testParticipantTwo)

			if let someTestParticipantOneRaceTime = testParticipantOneRaceTime, let someTestParticipantTwoRaceTime = testParticipantTwoRaceTime {
				let expectedWinner = someTestParticipantOneRaceTime <= someTestParticipantTwoRaceTime ? testParticipantOne : testParticipantTwo
				XCTAssertEqual(triathlonEvent.winner?.name, expectedWinner.name, "\(testParticipantOne.name) had a time of \(someTestParticipantOneRaceTime) and \(testParticipantTwo.name) had a time of \(someTestParticipantTwoRaceTime), but \(triathlonEvent.winner?.name) was the winner (\(testParticipantOne.name) should win ties)")
			}
			else if testParticipantOneRaceTime != nil {
				XCTAssertEqual(triathlonEvent.winner?.name, testParticipantOne.name, "Only one participant had a time but they were not the winner")
			}
			else if testParticipantTwoRaceTime != nil {
				XCTAssertEqual(triathlonEvent.winner?.name, testParticipantTwo.name, "Only one participant had a time but they were not the winner")
			}
			else {
				XCTAssertNil(triathlonEvent.winner, "No test participants had a time, but the winner was not nil")
			}
		}
	}
}
