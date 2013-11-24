//
//  TRVSXCTestAsync.h
//  TRVSXCTestAsyncExample
//
//  Created by Travis Jeffery on 10/11/13.
//  Copyright (c) 2013 Travis Jeffery. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TRVSMonitor;

typedef void (^TRVSMonitorHandler)(TRVSMonitor *monitor);

@interface TRVSMonitor : NSObject
+ (instancetype)monitor;
- (instancetype)init;
- (instancetype)initWithExpectedSignalCount:(NSInteger)expectedSignalCount;
- (BOOL)wait;
- (BOOL)waitWithTimeout:(NSUInteger)timeout;
- (BOOL)waitWithSignalHandler:(TRVSMonitorHandler)handler;
- (BOOL)waitWithTimeout:(NSTimeInterval)timeout signalHandler:(TRVSMonitorHandler)handler;
- (void)signal;
@end
