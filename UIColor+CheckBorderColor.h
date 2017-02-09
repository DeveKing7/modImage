//
//  UIColor+CheckBorderColor.h
//  CeckColor
//
//  Created by 美迅 on 16/9/21.
//  Copyright © 2016年 ShouQu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (CheckBorderColor)
/**检查图像边缘有没有白色*/

+ (BOOL) checkBorderWhite:(UIImage*) image;
+ (UIImage *)getBorderWhite:(UIImage*) image;

+ (UIImage *)drawImage:(UIImage *)image;
@end
