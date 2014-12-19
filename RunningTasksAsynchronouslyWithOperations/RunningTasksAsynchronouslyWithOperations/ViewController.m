//
//  ViewController.m
//  RunningTasksAsynchronouslyWithOperations
//
//  Created by wildyao on 14/12/18.
//  Copyright (c) 2014年 Wild Yaoyao. All rights reserved.
//

#import "ViewController.h"
#import "SimpleOperation.h"

@interface ViewController ()

@property (nonatomic, strong) NSOperationQueue *operationQueue;
@property (nonatomic, strong) SimpleOperation *firstOperation;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSNumber *firstNumber = @111;
    
    self.firstOperation = [[SimpleOperation alloc] initWithObject:firstNumber];
    self.operationQueue = [[NSOperationQueue alloc] init];
    
    [self.operationQueue addOperation:self.firstOperation];
//    [self.firstOperation start];
    
    NSLog(@"Main thread is here");
}


@end
