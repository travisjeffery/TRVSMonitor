//
//  TRVSXCTestAsync.m
//  TRVSXCTestAsyncExample
//
//  Created by Travis Jeffery on 10/11/13.
//  Copyright (c) 2013 Travis Jeffery. All rights reserved.
//

#import "TRVSTestManagerHandler.h"

@implementation TRVSTestManagerHandler {
    int _signalsRemaining;
    int _expectedSignalCount;
}

- (id)init {
    return [self initWithExpectedSignalCount:1];
}

- (id)initWithExpectedSignalCount:(NSInteger)expectedSignalCount {
    self = [super init];
    if (self) {
        _expectedSignalCount = expectedSignalCount;
        [self reset];
    }
    return self;
}

- (void)wait {
    [self waitWithTimeout:0];
}

- (void)waitWithPeriodicHandler:(TRVSTestManagerHandler)handler {
    [self waitWithTimeout:0 periodicHandler:handler];
}

- (BOOL)waitWithTimeout:(NSUInteger)timeout {
    return [self waitWithTimeout:timeout periodicHandler:nil];
}

- (BOOL)waitWithTimeout:(NSUInteger)timeout periodicHandler:(TRVSTestManagerHandler)handler {
    NSDate *start = [NSDate date];
    
    while (_signalsRemaining > 0) {
        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:.1]];
        if (timeout > 0 &&
            [[NSDate date] timeIntervalSinceDate:start] > timeout) {
            [self reset];
            return NO;
        }
        if (handler) {
            handler(self);
        }
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

@end
