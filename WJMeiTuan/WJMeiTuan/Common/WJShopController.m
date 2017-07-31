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
    //导航条颜色
    self.bar.barTintColor = [UIColor redColor];
    //导航条标题
    self.item.title = @"冰雹";
    
    
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
            
        }else if (p.y + headerViewH >= KShopHeaderViewMaxHeight){
        
            make.height.offset(KShopHeaderViewMaxHeight);
        }else{
            
            make.height.offset(p.y + _headerView.bounds.size.height);
        
        }
        
    }];
    
    //180 1   64 0
//    CGFloat alpha = [self alphaWithConsult:headerViewH andConsult1:180 andResult1:1 andConsult2:64 andResult2:0];
    
//    CGFloat alpha = [self alphaWithConsult:headerViewH andValue1:WJValueMake(180, 1) andValue2:WJValueMake(64, 0)];

    CGFloat alpha = [@(headerViewH) alphaWithValue1:WJValueMake(180, 1) andValue2:WJValueMake(64, 0)];
    
    self.bar.bgImageView.alpha = alpha;
    

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


//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    
//    WJFoodDetailController *foodVc = [[WJFoodDetailController alloc] init];
//    
//    [self.navigationController pushViewController:foodVc animated:YES];
//    
//}

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
