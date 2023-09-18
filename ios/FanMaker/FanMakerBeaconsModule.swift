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
    print("Hit enableLocationTracking")

    FanMakerSDK.enableLocationTracking()
  }
  
  @objc(disableLocationTracking)
  func disableLocationTracking() {
    print("Hit disableLocationTracking")
    FanMakerSDK.disableLocationTracking()
  }
  
  
}
