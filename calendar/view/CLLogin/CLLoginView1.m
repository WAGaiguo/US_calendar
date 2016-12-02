//
//  CLLoginView1.m
//  calendar
//
//  Created by wangaiguo on 16/12/1.
//  Copyright © 2016年 wangaiguo. All rights reserved.
//

#import "CLLoginView1.h"

@implementation CLLoginView1

-(instancetype)init{
    self = [super init];
    if (self) {
        [self makeBaseView];
    }
    return self;
}

- (void)makeBaseView{
    [self setHeight:116];
    [self setWidth:SCREEN_WIDTH];
    _signIn = [UIButton buttonWithType:UIButtonTypeCustom];
    _signIn.backgroundColor = UIPinkRedColor;
    [self addSubview:_signIn];
    _signIn.sd_layout
    .widthIs(SCREEN_WIDTH)
    .heightIs(58);
    _signIn.titleLabel.textColor = UICommonColor;
    _signIn.titleLabel.font = [UIFont systemFontOfSize:15];
    [_signIn setTitle:@"Sign In" forState:UIControlStateNormal];
    [_signIn addTarget:self action:@selector(tapBtn) forControlEvents:UIControlEventTouchUpInside];
    
    _label = [UILabel instance];
    [self addSubview:_label];
    _label.sd_layout
    .widthIs(SCREEN_WIDTH)
    .heightIs(56)
    .topSpaceToView(_signIn,0);
    _label.textAlignment = NSTextAlignmentCenter;
    _label.text = @"Don't have an account? Sign up";
    _label.textColor = UICommonColor;
    _label.font = [UIFont systemFontOfSize:14];
    
    _label.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapSignIn)];
    [_label addGestureRecognizer:tap];
}

- (void)tapBtn{
    if (self.signInBlock) {
        self.signInBlock();
    }
}

- (void)tapSignIn{
    if (self.signUpBlock) {
        self.signUpBlock();
    }
}
@end
