//
//  WJInfoLoopView.m
//  WJMeiTuan
//
//  Created by 秋贺然 on 2017/8/3.
//  Copyright © 2017年 秋贺然. All rights reserved.
//

#import "WJInfoLoopView.h"
#import "WJInfoView.h"
#import "WJInfoModel.h"

@interface WJInfoLoopView ()

//第一个
@property (nonatomic,weak)UIView *infoView1;
@property (nonatomic,weak)UIView *infoView2;

@end

@implementation WJInfoLoopView


-(void)awakeFromNib{
    
    [super awakeFromNib];
    [self setupUI];
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}


- (void)setupUI{

    WJInfoView *infoView1 = [[WJInfoView alloc] init];
    [self addSubview:infoView1];
    
    [infoView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.offset(0);
        make.right.offset(-16);
    }];
    
    WJInfoView *infoView2 = [[WJInfoView alloc] init];
    [self addSubview:infoView2];
    
    [infoView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(infoView1).offset(0);
        make.height.width.equalTo(infoView1).offset(0);
        make.top.equalTo(infoView1.mas_bottom).offset(0);
    }];
    _infoView1 = infoView1;
    _infoView2 = infoView2;
    
}

-(void)setDiscounts:(NSArray<WJInfoModel *> *)discounts{
    _discounts = discounts;
    
    
}



@end
