//
//  RCTHelloModule.swift
//  NativeModules
//
//  Created by Uday Pandey on 18/09/2023.
//

import Foundation

// HelloModule.swift

@objc(HelloModule)
class HelloModule: NSObject {
  
  @objc(hello:)
  func hello(_ name: String) -> Void {
    print("Got name: \(name)")
  }
  
  @objc
  class func requiresMainQueueSetup() -> Bool {
    false
  }
}
