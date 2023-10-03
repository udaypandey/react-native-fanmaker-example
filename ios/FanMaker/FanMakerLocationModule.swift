//
//  FanMakerLocationModule.swift
//  NativeModules
//
//  Created by Uday Pandey on 18/09/2023.
//

import Foundation


@objc(FanMakerLocationModule)
class FanMakerLocationModule: NSObject {
  
  @objc(enableLocationTracking)
  func enableLocationTracking() {
    FanMakerSDK.enableLocationTracking()
  }
  
  @objc(disableLocationTracking)
  func disableLocationTracking() {
    FanMakerSDK.disableLocationTracking()
  }
  
  @objc
  static func requiresMainQueueSetup() -> Bool {
    return false
  }
}
