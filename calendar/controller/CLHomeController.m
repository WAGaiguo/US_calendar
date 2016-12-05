//
//  CLHomeController.m
//  calendar
//
//  Created by wangaiguo on 16/12/5.
//  Copyright © 2016年 wangaiguo. All rights reserved.
//

#import "CLHomeController.h"
#import "CLHomeHeaderView.h"
#import "CLHomeSliderView.h"

@interface CLHomeController (){
    CLHomeSliderView *_sliderView;
}

@end

@implementation CLHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UICyanColor;
    [self setLeftImage:@"icon_Menu"];
    [self setRightImage:@"icon_Search"];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
    CLHomeHeaderView *view = [[CLHomeHeaderView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH/2.0, 350)];
    view.backgroundColor = UIGreenColor;
    [self.view insertSubview:view belowSubview:self.contentView];
    
    _sliderView = [[CLHomeSliderView alloc]initWithFrame:SCREEN_BOUNDS];
    [self.view addSubview:_sliderView];
    


}



- (void)tapLeft:(UIButton *)btn {
    [_sliderView setClosed: ! _sliderView.closed];
}

- (void)tapRight:(UIButton *)btn{
    [self.navigationController popToRootViewControllerAnimated:YES];
    [CLProgressHUD show:@"tapRight"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


@end
