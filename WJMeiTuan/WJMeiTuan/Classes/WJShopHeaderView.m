//
//  WJShopHeaderView.m
//  WJMeiTuan
//
//  Created by 秋贺然 on 2017/8/3.
//  Copyright © 2017年 秋贺然. All rights reserved.
//

#import "WJShopHeaderView.h"
#import "WJShopModel.h"

@interface WJShopHeaderView ()
//头部背景图片
@property(nonatomic,weak)UIImageView *bjView;

//头像
@property(nonatomic,weak)UIImageView *touXiang;
@end

@implementation WJShopHeaderView

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
    
    //背景图
    UIImageView *bjView = [[UIImageView alloc]init];
    [self addSubview:bjView];
    
    //填充模式
    bjView.contentMode = UIViewContentModeScaleAspectFill;
    
    [bjView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.offset(0);
    }];
    
    //轮播图
    UIView *loopView = [[UIView alloc] init];
    loopView.backgroundColor = [UIColor redColor];
    [self addSubview:loopView];
    
    [loopView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(16);
        make.right.offset(-16);
        make.bottom.offset(-8);
        make.height.offset(20);
    }];
    
    //分割线
    UIView *dashLineView = [[UIView alloc] init];
    dashLineView.backgroundColor = [UIColor whiteColor];
    [self addSubview:dashLineView];
    
    [dashLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(loopView).offset(0);
        make.right.offset(0);
        make.bottom.equalTo(loopView.mas_top).offset(-8);
        make.height.offset(1);
    }];
    
    //头像
    UIImageView *touXiang = [[UIImageView alloc] init];
    touXiang.backgroundColor = [UIColor blueColor];
    [self addSubview:touXiang];
    
    //圆角
    touXiang.layer.cornerRadius = 32;
    touXiang.clipsToBounds = YES;
    
    //边框
    touXiang.layer.borderColor = (__bridge CGColorRef _Nullable)([UIColor colorWithWhite:1 alpha:0.7]);
    touXiang.layer.borderWidth = 2;
    
    
    [touXiang mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(dashLineView).offset(0);
        make.bottom.equalTo(dashLineView.mas_top).offset(-8);
        make.width.height.offset(64);
    }];
    
    
    //店名
    UILabel *nameLabel = [UILabel makeLabelWithText:@"粮新发现(修正店)" andTextFont:16 andTextColor:[UIColor whiteColor]];
    [self addSubview:nameLabel];
    
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(touXiang.mas_right).offset(16);
        make.centerY.equalTo(touXiang.mas_centerY).offset(-16);
    }];
    
    //公告
    UILabel *bulletinLabel = [UILabel makeLabelWithText:@"公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告" andTextFont:16 andTextColor:[UIColor colorWithWhite:1 alpha:0.9]];
    [self addSubview:bulletinLabel];
    
    [bulletinLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(nameLabel).offset(0);
        make.centerY.equalTo(touXiang.mas_centerY).offset(16);
        make.right.offset(-16);
    }];
    
    
    _bjView = bjView;
    _touXiang = touXiang;
    
}

-(void)setPoi_infoModel:(WJShopModel *)poi_infoModel{

    _poi_infoModel = poi_infoModel;
    
    NSString *bjViewURL = [poi_infoModel.poi_back_pic_url stringByDeletingPathExtension];
    [_bjView sd_setImageWithURL:[NSURL URLWithString:bjViewURL]];
    
    NSString *touxiangURL = [poi_infoModel.pic_url stringByDeletingPathExtension];
    [_touXiang sd_setImageWithURL:[NSURL URLWithString:touxiangURL]];

}
@end