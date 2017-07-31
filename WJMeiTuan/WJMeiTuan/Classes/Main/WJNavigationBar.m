//
//  WJNavigationBar.m
//  WJMeiTuan
//
//  Created by 秋贺然 on 2017/7/31.
//  Copyright © 2017年 秋贺然. All rights reserved.
//

#import "WJNavigationBar.h"

@implementation WJNavigationBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        //导航条透明
        [self setShadowImage:[UIImage new]];
        [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        
        
        //导航条背景图
        UIImageView *bgImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_navigationBar_white"]];
        [self addSubview:bgImageView];
        
        [bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.offset(0);
        }];
        
        _bgImageView = bgImageView;
        
    }
    return self;
}


@end
