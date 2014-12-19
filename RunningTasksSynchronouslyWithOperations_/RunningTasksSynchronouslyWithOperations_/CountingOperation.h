//
//  CountingOperation.h
//  RunningTasksSynchronouslyWithOperations_
//
//  Created by wildyao on 14/12/19.
//  Copyright (c) 2014年 Wild Yaoyao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CountingOperation : NSOperation

- (instancetype)initWithStartingCount:(NSUInteger)paramStartingCount
                          endingCount:(NSUInteger)paramEndingCount;

@end
