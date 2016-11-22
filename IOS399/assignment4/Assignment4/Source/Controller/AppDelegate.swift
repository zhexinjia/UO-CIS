//
//  AppDelegate.swift
//  Assignment4
//
//  Created by Charles Augustine on 7/9/15.
//
//


import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
	// MARK: UIApplicationDelegate
	func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
		UINavigationBar.appearance().translucent = false

		return true
	}

	// MARK: Properties
	var window: UIWindow?
}

