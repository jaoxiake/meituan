//
//  WJShopModel.h
//  WJMeiTuan
//
//  Created by 秋贺然 on 2017/8/2.
//  Copyright © 2017年 秋贺然. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WJShopModel : NSObject

//头部背景图片
@property(nonatomic,copy)NSString *poi_back_pic_url;

//头像
@property(nonatomic,copy)NSString *pic_url;

+ (instancetype)shopPOI_infoWithDict:(NSDictionary *)dict;
@end
