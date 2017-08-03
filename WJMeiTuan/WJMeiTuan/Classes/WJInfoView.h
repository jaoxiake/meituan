//
//  WJInfoView.h
//  WJMeiTuan
//
//  Created by 秋贺然 on 2017/8/3.
//  Copyright © 2017年 秋贺然. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WJInfoModel;

@interface WJInfoView : UIView

//接收优惠信息数组
@property (nonatomic,strong) WJInfoModel *infoModel;
@end
