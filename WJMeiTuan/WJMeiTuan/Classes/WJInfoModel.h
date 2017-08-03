//
//  WJInfoModel.h
//  WJMeiTuan
//
//  Created by 秋贺然 on 2017/8/3.
//  Copyright © 2017年 秋贺然. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WJInfoModel : NSObject

//图片
@property (nonatomic,copy) NSString *icon_url ;

//信息
@property (nonatomic,copy) NSString *info;

+(instancetype)infoWithDict:(NSDictionary *)dict;
@end
