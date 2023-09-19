//
//  FanMakerBeaconsModule.m
//  NativeModules
//
//  Created by Uday Pandey on 19/09/2023.
//

#import <Foundation/Foundation.h>
#import "React/RCTBridgeModule.h"
#import "React/RCTEventEmitter.h"

@interface RCT_EXTERN_MODULE(FanMakerBeaconsModule, RCTEventEmitter)

RCT_EXTERN_METHOD(rangeActionsHistory)
RCT_EXTERN_METHOD(rangeActionsSendList)
RCT_EXTERN_METHOD(requestAuthorization)
RCT_EXTERN_METHOD(fetchBeaconRegions)
RCT_EXTERN_METHOD(startScanning:(NSString * []) params)
RCT_EXTERN_METHOD(stopScanning)

@end
