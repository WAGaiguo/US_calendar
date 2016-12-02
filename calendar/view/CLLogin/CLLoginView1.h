//
//  CLLoginView1.h
//  calendar
//
//  Created by wangaiguo on 16/12/1.
//  Copyright © 2016年 wangaiguo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CLLoginView1 : UIView

@property (nonatomic,strong)UIButton *signIn;
//@property (nonatomic,strong)UIButton *signUp;
@property (nonatomic,strong)UILabel *label;

@property (nonatomic,copy)void(^signInBlock)();
@property (nonatomic,copy)void(^signUpBlock)();

@end
