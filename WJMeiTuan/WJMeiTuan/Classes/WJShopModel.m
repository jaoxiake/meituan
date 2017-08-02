//
//  WJShopModel.m
//  WJMeiTuan
//
//  Created by 秋贺然 on 2017/8/2.
//  Copyright © 2017年 秋贺然. All rights reserved.
//

#import "WJShopModel.h"

@implementation WJShopModel

+ (instancetype)shopPOI_infoWithDict:(NSDictionary *)dict {
    id obj = [[self alloc] init];
    
    [obj setValuesForKeysWithDictionary:dict];
    
    return obj;
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}
@end
