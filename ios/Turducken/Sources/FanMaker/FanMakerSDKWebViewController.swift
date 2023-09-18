//
//  File.swift
//
//
//  Created by Érik Escobedo on 28/05/21.
//

import Foundation
import CoreLocation
import WebKit
import SwiftUI

@available(iOS 13.0, *)
open class FanMakerSDKWebViewController : UIViewController, WKScriptMessageHandler, WKNavigationDelegate {
    public var fanmaker : FanMakerSDKWebView? = nil
    private let locationManager : CLLocationManager = CLLocationManager()
    private let locationDelegate : FanMakerSDKLocationDelegate = FanMakerSDKLocationDelegate()

    open override func viewDidLoad() {
        super.viewDidLoad()

        let userController : WKUserContentController = WKUserContentController()
        userController.add(self, name: "fanmaker")
        let configuration = WKWebViewConfiguration()
        configuration.userContentController = userController

        self.fanmaker = FanMakerSDKWebView(configuration: configuration)
        self.fanmaker?.prepareUIView()
        self.fanmaker?.webView.navigationDelegate = self

        self.view = UIView(frame: self.view!.bounds)
        self.view.backgroundColor = FanMakerSDK.loadingBackgroundColor

        let bounds = self.view!.bounds
        let x = bounds.width / 4
        let y = bounds.height / 2 - x * 3 / 2

        let loadingAnimation = UIImageView(frame: CGRect(x: x, y: y, width: 2 * x, height: 2 * x))

        if let fgImage = FanMakerSDK.loadingForegroundImage {
            loadingAnimation.image = fgImage
        } else {
            var images : [UIImage] = []
            for index in 0...29 {
              if let path = Bundle.main.path(forResource: "fanmaker-sdk-loading-\(index)", ofType: "png") {
                    if let image = UIImage(contentsOfFile: path) {
                        images.append(image)
                    }
                }
            }
            loadingAnimation.image = UIImage.animatedImage(with: images, duration: 1.0)
        }

        self.view.addSubview(loadingAnimation)
    }

    public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation) {
        self.view = self.fanmaker!.webView
    }

    public func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if message.name == "fanmaker", let body = message.body as? Dictionary<String, String> {
            let defaults : UserDefaults = UserDefaults.standard

            body.forEach { key, value in
                switch(key) {
                case "sdkOpenUrl":
                    FanMakerSDK.sdkOpenUrl(scheme: value)
                case "setToken":
                    defaults.set(value, forKey: FanMakerSDKSessionToken)
                case "setIdentifiers":
                    FanMakerSDK.setIdentifiers(fromJSON: value)
                    defaults.set(value, forKey: FanMakerSDKJSONIdentifiers)
                case "requestLocationAuthorization":
                    locationManager.requestWhenInUseAuthorization()
                    locationManager.delegate = locationDelegate
                    locationManager.requestLocation()
                case "updateLocation":
                    if FanMakerSDK.locationEnabled && CLLocationManager.locationServicesEnabled() {
                        var authorizationStatus : CLAuthorizationStatus
                        if #available(iOS 14.0, *) {
                            authorizationStatus = locationManager.authorizationStatus
                        } else {
                            authorizationStatus = CLLocationManager.authorizationStatus()
                        }

                        switch authorizationStatus {
                        case .notDetermined, .restricted, .denied:
                            print("Access Denied")
                            fanmaker!.webView.evaluateJavaScript("FanMakerReceiveLocationAuthorization(false)")
                        case .authorizedAlways, .authorizedWhenInUse:
                            fanmaker!.webView.evaluateJavaScript("FanMakerReceiveLocation(\(locationDelegate.coords()))")
                        @unknown default:
                            print("Unknown error")
                        }
                    } else {
                        print("CLLocationManager.locationServices are DISABLED")
                    }
                default:
                    break;
                }
            }
        }
    }
}

@available(iOS 13.0, *)
public struct FanMakerSDKWebViewControllerRepresentable : UIViewControllerRepresentable {
    public init() {}

    public func makeUIViewController(context: Context) -> some UIViewController {
        return FanMakerSDKWebViewController()
    }

    public func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {

    }
}

