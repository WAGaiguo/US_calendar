//
//  CKLoginView.h
//  calendar
//
//  Created by wangaiguo on 16/12/1.
//  Copyright © 2016年 wangaiguo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CLLoginView : UIView

@property (nonatomic,strong)UITextField *userField;
@property (nonatomic,strong)UITextField *passField;

@property (nonatomic,copy)void (^beginBlock)(UITextField *field);
@property (nonatomic,copy)void (^returnBlock)(UITextField *field);

@end
