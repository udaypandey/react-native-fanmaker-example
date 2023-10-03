//
//  FanMakerSDKModule.swift
//  NativeModules
//
//  Created by Uday Pandey on 18/09/2023.
//

import Foundation
import FanMaker

@objc(FanMakerSDKModule)
class FanMakerSDKModule: NSObject {
  @objc(configure:)
  func configure(apiKey: String) {
    FanMakerSDK.initialize(apiKey: apiKey)
  }
  
  @objc
  class func requiresMainQueueSetup() -> Bool {
    false
  }
}
