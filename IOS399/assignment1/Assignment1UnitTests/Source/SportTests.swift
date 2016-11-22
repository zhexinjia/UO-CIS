//
//  SportTests.swift
//  Assignment1UnitTests
//
//  Created by Charles Augustine.
//
//


import XCTest
@testable import Assignment1


class Assignment1UnitTests: XCTestCase {
    func testSwimmingDescription() {
		XCTAssertEqual("swimming", Sport.Swimming.description, "Sport.Swimming.description expected value of \"swimming\"")
    }
    
    func testCyclingDescription() {
		XCTAssertEqual("cycling", Sport.Cycling.description, "Sport.Swimming.description expected value of \"cycling\"")
    }

	func testRunningDescription() {
		XCTAssertEqual("running", Sport.Running.description, "Sport.Swimming.description expected value of \"running\"")
	}
}
