//
//  WJShopHeaderView.m
//  WJMeiTuan
//
//  Created by 秋贺然 on 2017/8/3.
//  Copyright © 2017年 秋贺然. All rights reserved.
//

#import "WJShopHeaderView.h"
#import "WJShopModel.h"
#import "WJInfoLoopView.h"
#import "WJShopDetailController.h"
#import "WJDetailAnimator.h"

@interface WJShopHeaderView ()

//头部背景图片
@property(nonatomic,weak)UIImageView *bjView;

//头像
@property(nonatomic,weak)UIImageView *touXiang;

//店名
@property (nonatomic, weak) UILabel *nameLabel;

//商家公告
@property (nonatomic, weak) UILabel *bulletinLabel;

//轮播视图
@property (nonatomic, weak) WJInfoLoopView *loopView;

//代理对象
@property(nonatomic,strong) WJDetailAnimator *animator;

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
    WJInfoLoopView *loopView = [[WJInfoLoopView alloc] init];
    loopView.clipsToBounds = YES;
    [self addSubview:loopView];
    
    [loopView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(16);
        make.right.offset(-16);
        make.bottom.offset(-8);
        make.height.offset(20);
    }];
    
    
    //添加轮播视图右边的小箭头
    UIImageView *arrowView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_arrow_white"]];
    [loopView addSubview:arrowView];
    
    [arrowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(0);
        make.centerY.offset(0);
    }];
    
    //分割线
    UIView *dashLineView = [[UIView alloc] init];
    dashLineView.backgroundColor = [UIColor colorWithPatternImage:[UIImage dashLineWithColor:[UIColor whiteColor]]];
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
    _nameLabel = nameLabel;
    _bulletinLabel = bulletinLabel;
    _loopView = loopView;
    
    // TODO:轮播视图敲击事件
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(loopViewClick)];
    [loopView addGestureRecognizer:tap];
    
}

#pragma mark - 轮播视图敲击事件
- (void)loopViewClick{
    
    //创建商家详情页
    WJShopDetailController *shopDetailVc = [[WJShopDetailController alloc] init];
    
    //传递数据
    shopDetailVc.shopPOI_infoModel = _shopPOI_infoModel;
    
    //动画模式自定义
    shopDetailVc.modalPresentationStyle = UIModalPresentationCustom;
    
    //创建转场代理对象
    _animator = [[WJDetailAnimator alloc] init];
    
    //给要modal出的控制器设置转场代理
    shopDetailVc.transitioningDelegate = _animator;
    
    // TODO:modal跳转
    [self.viewController presentViewController:shopDetailVc animated:YES completion:^{
        nil;
    }];
    
}

-(void)setShopPOI_infoModel:(WJShopModel *)shopPOI_infoModel{

    _shopPOI_infoModel = shopPOI_infoModel;
    
    //头部背景图片
    NSString *bjViewURL = [shopPOI_infoModel.poi_back_pic_url stringByDeletingPathExtension];
    [_bjView sd_setImageWithURL:[NSURL URLWithString:bjViewURL]];
    
    //头像
    NSString *touxiangURL = [shopPOI_infoModel.pic_url stringByDeletingPathExtension];
    [_touXiang sd_setImageWithURL:[NSURL URLWithString:touxiangURL]];
    
    //店名
    _nameLabel.text = shopPOI_infoModel.name;
    
    //商家公告
    _bulletinLabel.text = shopPOI_infoModel.bulletin;

   
    //优惠信息
    _loopView.discounts = shopPOI_infoModel.discounts;
}

@end
