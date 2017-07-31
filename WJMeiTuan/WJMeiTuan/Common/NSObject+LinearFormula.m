//
//  NSObject+LinearFormula.m
//  WJMeiTuan
//
//  Created by 秋贺然 on 2017/7/31.
//  Copyright © 2017年 秋贺然. All rights reserved.
//

#import "NSObject+LinearFormula.h"

@implementation NSObject (LinearFormula)

//- (CGFloat)alphaWithConsult:(CGFloat)consult andValue1:(WJValue)value1 andValue2:(WJValue)value2{
//    
//   
//    CGFloat a = (value1.result - value2.result) / (value1.consult - value2.consult);
//    CGFloat b = value1.result - a * value1.consult;
//    
//    return a * consult + b;
//}

- (CGFloat)alphaWithValue1:(WJValue)value1 andValue2:(WJValue)value2{
    
    
    CGFloat a = (value1.result - value2.result) / (value1.consult - value2.consult);
    CGFloat b = value1.result - a * value1.consult;
    
    return a * [(NSNumber *)self floatValue]  + b;
}


@end
