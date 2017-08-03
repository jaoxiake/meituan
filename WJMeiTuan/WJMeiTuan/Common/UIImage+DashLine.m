//
//  UIImage+DashLine.m
//  WJMeiTuan
//
//  Created by 秋贺然 on 2017/8/3.
//  Copyright © 2017年 秋贺然. All rights reserved.
//

#import "UIImage+DashLine.h"

@implementation UIImage (DashLine)

+(instancetype)dashLineWithColor:(UIColor *)color{
    //开启图片类型上下文
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(4, 1), NO, 0);
    //获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    //路径
    CGContextMoveToPoint(ctx, 0, 0);
    CGContextAddLineToPoint(ctx, 4, 0);
    
    //虚线
    CGFloat lenths[] = {2,2};
    CGContextSetLineDash(ctx, 0, lenths, 2);
    
    //设置颜色
    [color set];
    
    //渲染
    CGContextStrokePath(ctx);
    
    //获取上下文中的图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    //关闭图片类型上下文
    UIGraphicsEndImageContext();
    
    return image;
}
@end
