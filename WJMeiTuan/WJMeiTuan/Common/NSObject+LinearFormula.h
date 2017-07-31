//
//  NSObject+LinearFormula.h
//  WJMeiTuan
//
//  Created by 秋贺然 on 2017/7/31.
//  Copyright © 2017年 秋贺然. All rights reserved.
//

#import <Foundation/Foundation.h>
struct WJValue {
    CGFloat consult;
    CGFloat result;
};
typedef struct WJValue WJValue;

CG_INLINE WJValue
WJValueMake(CGFloat consult, CGFloat result)
{
    WJValue value; value.consult = consult; value.result = result; return value;
}

@interface NSObject (LinearFormula)

//- (CGFloat)alphaWithConsult:(CGFloat)consult andValue1:(WJValue)value1 andValue2:(WJValue)value2;
- (CGFloat)alphaWithValue1:(WJValue)value1 andValue2:(WJValue)value2;

@end
