//
//  DownloadOperation.h
//  DownloadImageUsingNSOperation
//
//  Created by wildyao on 14/12/19.
//  Copyright (c) 2014年 Wild Yaoyao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DownloadOperation : NSOperation

@property (nonatomic, strong) NSURL *url;

@property (nonatomic, strong) UIImageView *imageView;

- (id)initWithURL:(NSURL *)url imageView:(UIImageView *)iv;

@end
