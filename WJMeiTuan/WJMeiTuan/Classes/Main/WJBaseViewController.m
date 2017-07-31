//
//  WJBaseViewController.m
//  WJMeiTuan
//
//  Created by 秋贺然 on 2017/7/31.
//  Copyright © 2017年 秋贺然. All rights reserved.
//

#import "WJBaseViewController.h"
#import "WJNavigationBar.h"

@interface WJBaseViewController ()

@end

@implementation WJBaseViewController

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{

    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        //导航条
        WJNavigationBar *bar = [[WJNavigationBar alloc] init];
        
        //导航条内容
        UINavigationItem *item = [[UINavigationItem alloc] init];
        [bar setItems:@[item]];
        
        _bar = bar;
        _item = item;

    }
    return self;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:_bar];
    
    //约束
    [_bar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.offset(0);
        make.height.offset(64);
    }];
    
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
