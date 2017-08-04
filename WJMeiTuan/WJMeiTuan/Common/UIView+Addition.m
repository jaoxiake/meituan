//
//  UIView+Addition.m
//  WJMeiTuan
//
//  Created by 秋贺然 on 2017/8/4.
//  Copyright © 2017年 秋贺然. All rights reserved.
//

#import "UIView+Addition.h"

@implementation UIView (Addition)

-(UIViewController *)viewController{

    //获取下一个响应对象
    UIResponder *res = [self nextResponder];
    
    //判断响应者是否是控制器
    while (res){
    
    if ([res isKindOfClass:[UIViewController class]]) {
        return (UIViewController *)res;
    }
    //继续寻找下一个响应者
    res = [res nextResponder];
}
    return nil;
}

@end
