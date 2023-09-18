//
//  RCTHelloModule.h
//  NativeModules
//
//  Created by Uday Pandey on 18/09/2023.
//

#ifndef RCTHelloModule_h
#define RCTHelloModule_h


// CalendarManagerBridge.m
#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(HelloModule, NSObject)

RCT_EXTERN_METHOD(hello:(NSString *)name)

@end

#endif /* RCTHelloModule_h */
