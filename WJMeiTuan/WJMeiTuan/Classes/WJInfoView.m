//
//  WJInfoView.m
//  WJMeiTuan
//
//  Created by 秋贺然 on 2017/8/3.
//  Copyright © 2017年 秋贺然. All rights reserved.
//

#import "WJInfoView.h"
#import "WJInfoModel.h"

@interface WJInfoView ()

//图片
@property(nonatomic,weak)UIImageView *iconView;

//信息
@property(nonatomic,weak)UILabel *infoLabel;

@end

@implementation WJInfoView

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
    
    //图片
    UIImageView *iconView = [[UIImageView alloc] init];
    [self addSubview:iconView];
    
    [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.offset(0);
        make.width.equalTo(iconView.mas_height).offset(0);
    }];
    
    //信息
    UILabel *infoLabel = [[UILabel alloc] init];
    infoLabel.text = @"来吃霸王餐";
    infoLabel.textColor = [UIColor whiteColor];
    infoLabel.font = [UIFont systemFontOfSize:12];
    [self addSubview:infoLabel];
    
    [infoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(iconView.mas_right).offset(8);
        make.centerY.offset(0);
    }];
    
    _infoLabel = infoLabel;
    _iconView = iconView;
    
}

-(void)setInfoModel:(WJInfoModel *)infoModel{
    _infoModel = infoModel;
    
    //图片赋值
    [_iconView sd_setImageWithURL:[NSURL URLWithString:infoModel.icon_url]];
    
    //信息赋值
    _infoLabel.text = infoModel.info;

}

@end
