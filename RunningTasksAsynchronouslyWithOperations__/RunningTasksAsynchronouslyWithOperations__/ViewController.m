//
//  ViewController.m
//  RunningTasksAsynchronouslyWithOperations__
//
//  Created by wildyao on 14/12/19.
//  Copyright (c) 2014年 Wild Yaoyao. All rights reserved.
//

#import "ViewController.h"
#import "SimpleOperation.h"

@interface ViewController ()

@property (nonatomic, strong) NSOperationQueue *operationQueue;
@property (nonatomic, strong) SimpleOperation *firstOperation;
@property (nonatomic, strong) SimpleOperation *secondOperation;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSNumber *firstNumber = @111;
    NSNumber *secondNumber = @222;
    
    self.firstOperation = [[SimpleOperation alloc] initWithObject:firstNumber];
    self.secondOperation = [[SimpleOperation alloc] initWithObject:secondNumber];
    
    self.operationQueue = [[NSOperationQueue alloc] init];
    
    [self.operationQueue addOperation:self.firstOperation];
    [self.operationQueue addOperation:self.secondOperation];
    
    NSLog(@"Main thread is here");

}


@end
