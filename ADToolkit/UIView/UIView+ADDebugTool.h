//
//  UIView+ADDebugTool.h
//  ADToolkit
//
//  Created by aidenluo on 6/25/14.
//  Copyright (c) 2014 aidenluo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ADDebugTool)

//mark view's layer border help debug view UI frame and view tree(ref:eson)
- (void)markBorderWithRandomColor;
- (void)markBorderWithRandomColorRecursive;
- (void)markBorderWithColor:(UIColor *)color;
- (void)markBorderWithColor:(UIColor *)color borderWidth:(CGFloat)borderWidth;

@end
