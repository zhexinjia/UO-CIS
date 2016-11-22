//
//  AppDelegate.swift
//  Assignment2
//
//  Created by Charles Augustine on 7/5/15.
//
//


import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
	// MARK: UIApplicationDelegate
	func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
		let splitViewController = window?.rootViewController as! UISplitViewController
		splitViewController.preferredDisplayMode = .AllVisible

		return true
	}

	// MARK: Properties
	var window: UIWindow?
}

