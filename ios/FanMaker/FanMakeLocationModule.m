//
//  FanMakeLocationModule.m
//  NativeModules
//
//  Created by Uday Pandey on 18/09/2023.
//

#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(FanMakerLocationModule, NSObject)

RCT_EXTERN_METHOD(enableLocationTracking)

RCT_EXTERN_METHOD(disableLocationTracking)

@end
