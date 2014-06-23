//
//  UIImage+ADResize.m
//  ADToolkit
//
//  Created by aidenluo on 6/23/14.
//  Copyright (c) 2014 aidenluo. All rights reserved.
//

#import "UIImage+ADResize.h"

typedef NS_ENUM(NSInteger, ADResizeImageType)
{
    ADResizeImageAspectFit,
    ADResizeImageAspectFill,
    ADResizeImageFill,
};

@implementation UIImage (ADResize)

#pragma mark - Public

- (UIImage *)ad_resizeImageToAspectFit:(CGSize)targetSize
{
    return [self ad_resizeImageTo:targetSize resizeType:ADResizeImageAspectFit];
}

- (UIImage *)ad_resizeImageToAspectFill:(CGSize)targetSize
{
    return [self ad_resizeImageTo:targetSize resizeType:ADResizeImageAspectFill];
}

- (UIImage *)ad_resizeImageToFill:(CGSize)targetSize
{
    return [self ad_resizeImageTo:targetSize resizeType:ADResizeImageFill];
}

#pragma mark - Private

- (UIImage *)ad_resizeImageTo:(CGSize)targetSize resizeType:(ADResizeImageType)type
{
    NSAssert(self.size.width != 0 && self.size.height != 0, @"Invalid image size");
    CGFloat widthRatio = targetSize.width / self.size.width;
    CGFloat heightRatio = targetSize.height / self.size.height;
    CGSize resizeSize;
    switch (type) {
        case ADResizeImageAspectFit:
        {
            CGFloat resizeRatio = MIN(widthRatio, heightRatio);
            resizeSize = CGSizeMake(roundf(self.size.width * resizeRatio), roundf(self.size.height * resizeRatio));
            break;
        }
        case ADResizeImageAspectFill:
        {
            CGFloat resizeRatio = MAX(widthRatio, heightRatio);
            resizeSize = CGSizeMake(roundf(self.size.width * resizeRatio), roundf(self.size.height * resizeRatio));
            break;
        }
        case ADResizeImageFill:
            resizeSize = targetSize;
            break;
        default:
            resizeSize = targetSize;
            break;
    }
    UIGraphicsBeginImageContext(resizeSize);
    [self drawInRect:CGRectMake(0, 0, resizeSize.width, resizeSize.height)];
    UIImage *resizeImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resizeImage;
}

@end
