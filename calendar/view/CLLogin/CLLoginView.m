//
//  CKLoginView.m
//  calendar
//
//  Created by wangaiguo on 16/12/1.
//  Copyright © 2016年 wangaiguo. All rights reserved.
//

#import "CLLoginView.h"

@interface CLLoginView()
@property (nonatomic,strong)UIImageView *userPic;
@property (nonatomic,strong)UIImageView *passPic;
@property (nonatomic,strong)UIView *topLine;
@property (nonatomic,strong)UIView *bottomLine;

@end

@implementation CLLoginView

-(instancetype)init{
    self = [super init];
    if (self) {
        [self p_init];
    }
    return self;
}

- (void)p_init{
    [self setHeight:120];
    [self setWidth:SCREEN_WIDTH];
    
    _userPic = [[UIImageView alloc]initWithFrame:CGRectMake(27, 25, 20, 20)];
    _userPic.image = [UIImage imageNamed:@"icon_Name"];
    [self addSubview:_userPic];
    _topLine = [[UIView alloc]initWithFrame:CGRectMake(0, 60, SCREEN_WIDTH, 1.5)];
    _topLine.backgroundColor = UICommonColor;
    [self addSubview:_userPic];
    
    _passPic = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_Password"]];
    [self addSubview:_passPic];
    
    
}

@end
