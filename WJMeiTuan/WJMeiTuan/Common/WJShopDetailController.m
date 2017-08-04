//
//  WJShopDetailController.m
//  WJMeiTuan
//
//  Created by 秋贺然 on 2017/8/4.
//  Copyright © 2017年 秋贺然. All rights reserved.
//

#import "WJShopDetailController.h"
#import "WJShopModel.h"
#import "WJInfoView.h"

#define KMargin 16

@interface WJShopDetailController ()

@end

@implementation WJShopDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    
}

- (void)setupUI{
    
    //背景图片
    UIImageView *imageView = [[UIImageView alloc] init];
    [imageView sd_setImageWithURL:[NSURL URLWithString:[_shopPOI_infoModel.poi_back_pic_url stringByDeletingPathExtension]]];
    [self.view addSubview:imageView];
    
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.offset(0);
    }];
    
    //按钮
    UIButton *btn = [[UIButton alloc] init];
    [btn setImage:[UIImage imageNamed:@"btn_close_normal"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"btn_close_selected"] forState:UIControlStateHighlighted];
    [self.view addSubview:btn];
    
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset(0);
        make.bottom.offset(-60);
    }];
    
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    
    //滚动视图
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    [self.view addSubview:scrollView];
    
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.offset(0);
        make.bottom.equalTo(btn.mas_top).offset(-60);
        
    }];
    
    //UIView
    UIView *bjView = [[UIView alloc] init];
    [scrollView addSubview:bjView];
    
    
    [bjView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.offset(0);
        make.width.equalTo(scrollView).offset(0);
        //暂时高
//        make.height.offset(1000);
    }];
    
    //店名
    UILabel *nameLabel = [UILabel makeLabelWithText:_shopPOI_infoModel.name andTextFont:14 andTextColor:[UIColor whiteColor]];
    [bjView addSubview:nameLabel];
    
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset(0);
        make.top.offset(60);
    }];
    
    //tips提示
    UILabel *tipsLabel = [UILabel makeLabelWithText:[NSString stringWithFormat:@"%@ | %@ | %@",_shopPOI_infoModel.min_price_tip,_shopPOI_infoModel.shipping_fee_tip,_shopPOI_infoModel.delivery_time_tip] andTextFont:12 andTextColor:[UIColor colorWithWhite:1 alpha:0.9]];
    [bjView addSubview:tipsLabel];
    
    [tipsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset(0);
        make.top.equalTo(nameLabel.mas_bottom).offset(8);
    }];
    
    //折扣信息
    UILabel *discountLabel = [UILabel makeLabelWithText:@"折扣信息" andTextFont:16 andTextColor:[UIColor whiteColor]];
    [bjView addSubview:discountLabel];
    
    [discountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset(0);
        make.top.equalTo(tipsLabel.mas_bottom).offset(20);
    }];
    
    //分割线
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = [UIColor whiteColor];
    [bjView addSubview:lineView];
    
    
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(discountLabel).offset(0);
        make.left.offset(KMargin);
        make.right.equalTo(discountLabel.mas_left).offset(-KMargin);
        make.height.offset(1);
    }];
    
    UIView *lineView2 = [[UIView alloc] init];
    lineView2.backgroundColor = [UIColor whiteColor];
    [bjView addSubview:lineView2];
    
    
    [lineView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(discountLabel).offset(0);
        make.right.offset(-KMargin);
        make.left.equalTo(discountLabel.mas_right).offset(KMargin);
        make.height.offset(1);
    }];
    
    //折扣信息列表
    UIStackView *stackView = [[UIStackView alloc] init];
    //水平方向
    stackView.axis = UILayoutConstraintAxisVertical;
    //分布方式
    stackView.distribution = UIStackViewDistributionFillEqually;
    //间隔
    stackView.spacing = 10;
    
    for (WJInfoModel *infoModel in _shopPOI_infoModel.discounts) {
        WJInfoView *infoView = [[WJInfoView alloc] init];
        infoView.infoModel = infoModel;
        [stackView addArrangedSubview:infoView];
    }

    [bjView addSubview:stackView];
    
    [stackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(KMargin);
        make.right.offset(-KMargin);
        make.top.equalTo(lineView.mas_bottom).offset(20);
        make.height.offset(_shopPOI_infoModel.discounts.count * 30);
    }];

    
    
    //折扣信息
    UILabel *bulletinLabel = [UILabel makeLabelWithText:@"公告信息" andTextFont:16 andTextColor:[UIColor whiteColor]];
    [bjView addSubview:bulletinLabel];
    
    [bulletinLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset(0);
        make.top.equalTo(stackView.mas_bottom).offset(20);
    }];
    
    //分割线
    UIView *lineView3 = [[UIView alloc] init];
    lineView3.backgroundColor = [UIColor whiteColor];
    [bjView addSubview:lineView3];
    
    
    [lineView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(bulletinLabel).offset(0);
        make.left.offset(KMargin);
        make.right.equalTo(bulletinLabel.mas_left).offset(-KMargin);
        make.height.offset(1);
    }];
    
    UIView *lineView4 = [[UIView alloc] init];
    lineView4.backgroundColor = [UIColor whiteColor];
    [bjView addSubview:lineView4];
    
    
    [lineView4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(bulletinLabel).offset(0);
        make.right.offset(-KMargin);
        make.left.equalTo(bulletinLabel.mas_right).offset(KMargin);
        make.height.offset(1);
    }];
    
    // TODO: 商家公告信息
    UILabel *shopBulletionInfoLabel = [UILabel makeLabelWithText:_shopPOI_infoModel.bulletin andTextFont:12 andTextColor:[UIColor colorWithWhite:1 alpha:0.9]];
    [bjView addSubview:shopBulletionInfoLabel];
    shopBulletionInfoLabel.numberOfLines = 0; // 自动换行
    
    [shopBulletionInfoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(KMargin);
        make.top.equalTo(bulletinLabel.mas_bottom).offset(KMargin);
        make.right.offset(-KMargin);
        
        //父控件高度
        make.bottom.offset(-KMargin);
    }];

    
}

#pragma mark - 关闭商家详情页面
- (void)btnClick{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - 状态栏颜色
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
