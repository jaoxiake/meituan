//
//  WJInfoLoopView.m
//  WJMeiTuan
//
//  Created by 秋贺然 on 2017/8/3.
//  Copyright © 2017年 秋贺然. All rights reserved.
//

#import "WJInfoLoopView.h"
#import "WJInfoView.h"
#import "WJInfoModel.h"

@interface WJInfoLoopView ()

//第一个view
@property (nonatomic,weak)WJInfoView *infoView1;
//第二个view
@property (nonatomic,weak)WJInfoView *infoView2;
//显示第几条信息
@property (nonatomic,assign)NSInteger currentIndex;

@end

@implementation WJInfoLoopView


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

    WJInfoView *infoView1 = [[WJInfoView alloc] init];
    [self addSubview:infoView1];
    
    [infoView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.offset(0);
        make.right.offset(-16);
    }];
    
    WJInfoView *infoView2 = [[WJInfoView alloc] init];
    [self addSubview:infoView2];
    
    [infoView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(infoView1).offset(0);
        make.height.width.equalTo(infoView1).offset(0);
        make.top.equalTo(infoView1.mas_bottom).offset(0);
    }];
    _infoView1 = infoView1;
    _infoView2 = infoView2;
    
}

-(void)setDiscounts:(NSArray<WJInfoModel *> *)discounts{
    _discounts = discounts;
    
    //设置数据
    [self settingData];
    
    //滚动
    [self scroll];
}

//设置数据
- (void)settingData{
    
    if (_currentIndex + 1 == _discounts.count) {
        _infoView1.infoModel = _discounts[_currentIndex];
        _infoView2.infoModel = _discounts[0];
        _currentIndex = -1;
    }else{
    _infoView1.infoModel = _discounts[_currentIndex];
    _infoView2.infoModel = _discounts[(_currentIndex + 1) % 7];
    }
}

//滚动
- (void)scroll{
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [UIView animateWithDuration:0.5 animations:^{
            
            _infoView1.transform = CGAffineTransformMakeTranslation(0, - self.bounds.size.height);
            _infoView2.transform = CGAffineTransformMakeTranslation(0, - self.bounds.size.height);
            
        } completion:^(BOOL finished) {
            _currentIndex++;
            
            [self settingData];
            
            _infoView1.transform = CGAffineTransformIdentity;
            _infoView2.transform = CGAffineTransformIdentity;
            
            [self scroll];
        }];
    });
}


@end
