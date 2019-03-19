//
//  AppDelegate.swift
//  Quiz
//
//  Created by S on 24/10/2015.
//  Copyright © 2015 KrayemApps. All rights reserved.
//

import UIKit

import AVFoundation
import AdSupport
import AudioToolbox
import CoreGraphics
import CoreImage
import CoreLocation
import CoreMedia
import CoreMotion
import CoreTelephony
import EventKit
import EventKitUI
import FBAudienceNetwork
import Foundation
import MediaPlayer
import MessageUI
import MobileCoreServices
import QuartzCore
import SafariServices
import Security
import StoreKit
import SystemConfiguration
import UIKit
import VideoToolbox
import WebKit
import iAd






@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, HZIncentivizedAdDelegate, HZAdsDelegate, HZBannerAdDelegate {
    
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        application.isStatusBarHidden = true
        
        HeyzapAds.start(withPublisherID: "c1b7bed2a952acb6fe4d2200c3648a38")

        
          HZIncentivizedAd.fetch()

          HZVideoAd.fetch()

        

       // FBAdSettings.addTestDevice("9e3b64012f4fb658be4ce75f15c8f9197bfd2e9c")

        


        
     
        
        
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

