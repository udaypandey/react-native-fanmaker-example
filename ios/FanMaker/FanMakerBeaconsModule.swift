//
//  FanMakeBeaconsModule.swift
//  NativeModules
//
//  Created by Uday Pandey on 19/09/2023.
//

import Foundation
import CoreLocation
import FanMaker

@objc(FanMakerBeaconsModule)
class FanMakerBeaconsModule: RCTEventEmitter {
  private let _beaconsManager = FanMakerSDKBeaconsManager()
  
  override init() {
    super.init()
    _beaconsManager.delegate = self
  }
  
  @objc
  override static func requiresMainQueueSetup() -> Bool {
    return false
  }
  
  public func supportedEvents() -> Any! {
    return [
      "foo",
      "bar"
    ]
  }

  
  @objc
  public func rangeActionsHistory() -> [[String : String]] {
    let actions = _beaconsManager.rangeActionsHistory()
    return actions.map { $0.toParams() }
  }
  
  @objc
  public func rangeActionsSendList() -> [[String : String]] {
    let actions = _beaconsManager.rangeActionsSendList()
    return actions.map { $0.toParams() }
  }
  
  @objc
  public func requestAuthorization() {
    _beaconsManager.requestAuthorization()
  }
  
  @objc
  public func fetchBeaconRegions() {
    _beaconsManager.fetchBeaconRegions()
  }
  
  @objc
  public func startScanning(_ params: [[String: Any]]) {
    do {
      // Underlying type cant be exposed to JS. Underlying type conforms to codable
      // so we can hook into JSON machinery to convert instead of doing it by hand
      // TODO: Move this to some generic code for any such conversion else where
      let json = try JSONSerialization.data(withJSONObject: params)
      
      let regions = try JSONDecoder().decode([FanMakerSDKBeaconRegion].self, from: json)
      
      _beaconsManager.startScanning(regions)
    } catch {
      print("Failed")
    }
  }
  
  @objc
  public func stopScanning() {
    _beaconsManager.stopScanning()
  }
}

extension FanMakerBeaconsModule: FanMakerSDKBeaconsManagerDelegate {
  func beaconsManager(_ manager: FanMakerSDKBeaconsManager, didChangeAuthorization status: FanMakerSDKBeaconsAuthorizationStatus) {
    sendEvent(withName: "", body: status)
  }
  
  func beaconsManager(_ manager: FanMakerSDKBeaconsManager, didReceiveBeaconRegions regions: [FanMakerSDKBeaconRegion]) {
    do {
      let json = try JSONEncoder().encode(regions)
      let obj = try JSONSerialization.jsonObject(with: json)
      
      sendEvent(withName: "", body: obj)
    } catch {
      print("Error")
    }
  }
  
  func beaconsManager(_ manager: FanMakerSDKBeaconsManager, didEnterRegion region: FanMakerSDKBeaconRegion) {
    do {
      let json = try JSONEncoder().encode(region)
      let obj = try JSONSerialization.jsonObject(with: json)
      
      sendEvent(withName: "", body: obj)
    } catch {
      print("Error")
    }
  }
  
  func beaconsManager(_ manager: FanMakerSDKBeaconsManager, didExitRegion region: FanMakerSDKBeaconRegion) {
    do {
      let json = try JSONEncoder().encode(region)
      let obj = try JSONSerialization.jsonObject(with: json)
      
      sendEvent(withName: "", body: obj)
    } catch {
      print("Error")
    }
  }
  
  func beaconsManager(_ manager: FanMakerSDKBeaconsManager, didUpdateBeaconRangeActionsHistory queue: [FanMakerSDKBeaconRangeAction]) {
    let actions = queue.map { $0.toParams()}
    
    sendEvent(withName: "", body: actions)
  }
  
  func beaconsManager(_ manager: FanMakerSDKBeaconsManager, didUpdateBeaconRangeActionsSendList queue: [FanMakerSDKBeaconRangeAction]) {
    let actions = queue.map { $0.toParams()}
    
    sendEvent(withName: "", body: actions)
  }
  
  func beaconsManager(_ manager: FanMakerSDKBeaconsManager, didFailWithError error: FanMakerSDKBeaconsError) {
    sendEvent(withName: "", body: nil)
  }
}
