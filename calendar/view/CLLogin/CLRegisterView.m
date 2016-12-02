//
//  CLRegisterView.m
//  calendar
//
//  Created by wangaiguo on 16/12/1.
//  Copyright © 2016年 wangaiguo. All rights reserved.
//

#import "CLRegisterView.h"

@implementation CLRegisterView

-(instancetype)init{
    self = [super init];
    if (self) {
        [self afterView];
    }
    return self;
}
- (void)afterView{
    [self setHeight:240];
    [self setWidth:SCREEN_WIDTH];
    [self addSubview:[self imageUrl:@"icon_Name" tag:0 placeHolder:@"Name"]];
    [self addSubview:[self imageUrl:@"icon_Email" tag:1 placeHolder:@"Email"]];
    [self addSubview:[self imageUrl:@"icon_Password" tag:2 placeHolder:@"Password"]];
    [self addSubview:[self imageUrl:@"icon_Birthday" tag:3 placeHolder:@"Birthday"]];
}

- (UIView *)imageUrl:(NSString *)url tag:(NSInteger)tag placeHolder:(NSString *)placeHolder{
    UIView *view = [UIView instance];
    [view setHeight:60];
    [view setWidth:SCREEN_WIDTH];
    
    UIImageView * _userPic = [[UIImageView alloc]initWithFrame:CGRectMake(27, 25, 20, 20)];
    _userPic.image = [UIImage imageNamed:url];
    [view addSubview:_userPic];
    UITextField * _userField = [UITextField instance];
    [view addSubview:_userField];
    _userField.tag = tag + 200;
    _userField.sd_layout
    .leftSpaceToView(_userPic,20)
    .rightSpaceToView(view,27)
    .heightIs(50)
    .topSpaceToView(view,10);
    _userField.placeholder = placeHolder;
    _userField.font = [UIFont systemFontOfSize:14];
    _userField.textColor = UICommonColor;
    
    UIView * _topLine = [[UIView alloc]initWithFrame:CGRectMake(0, 59, SCREEN_WIDTH, 1.0)];
    _topLine.backgroundColor = UICommonColor;
    [view addSubview:_topLine];
    [view setTop:tag * 60];
    
    return view;
    
}

@end
