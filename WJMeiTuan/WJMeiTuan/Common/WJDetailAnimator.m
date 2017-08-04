//
//  WJDetailAnimator.m
//  WJMeiTuan
//
//  Created by 秋贺然 on 2017/8/4.
//  Copyright © 2017年 秋贺然. All rights reserved.
//

#import "WJDetailAnimator.h"

typedef enum : NSUInteger {
    WJTransitioningTypePresent,
    WJTransitioningTypeDismiss,
} WJTransitioningType;


@interface WJDetailAnimator ()<UIViewControllerAnimatedTransitioning>

//转场类型
@property(nonatomic,assign)WJTransitioningType *transitioningType;


@end

@implementation WJDetailAnimator

//modal时调用
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    
    _transitioningType = WJTransitioningTypePresent;
    
    return self;
}

//dismiss时调用
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    
    _transitioningType = WJTransitioningTypeDismiss;

    return self;


}

//转场动画时间
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext{
    return 0.25;
}

//modal dismiss会调用
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    
// 获取容器视图和跳转到的控制器的视图
    
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    
// 把跳转到的控制器的视图添加到容器视图中
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toView];
    
    if (_transitioningType == WJTransitioningTypePresent) {//modal
        
        toView.transform = CGAffineTransformMakeScale(0, 0);
        
        [UIView animateWithDuration:[self transitionDuration:nil] animations:^{
            toView.transform = CGAffineTransformIdentity;
            
        }completion:^(BOOL finished) {
            
            // 告诉系统完成了转场,不然界面无法交互
            [transitionContext completeTransition:YES];
        }];
    }else{//dismiss
        
        [UIView animateWithDuration:[self transitionDuration:nil] animations:^{
            fromView.transform = CGAffineTransformMakeScale(0.01,0.01);
            
        }completion:^(BOOL finished) {
            
            // 告诉系统完成了转场,不然界面无法交互
            [transitionContext completeTransition:YES];
        }];

    
    
    }
    
    
    
}
@end
