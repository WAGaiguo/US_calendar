//
//  CLBaseViewController.m
//  calendar
//
//  Created by wangaiguo on 16/12/5.
//  Copyright © 2016年 wangaiguo. All rights reserved.
//

#import "CLBaseViewController.h"

static const NSInteger leftMargin = 8;
static const NSInteger rightMargin = 8;

@interface CLBaseViewController ()



@end

@implementation CLBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self p_makeContent];

}

- (void)p_makeContent {
    _contentView = [UIView instance:CGRectMake(0, 0, SCREEN_WIDTH, TOPHEIGHT)];
    _contentView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_contentView];
    [self.view bringSubviewToFront:_contentView];
    
}

- (void)setLeftImage:(NSString *)imageUrl {
    UIButton *leftBtn = [self btnMaker:imageUrl];
    [leftBtn setLeft:leftMargin];
    [leftBtn addTarget:self action:@selector(tapLeft:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)setRightImage:(NSString *)imageUrl {
    UIButton *rightBtn = [self btnMaker:imageUrl];
    [rightBtn setRight:SCREEN_WIDTH - rightMargin];
    [rightBtn addTarget:self action:@selector(tapRight:) forControlEvents:UIControlEventTouchUpInside];
}

- (UIButton *)btnMaker:(NSString *)imageUrl {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_contentView addSubview:btn];
    btn.sd_layout
    .widthIs(20)
    .heightIs(20)
    .topSpaceToView(_contentView,30);
    [btn setImage:[UIImage imageNamed:imageUrl] forState:UIControlStateNormal];
    return btn;
    
}

-(void)tapLeft:(UIButton *)btn{
    
}
-(void)tapRight:(UIButton *)btn{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


@end
