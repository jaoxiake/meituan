//
//  WJShopHeaderView.h
//  WJMeiTuan
//
//  Created by 秋贺然 on 2017/8/3.
//  Copyright © 2017年 秋贺然. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WJShopModel;

@interface WJShopHeaderView : UIView
//接收poi_info模型数据
@property(nonatomic,strong)WJShopModel *shopPOI_infoModel;
@end
