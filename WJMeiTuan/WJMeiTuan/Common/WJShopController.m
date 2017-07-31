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

// 头部视图的最大和最小高度
#define KShopHeaderViewMaxHeight   180
#define KShopHeaderViewMinHeight   64

@interface WJShopController ()
//headerView
@property(nonatomic,weak)UIView *headerView;

@end

@implementation WJShopController

- (void)viewDidLoad {
    
    //添加头部视图
    [self setupUI];

    [super viewDidLoad];

    self.view.backgroundColor = [UIColor blueColor];
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

- (void)setupUI{

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

//平移手势
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
