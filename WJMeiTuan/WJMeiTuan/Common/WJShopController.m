//
//  WJShopController.m
//  WJMeiTuan
//
//  Created by 秋贺然 on 2017/7/31.
//  Copyright © 2017年 秋贺然. All rights reserved.
//

#import "WJShopController.h"
#import "WJFoodDetailController.h"
#import "WJNavigationBar.h"
#import "WJShopCommentController.h"
#import "WJShopInfoController.h"
#import "WJShopOrderController.h"

// 头部视图的最大和最小高度
#define KShopHeaderViewMaxHeight   180
#define KShopHeaderViewMinHeight   64

@interface WJShopController ()

//headerView头部视图
@property(nonatomic,weak)UIView *headerView;

//tagView标签视图
@property(nonatomic,weak)UIView *tagView;

@end

@implementation WJShopController

- (void)viewDidLoad {
    
    // TODO:创建头部视图
    [self settingHeaderView];

    [super viewDidLoad];

    self.view.backgroundColor = [UIColor blueColor];
    
    // TODO:创建默认视图
    [self settingNormal];
    
    // TODO:创建标签视图
    [self settingShopTagView];
    
    // TODO:创建滚动视图
    [self settingShopScrollView];

    
}

#pragma mark - 创建标签视图
- (void)settingShopTagView{

    UIView *tagView = [[UIView alloc] init];
    tagView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:tagView];
    
    [tagView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.top.equalTo(_headerView.mas_bottom).offset(0);
        make.height.offset(44);
    }];
    
    _tagView = tagView;
    
    // TODO:添加标签中按钮
    UIButton *order = [self makeTagBtnWithTitle:@"点菜"];
    //默认加粗
    order.titleLabel.font = [UIFont boldSystemFontOfSize:14];
    
    [self makeTagBtnWithTitle:@"评价"];
    [self makeTagBtnWithTitle:@"商家"];
    
    [tagView.subviews mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
    }];
    
    [tagView.subviews mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
    
    // TODO:添加小黄条
    UIView *yellowView = [[UIView alloc] init];
    yellowView.backgroundColor = [UIColor primaryYellowColor];
    [tagView addSubview:yellowView];
    
    [yellowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.offset(50);
        make.height.offset(4);
        make.bottom.offset(0);
        make.centerX.equalTo(order.mas_centerX).offset(0);
    }];
    
}

#pragma mark - 创建标签中按钮
- (UIButton *)makeTagBtnWithTitle:(NSString *)title{

    UIButton *btn = [[UIButton alloc]init];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    
    //添加到标签栏中
    [_tagView addSubview:btn];
    
    return btn;
}

#pragma mark - 创建滚动视图
- (void)settingShopScrollView{
    
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:scrollView];
    
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.bounces = NO;
    scrollView.pagingEnabled = YES;
    
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.offset(0);
        make.top.equalTo(_tagView.mas_bottom).offset(0);
    }];
    
    WJShopCommentController *commentVc = [[WJShopCommentController alloc]init];
    WJShopInfoController *infoVc = [[WJShopInfoController alloc] init];
    WJShopOrderController *orderVc = [[WJShopOrderController alloc] init];
    NSArray *vcs = @[commentVc,infoVc,orderVc];
    
    for (UIViewController *vc in vcs) {
        //把控制器的视图添加到scrollView上
        [scrollView addSubview:vc.view];
        
        //添加子控件
        [self addChildViewController:vc];
    
        //告诉父控件已添加
        [vc didMoveToParentViewController:self];
        
    }
    
    [scrollView.subviews mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
        make.width.height.equalTo(scrollView).offset(0);
    }];
    
    [scrollView.subviews mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
    
}


#pragma mark - 创建默认视图
- (void)settingNormal{
    
    //导航条标题
    self.item.title = @"香河肉饼";
    //导航条标题颜色
    self.bar.titleTextAttributes = @{NSForegroundColorAttributeName :[UIColor colorWithWhite:0.4 alpha:0]};
    //导航条背景图完全透明
    self.bar.bgImageView.alpha = 0;
    
    //分享按钮
    UIBarButtonItem *rightShareBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"btn_share"] style:UIBarButtonItemStylePlain target:nil action:nil];
    self.item.rightBarButtonItem = rightShareBtn;
    self.bar.tintColor = [UIColor whiteColor];

}

#pragma mark - 创建头部视图
- (void)settingHeaderView{

    //头部视图
    UIView *headerView = [[UIView alloc]init];
    headerView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:headerView];
    
    [headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.offset(0);
        make.height.offset(180);
    }];
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panGesture:)];
    [self.view addGestureRecognizer:pan];
    
    _headerView = headerView;
}

#pragma mark - 平移手势
- (void)panGesture:(UIPanGestureRecognizer *)pan {
    //获取平移的距离
    CGPoint p = [pan translationInView:pan.view];
    
    CGFloat headerViewH = _headerView.bounds.size.height;
    
    [_headerView mas_updateConstraints:^(MASConstraintMaker *make) {
        
        if (p.y + headerViewH < KShopHeaderViewMinHeight) {
            
            make.height.offset(KShopHeaderViewMinHeight);
            
        }else if (p.y + headerViewH >KShopHeaderViewMaxHeight){
        
            make.height.offset(KShopHeaderViewMaxHeight);
        }else{
            
            make.height.offset(p.y + _headerView.bounds.size.height);
        
        }
        
    }];
    
    //180 0   64 1
//    CGFloat alpha = [self alphaWithConsult:headerViewH andConsult1:180 andResult1:0 andConsult2:64 andResult2:1];
    
//    CGFloat alpha = [self alphaWithConsult:headerViewH andValue1:WJValueMake(180, 0) andValue2:WJValueMake(64, 1)];

    //导航条透明效果
    CGFloat alpha = [@(headerViewH) alphaWithValue1:WJValueMake(180, 0) andValue2:WJValueMake(64, 1)];
    
    self.bar.bgImageView.alpha = alpha;
    
    //导航条标题颜色
    self.bar.titleTextAttributes = @{NSForegroundColorAttributeName :[UIColor colorWithWhite:0.4 alpha:alpha]};

    CGFloat white = [@(headerViewH) alphaWithValue1:WJValueMake(180, 1) andValue2:WJValueMake(64, 0.4)];
    
    //分享按钮颜色
    self.bar.tintColor = [UIColor colorWithWhite:white alpha:1];
    
    //状态栏
    if (headerViewH == KShopHeaderViewMaxHeight && self.statusBarStyle != UIStatusBarStyleLightContent) {
        self.statusBarStyle = UIStatusBarStyleLightContent;
    }else if(headerViewH == KShopHeaderViewMinHeight && self.statusBarStyle != UIStatusBarStyleDefault){
        self.statusBarStyle = UIStatusBarStyleDefault;
    }
    
    //恢复到初始值
    [pan setTranslation:CGPointZero inView:pan.view];

}

//- (CGFloat)alphaWithConsult:(CGFloat)headerViewH andConsult1:(CGFloat)consult1 andResult1:(CGFloat)result1 andConsult2:(CGFloat)consult2 andResult2:(CGFloat)result2{
//
//    //result1 = a*consult1 + b
//    //result2 = a*consult2 + b
//    CGFloat a = (result1 - result2) / (consult1 - consult2);
//    CGFloat b = result1 - a * consult1;
//    
//    return a * headerViewH + b;
//}

//跳转到食品界面
//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    
//    WJFoodDetailController *foodVc = [[WJFoodDetailController alloc] init];
//    
//    [self.navigationController pushViewController:foodVc animated:YES];
//    
//}



@end
