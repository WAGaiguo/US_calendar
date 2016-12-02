//
//  CKLoginView.m
//  calendar
//
//  Created by wangaiguo on 16/12/1.
//  Copyright © 2016年 wangaiguo. All rights reserved.
//

#import "CLLoginView.h"

@interface CLLoginView()<UITextFieldDelegate>
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
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self p_init];
    }
    return self;
}

- (void)p_init{
    [self setHeight:121];
    [self setWidth:SCREEN_WIDTH];
    
    _userPic = [[UIImageView alloc]initWithFrame:CGRectMake(27, 25, 20, 20)];
    _userPic.image = [UIImage imageNamed:@"icon_Name"];
    [self addSubview:_userPic];
    _userField = [UITextField instance];
    [self addSubview:_userField];
    _userField.sd_layout
    .leftSpaceToView(_userPic,20)
    .rightSpaceToView(self,27)
    .heightIs(50)
    .topSpaceToView(self,10);
    _userField.placeholder = @"Username";
    _userField.font = [UIFont systemFontOfSize:14];
    _userField.textColor = UICommonColor;
    _userField.delegate = self;
    _userField.returnKeyType = UIReturnKeyDone;
    
    _topLine = [[UIView alloc]initWithFrame:CGRectMake(0, 60, SCREEN_WIDTH, 1.0)];
    _topLine.backgroundColor = UICommonColor;
    [self addSubview:_topLine];
    
    _passPic = [[UIImageView alloc]initWithFrame:CGRectMake(27, 25 + 60, 20, 20)];
    _passPic.image = [UIImage imageNamed:@"icon_Password"];
    [self addSubview:_passPic];
    _passField = [UITextField instance];
    [self addSubview:_passField];
    _passField.sd_layout
    .leftSpaceToView(_userPic,20)
    .rightSpaceToView(self,27)
    .heightIs(50)
    .topSpaceToView(self,70);
    _passField.placeholder = @"Password";
    _passField.font = [UIFont systemFontOfSize:14];
    _passField.textColor = UICommonColor;
    _passField.delegate = self;
    _passField.returnKeyType = UIReturnKeyDone;
    
    _bottomLine = [[UIView alloc]initWithFrame:CGRectMake(0, 120, SCREEN_WIDTH, 1)];
    _bottomLine.backgroundColor = UICommonColor;
    [self addSubview:_bottomLine];
    
    
    
    
}

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    if (self.beginBlock) {
        self.beginBlock(textField);
    }
    
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (self.returnBlock) {
        self.returnBlock(textField);
    }
    return [textField resignFirstResponder];
}



@end
