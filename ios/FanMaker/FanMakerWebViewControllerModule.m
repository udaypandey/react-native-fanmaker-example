//
//  FanMakerWebViewControllerModule.m
//  NativeModules
//
//  Created by Uday Pandey on 19/09/2023.
//

#import <Foundation/Foundation.h>
#import "React/RCTBridgeModule.h"
#import "React/RCTEventEmitter.h"

@interface RCT_EXTERN_MODULE(FanMakerWebViewControllerModule, NSObject)

RCT_EXTERN_METHOD(showFanMakerUI)

RCT_EXTERN_METHOD(hideFanMakerUI)

@end
