//
//  WJInfoView.m
//  WJMeiTuan
//
//  Created by 秋贺然 on 2017/8/3.
//  Copyright © 2017年 秋贺然. All rights reserved.
//

#import "WJInfoView.h"

@implementation WJInfoView

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


}
@end
