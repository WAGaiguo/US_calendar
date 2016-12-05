//
//  CLHomeHeaderView.m
//  calendar
//
//  Created by wangaiguo on 16/12/5.
//  Copyright © 2016年 wangaiguo. All rights reserved.
//

#import "CLHomeHeaderView.h"

@implementation CLHomeHeaderView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self p_makeHead];
    }
    return self;
}
- (void)p_makeHead{
    UIImageView *backV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 350)];
    backV.image = [UIImage imageNamed:@"HeaderBackground"];
    [self addSubview:backV];
    
    UILabel *label = [UILabel instance];
    [backV addSubview:label];
    label.textColor = UIWhiteColor;
    label.sd_layout
    .widthIs(SCREEN_WIDTH)
    .heightIs(40)
    .topSpaceToView(backV,80);
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:35];
    label.text =  @"Good Morning";
    
    UIImageView *headPic = [UIImageView instance];
    [backV addSubview:headPic];
    headPic.sd_layout
    .widthIs(100)
    .heightIs(100)
    .centerXIs(SCREEN_WIDTH/2.0)
    .topSpaceToView(backV,150);
    headPic.image = [UIImage imageNamed:@"Avatar"];
    
    UILabel *tipLabel = [UILabel instance];
    [headPic addSubview:tipLabel];
    tipLabel.sd_layout
    .widthIs(30)
    .heightIs(30)
    .topSpaceToView(headPic,0)
    .rightSpaceToView(headPic,0);
    tipLabel.sd_cornerRadius = @15;
    tipLabel.backgroundColor = [UIColor colorWithHex:@"50d2c2"];
    tipLabel.textColor = UIWhiteColor;
    tipLabel.textAlignment = NSTextAlignmentCenter;
    tipLabel.text = @"3";
}

@end
