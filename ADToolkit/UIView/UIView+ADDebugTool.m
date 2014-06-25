//
//  UIView+ADDebugTool.m
//  ADToolkit
//
//  Created by aidenluo on 6/25/14.
//  Copyright (c) 2014 aidenluo. All rights reserved.
//

#import "UIView+ADDebugTool.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIView (ADDebugTool)

- (void)markBorderWithRandomColor
{
    self.layer.borderColor = [UIColor colorWithRed:(arc4random() % 255 )/ 255.f green:(arc4random() % 255 )/ 255.f blue:(arc4random() % 255 )/ 255.f alpha:1].CGColor;
    self.layer.borderWidth = 1.0f;
}

- (void)markBorderWithRandomColorRecursive
{
    [self markBorderWithRandomColor];
    for (UIView *v in self.subviews) {
        [v markBorderWithRandomColorRecursive];
    }
}

- (void)markBorderWithColor:(UIColor *)color
{
    [self markBorderWithColor:color borderWidth:1.0f];
}


- (void)markBorderWithColor:(UIColor *)color borderWidth:(CGFloat)borderWidth
{
    self.layer.borderWidth = borderWidth;
    self.layer.borderColor = color.CGColor;
}

@end
