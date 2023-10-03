//
//  FanMakerWebViewManager.swift
//  NativeModules
//
//  Created by Uday Pandey on 03/10/2023.
//

import Foundation
import FanMaker

@objc(FanMakerWebViewManager)
class FanMakerWebViewManager: RCTViewManager {
  override func view() -> UIView! {
    let label = UILabel()
    label.text = "Hello from Native world"
    label.textAlignment = .center
    return label
  }
  
  override class func requiresMainQueueSetup() -> Bool {
    true
  }
}
