//
//  UIView+ADGestureAction.h
//  ADToolkit
//
//  Created by aidenluo on 6/25/14.
//  Copyright (c) 2014 aidenluo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^GestureActionBlock)(UIGestureRecognizer *gestureRecoginzer);

@interface UIView (ADGestureAction)

- (void)setTapActionWithBlock:(GestureActionBlock)block;
- (void)setLongPressActionWithBlock:(GestureActionBlock)block;

@end
