//
//  TRVSXCTestAsync.h
//  TRVSXCTestAsyncExample
//
//  Created by Travis Jeffery on 10/11/13.
//  Copyright (c) 2013 Travis Jeffery. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TRVSTestManager;

typedef void (^TRVSTestManagerHandler)(TRVSTestManager *manager);

@interface TRVSTestManager : NSObject
- (id)init;
- (id)initWithExpectedSignalCount:(NSInteger)expectedSignalCount;
- (void)wait;
- (BOOL)waitWithTimeout:(NSUInteger)timeout;
- (void)waitWithPeriodicHandler:(TRVSTestManagerHandler)handler;
- (BOOL)waitWithTimeout:(NSUInteger)timeout periodicHandler:(TRVSTestManagerHandler)handler;
- (void)signal;
@end
