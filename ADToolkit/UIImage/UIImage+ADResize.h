//
//  UIImage+ADResize.h
//  ADToolkit
//
//  Created by aidenluo on 6/23/14.
//  Copyright (c) 2014 aidenluo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ADResize)

- (UIImage *)ad_resizeImageToAspectFit:(CGSize)targetSize;
- (UIImage *)ad_resizeImageToAspectFill:(CGSize)targetSize;
- (UIImage *)ad_resizeImageToFill:(CGSize)targetSize;

@end
