//
//  WJBaseViewController.h
//  WJMeiTuan
//
//  Created by 秋贺然 on 2017/7/31.
//  Copyright © 2017年 秋贺然. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WJNavigationBar;

@interface WJBaseViewController : UIViewController
// 导航条
@property (nonatomic, strong, readonly) WJNavigationBar *bar;
// item
@property (nonatomic, strong, readonly) UINavigationItem *item;
// 状态栏样式
@property (nonatomic, assign) UIStatusBarStyle statusBarStyle;
@end
