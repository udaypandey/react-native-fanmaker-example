//
//  RCTCalendarModule.m
//  NativeModules
//
//  Created by Uday Pandey on 17/09/2023.
//

#import <Foundation/Foundation.h>
// RCTCalendarModule.m
#import "RCTCalendarModule.h"
#import <React/RCTLog.h>

@implementation RCTCalendarModule

// To export a module named RCTCalendarModule
RCT_EXPORT_MODULE(  );

RCT_EXPORT_METHOD(createCalendarEvent:(NSString *)title location:(NSString *)location callback: (RCTResponseSenderBlock)callback)
{
  NSInteger eventId = 1;
  callback(@[@(eventId)]);
  
  RCTLogInfo(@"Pretending to create an event %@ at %@", title, location);
}


@end
