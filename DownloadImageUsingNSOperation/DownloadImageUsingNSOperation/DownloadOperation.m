//
//  DownloadOperation.m
//  DownloadImageUsingNSOperation
//
//  Created by wildyao on 14/12/19.
//  Copyright (c) 2014年 Wild Yaoyao. All rights reserved.
//

#import "DownloadOperation.h"

@implementation DownloadOperation

- (id)initWithURL:(NSURL *)url imageView:(UIImageView *)iv
{
    self = [super init];
    
    if (self) {
        _url = url;
        _imageView = iv;
    }
    
    return self;
}

- (void)main
{
    @try {
        @autoreleasepool {
            
            NSLog(@"current thread: %@", [NSThread currentThread]);
            
            NSData *data = [NSData dataWithContentsOfURL:self.url];
            UIImage *image = [UIImage imageWithData:data];
            
            if (image) {
                [self performSelectorOnMainThread:@selector(updateUI:) withObject:image waitUntilDone:YES];
            } else {
                NSLog(@"下载失败");
            }
        }
    }
    @catch (NSException *exception) {
        NSLog(@"Exception: %@", exception);
    }
}

- (void)updateUI:(UIImage *)image
{
    self.imageView.image = image;
}

@end
