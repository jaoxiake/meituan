//
//  WJShopModel.m
//  WJMeiTuan
//
//  Created by 秋贺然 on 2017/8/2.
//  Copyright © 2017年 秋贺然. All rights reserved.
//

#import "WJShopModel.h"
#import "WJInfoModel.h"

@implementation WJShopModel

+ (instancetype)shopPOI_infoWithDict:(NSDictionary *)dict {
    id obj = [[self alloc] init];
    
    [obj setValuesForKeysWithDictionary:dict];
    
    return obj;
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
    if ([key isEqualToString:@"discounts2"]) {
        NSArray *discounts2Arr = value;
        NSMutableArray *arrM = [NSMutableArray arrayWithCapacity:discounts2Arr.count];
        for (NSDictionary *dict in discounts2Arr) {
            WJInfoModel *infoModel = [WJInfoModel infoWithDict:dict];
            [arrM addObject:infoModel];
        }
        _discounts = arrM.copy;
    }
    
}
@end
