//
//  UIAlertView+Block.m
//  ADToolkit
//
//  Created by aidenluo on 6/26/14.
//  Copyright (c) 2014 aidenluo. All rights reserved.
//

#import "UIAlertView+Block.h"
#import <objc/runtime.h>

static char kDismissBlockKey;
static char kCancelBlockKey;

@implementation UIAlertView (Block)

+ (UIAlertView*) alertViewWithTitle:(NSString*) title
                            message:(NSString*) message
                  cancelButtonTitle:(NSString*) cancelButtonTitle
                  otherButtonTitles:(NSArray*) otherButtons
                           subViews:(NSArray*) subViews
                          onDismiss:(UIAlertViewDismissBlock) dismissed
                           onCancel:(UIAlertViewCancelBlock) cancelled
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:message
                                                   delegate:[self class]
                                          cancelButtonTitle:cancelButtonTitle
                                          otherButtonTitles:nil];
    
    for(NSString *buttonTitle in otherButtons)
        [alert addButtonWithTitle:buttonTitle];
    
    for (UIView *view in subViews) {
        [alert addSubview:view];
    }
    
	objc_setAssociatedObject(alert, &kDismissBlockKey, dismissed, OBJC_ASSOCIATION_COPY_NONATOMIC);
	objc_setAssociatedObject(alert, &kCancelBlockKey, cancelled, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    [alert show];
    return alert;
}

+ (UIAlertView*) alertViewWithTitle:(NSString*) title
							message:(NSString*) message
				  cancelButtonTitle:(NSString*) cancelButtonTitle
				  otherButtonTitles:(NSArray*) otherButtons
						  onDismiss:(UIAlertViewDismissBlock) dismissed
						   onCancel:(UIAlertViewCancelBlock) cancelled
{
    
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:message
                                                   delegate:[self class]
                                          cancelButtonTitle:cancelButtonTitle
                                          otherButtonTitles:nil];
    
    for(NSString *buttonTitle in otherButtons)
        [alert addButtonWithTitle:buttonTitle];
    
	objc_setAssociatedObject(alert, &kDismissBlockKey, dismissed, OBJC_ASSOCIATION_COPY_NONATOMIC);
	objc_setAssociatedObject(alert, &kCancelBlockKey, cancelled, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    [alert show];
    return alert;
}

+ (UIAlertView*) alertViewWithTitle:(NSString*) title
							message:(NSString*) message
				  cancelButtonTitle:(NSString*) cancelButtonTitle
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:message
                                                   delegate:nil
                                          cancelButtonTitle:cancelButtonTitle
                                          otherButtonTitles:nil];
    [alert show];
    return alert;
}


+ (void)alertView:(UIAlertView*) alertView didDismissWithButtonIndex:(NSInteger) buttonIndex
{
	UIAlertViewDismissBlock _dismissBlock = objc_getAssociatedObject(alertView, &kDismissBlockKey);
	UIAlertViewCancelBlock _cancelBlock = objc_getAssociatedObject(alertView, &kCancelBlockKey);;
    
	if(buttonIndex == [alertView cancelButtonIndex])
	{
        if (_cancelBlock) {
            _cancelBlock();
        }
	}
    else
    {
        if (_dismissBlock) {
            _dismissBlock(buttonIndex - 1);
        }
    }
	_dismissBlock = nil;
	_cancelBlock = nil;
}


@end
