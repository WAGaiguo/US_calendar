//
//  CLRegisterController.m
//  calendar
//
//  Created by wangaiguo on 16/12/1.
//  Copyright © 2016年 wangaiguo. All rights reserved.
//

#import "CLRegisterController.h"
#import "CLRegisterView.h"
#import "CLLoginView1.h"

@interface CLRegisterController ()

@property (nonatomic,strong) CLRegisterView *registerView;
@property (nonatomic,strong) CLLoginView1 *loginView;

@end

@implementation CLRegisterController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UICyanColor;
    [self makeBack];
    _registerView = [CLRegisterView instance];
    [_registerView setTop:150];
    [self.view addSubview:_registerView];
    [self makeLoginView];
}

- (void)makeBack{
    UIImageView *backImageView = [[UIImageView alloc]initWithFrame:SCREEN_BOUNDS];
    [self.view addSubview:backImageView];
    backImageView.image = [UIImage imageNamed:@"HeaderBackground2"];
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setImage:[UIImage imageNamed:@"icon_Back"] forState:UIControlStateNormal];
    [self.view addSubview:backBtn];
    backBtn.sd_layout
    .leftSpaceToView(self.view,10)
    .topSpaceToView(self.view,30)
    .widthIs(25)
    .heightIs(25);
    [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *signUp = [[UILabel alloc]initWithFrame:CGRectMake(27, 70, 200, 50)];
    signUp.text = @"Sign Up";
    signUp.textColor = UICommonColor;
    signUp.font = [UIFont systemFontOfSize:35];
    [self.view addSubview:signUp];
}

- (void)makeLoginView{
    _loginView = [CLLoginView1 instance];
    _loginView.label.text = @"Already have an account? Sign In";
    [_loginView.signIn setTitle:@"Join" forState:UIControlStateNormal];
    WEAK_SELF
    [_loginView setSignUpBlock:^{
        [me dismissViewControllerAnimated:YES completion:nil];
    }];
    [self.view addSubview:_loginView];
    [_loginView setBottom:SCREEN_HEIGHT];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    [[[[UIApplication sharedApplication] delegate] window] resignFirstResponder];
}

- (void)back{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
