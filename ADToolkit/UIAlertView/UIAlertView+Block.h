//
//  UIAlertView+Block.h
//  ADToolkit
//
//  Created by aidenluo on 6/26/14.
//  Copyright (c) 2014 aidenluo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^UIAlertViewDismissBlock)(NSInteger buttonIndex);
typedef void (^UIAlertViewCancelBlock)();

@interface UIAlertView (Block)

+ (UIAlertView*) alertViewWithTitle:(NSString*) title
                            message:(NSString*) message
                  cancelButtonTitle:(NSString*) cancelButtonTitle;

+ (UIAlertView*) alertViewWithTitle:(NSString*) title
                            message:(NSString*) message
                  cancelButtonTitle:(NSString*) cancelButtonTitle
                  otherButtonTitles:(NSArray*) otherButtons
                          onDismiss:(UIAlertViewDismissBlock) dismissed
                           onCancel:(UIAlertViewCancelBlock) cancelled;

+ (UIAlertView*) alertViewWithTitle:(NSString*) title
                            message:(NSString*) message
                  cancelButtonTitle:(NSString*) cancelButtonTitle
                  otherButtonTitles:(NSArray*) otherButtons
                           subViews:(NSArray*) subViews
                          onDismiss:(UIAlertViewDismissBlock) dismissed
                           onCancel:(UIAlertViewCancelBlock) cancelled;

@end
