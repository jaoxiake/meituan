//
//  WJNavigationController.m
//  WJMeiTuan
//
//  Created by 秋贺然 on 2017/7/31.
//  Copyright © 2017年 秋贺然. All rights reserved.
//

#import "WJNavigationController.h"
#import "WJBaseViewController.h"
@interface WJNavigationController ()

@end

@implementation WJNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationBar.hidden = YES;
}

- (void)pushViewController:(WJBaseViewController *)viewController animated:(BOOL)animated {
    [super pushViewController:viewController animated:animated];
    
    //只给导航根控制器以外的控制器添加左边返回按钮
    if (self.childViewControllers.count > 1) {
        
        
        //导航条左边按钮
        viewController.item.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"btn_backItem"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
        
    }
}

- (void)back{
    [self popViewControllerAnimated:YES];
}

@end
