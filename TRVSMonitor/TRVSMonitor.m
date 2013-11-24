//
//  TRVSXCTestAsync.m
//  TRVSXCTestAsyncExample
//
//  Created by Travis Jeffery on 10/11/13.
//  Copyright (c) 2013 Travis Jeffery. All rights reserved.
//

#import "TRVSMonitor.h"

@implementation TRVSMonitor {
    NSInteger _signalsRemaining;
    NSInteger _expectedSignalCount;
}

+ (instancetype)monitor {
    return [[self alloc] init];
}

- (instancetype)init {
    return [self initWithExpectedSignalCount:1];
}

- (instancetype)initWithExpectedSignalCount:(NSInteger)expectedSignalCount {
    self = [super init];
    if (self) {
        _expectedSignalCount = expectedSignalCount;
        [self reset];
    }
    return self;
}

- (BOOL)wait {
    return [self waitWithTimeout:0];
}

- (BOOL)waitWithSignalHandler:(TRVSMonitorHandler)handler {
    return [self waitWithTimeout:0 signalHandler:handler];
}

- (BOOL)waitWithTimeout:(NSUInteger)timeout {
    return [self waitWithTimeout:timeout signalHandler:nil];
}

- (BOOL)waitWithTimeout:(NSTimeInterval)timeout signalHandler:(TRVSMonitorHandler)handler {
    NSDate *start = [NSDate date];

    while (_signalsRemaining > 0) {
        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:.1]];
        if ([self didTimeOut:timeout fromStartDate:start]) {
            [self reset];
            return NO;
        }
        if (handler) handler(self);
    };
    [self reset];
    return YES;
}

- (void)signal {
    --_signalsRemaining;
}

- (void)reset {
    _signalsRemaining = _expectedSignalCount;
}

#pragma mark - Private

- (BOOL)didTimeOut:(NSTimeInterval)timeout fromStartDate:(NSDate *)startDate {
    return (timeout > 0 && [[NSDate date] timeIntervalSinceDate:startDate] > timeout);
}

@end
