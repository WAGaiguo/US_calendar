//
//  CLProgressHUD.h
//  calendar
//
//  Created by wangaiguo on 16/12/1.
//  Copyright © 2016年 wangaiguo. All rights reserved.
//

#import <MBProgressHUD/MBProgressHUD.h>

@interface CLProgressHUD : MBProgressHUD

+(void)show:(NSString *)text view:(UIView *)view;
+ (void)show:(NSString *)text;

@end
