//
//  FanMakerWebViewControllerModule.swift
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
    DispatchQueue.main.async { [weak self] in
      guard let self else { return }
      guard let appDelegate = UIApplication.shared.delegate,
            let window = appDelegate.window,
            let rootViewController = window?.rootViewController else { return }
      
      let fanMakerViewController = FanMakerSDKWebViewController()
      //            let fanMakerViewController = UIViewController()
      //      fanMakerViewController.view.backgroundColor = .yellow
//      fanMakerViewController.edgesForExtendedLayout = [.bottom]
      fanMakerViewController.edgesForExtendedLayout = []

      fanMakerViewController.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Close", style: .plain, target: self, action: #selector(self.hideFanMakerUI))
      fanMakerViewController.title = "FanMaker"
      
      
      let navVC = UINavigationController(rootViewController: fanMakerViewController)
      
//      let appearance = UINavigationBarAppearance()
//      appearance.configureWithOpaqueBackground()
//      UINavigationBar.appearance().standardAppearance = appearance
//      UINavigationBar.appearance().scrollEdgeAppearance = appearance
////      UINavigationBar.appearance().backgroundColor = .blue
//      navVC.navigationBar.barTintColor = .brown
      
      
//      UINavigationBar.appearance().backgroundColor = .green // backgorund color with gradient
//      UINavigationBar.appearance().barTintColor = .green  // solid color
//      UINavigationBar.appearance().isTranslucent = false

      //      fanMakerViewController.preferredStatusBarStyle = .lightContent

      navVC.navigationBar.isTranslucent = false
//      self.navigationController?.navigationBar.isTranslucent = false

      navVC.view.backgroundColor = .cyan
//      navVC.view.backgroundColor = .white
//      fanMakerViewController.
      navVC.modalPresentationStyle = .fullScreen
      self._viewController = navVC
      rootViewController.present(navVC, animated: true)
    }
  }
  
  @objc
  private func hideFanMakerUI() {
    DispatchQueue.main.async { [weak self] in
      guard let self else { return }
      guard let vc = self._viewController else { return }
      vc.dismiss(animated: true)
    }
  }
}
