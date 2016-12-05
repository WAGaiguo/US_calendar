//
//  CLLoginController.m
//  calendar
//
//  Created by wangaiguo on 16/12/1.
//  Copyright © 2016年 wangaiguo. All rights reserved.
//

#import "CLLoginController.h"
#import "CLLoginView.h"
#import "CLLoginView1.h"

#import "CLRegisterController.h"
#import "NSString+PDRegex.h"
#import "CLSplashController.h"

@interface CLLoginController ()

@property (nonatomic,strong) CLLoginView *loginView;
@property (nonatomic,strong) CLLoginView1 *loginView1;

@end

@implementation CLLoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UICyanColor;
    [self p_makeBackground];
    [self p_loginLogo];

    [self forgot_password];
    [self p_signInUp];
    
    
}


-(void)p_makeBackground{
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    imageView.image = [UIImage imageNamed:@"HeaderBackground"];
    imageView.contentMode = UIViewContentModeScaleToFill;
    [self.view addSubview:imageView];
    imageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(resign)];
    [imageView addGestureRecognizer:tap];
}

-(void)p_loginLogo{
    UIView *logoBack = [UIView instance];
    [self.view addSubview:logoBack];
    logoBack.sd_layout
    .widthIs(150)
    .heightIs(150)
    .topSpaceToView(self.view,90)
    .centerXIs(SCREEN_WIDTH/2.0);
    logoBack.layer.cornerRadius = logoBack.width/2.0;
    logoBack.backgroundColor = UIWhiteColor;
    
    UIImageView *logo = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Logo"]];
    [logoBack addSubview:logo];
    logo.sd_layout
    .widthIs(150)
    .heightIs(150)
    .centerXIs(logoBack.width/2.0)
    .centerYIs(logoBack.width/2.0);
    
    logo.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(resign)];
    [logo addGestureRecognizer:tap];
}

- (void)forgot_password{
    _loginView = [CLLoginView instance:CGRectMake(0,DIMENSION(250), SCREEN_WIDTH, 120)];
    [self.view addSubview:_loginView];
    WEAK_SELF
    [_loginView setBeginBlock:^(UITextField *field) {
        if (SCREEN_WIDTH < 321) {
            [UIView animateWithDuration:0.3 animations:^{
                 [me.view setCenterY:SCREEN_HEIGHT/2.0 - 100];
            }];
            [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
           
        }
    }];
    [_loginView setReturnBlock:^(UITextField *field) {
        if (SCREEN_WIDTH < 321) {
            [UIView animateWithDuration:0.3 animations:^{
                [me.view setCenterY:SCREEN_HEIGHT/2.0];
            }];
            [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
            
        }
    }];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:btn];
 
    [btn setWidth:120];
    [btn setHeight:20];
    [btn setTop:_loginView.bottom + 10];
    [btn setRight:SCREEN_WIDTH - 20];
    [btn setTitle:@"Forgot Password" forState:UIControlStateNormal];
    [btn setTintColor:UICommonColor];
    btn.titleLabel.textColor = UICommonColor;
    btn.titleLabel.font = [UIFont systemFontOfSize:13];
    
    NSLog(@"%f",_loginView.bottom);
    
}

- (void)p_signInUp{
    _loginView1 = [CLLoginView1 instance];
    [_loginView1 setBottom:SCREEN_HEIGHT];
    [self.view addSubview:_loginView1];

    WEAK_SELF
    [_loginView1 setSignInBlock:^{
        [me p_lginIn];
    }];
    
    __weak typeof (self) mee = self;
 
    [_loginView1 setSignUpBlock:^{
        [mee presentViewController:[CLRegisterController instance] animated:YES completion:nil];
    }];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    [self resign];
//    [MAIN_WINDOW resignFirstResponder];
}

-(void)resign{
    if ([_loginView.userField isFirstResponder] || [_loginView.passField isFirstResponder]) {
        if (SCREEN_WIDTH < 321) {
            [UIView animateWithDuration:0.3 animations:^{
                [self.view setCenterY:SCREEN_HEIGHT/2.0];
            }];
            [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
            
        }
        [_loginView.userField resignFirstResponder];
        [_loginView.passField resignFirstResponder];
    }
}

- (void)p_lginIn{
    
    [self.navigationController pushViewController:[CLSplashController instance] animated:YES];
    NSString *userName = [self deleteSpace:_loginView.userField.text];
    NSString *passWord = [self deleteSpace:_loginView.passField.text];
    if (userName.length==0) {
        [CLProgressHUD show:@"Please enter your user name"];return;
    }
    if (passWord.length == 0) {
        [CLProgressHUD show:@"Please enter your Password"];return;
    }
    if (![passWord isPassword]) {
        [CLProgressHUD show:@"Please enter the correct password format"];return;
    }
    
}

-(NSString *)deleteSpace:(NSString *)string{
    return [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
