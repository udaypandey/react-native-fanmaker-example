//
//  FanMakeBeaconsModule.swift
//  NativeModules
//
//  Created by Uday Pandey on 19/09/2023.
//

import Foundation
import CoreLocation
import FanMaker

@objc(FanMakerWebViewControllerModule)
class FanMakerWebViewControllerModule: NSObject {
  private var _viewController: UIViewController?
  
  @objc
  static func requiresMainQueueSetup() -> Bool {
    return true
  }
  
  @objc
  public func showFanMakerUI() {
//    FanMakerSDK.initialize(apiKey: "cd5424f8e4438b19a5238b53d813cf5f35e21851b91eb4662223057229060023")

    DispatchQueue.main.async { [weak self] in
      guard let self else { return }
      guard let appDelegate = UIApplication.shared.delegate,
            let window = appDelegate.window,
            let rootViewController = window?.rootViewController else { return }
      
      let fanMakerViewController = FanMakerSDKWebViewController()
      self._viewController = fanMakerViewController
      rootViewController.present(fanMakerViewController, animated: true)
    }
  }
  
  @objc
  public func hideFanMakerUI() {
    DispatchQueue.main.async { [weak self] in
      guard let self else { return }
      guard let vc = self._viewController else { return }
      vc.dismiss(animated: true)
    }
  }
}
