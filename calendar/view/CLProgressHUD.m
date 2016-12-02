//
//  CLProgressHUD.m
//  calendar
//
//  Created by wangaiguo on 16/12/1.
//  Copyright © 2016年 wangaiguo. All rights reserved.
//

#import "CLProgressHUD.h"

@implementation CLProgressHUD

+(void)show:(NSString *)text view:(UIView *)view{
    UIView *hudView = nil;
    if(view){
        hudView = view;
    }else{
        hudView = [[UIApplication sharedApplication].windows lastObject];
    }
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:hudView animated:YES];
    hud.labelText = text;
    hud.mode = MBProgressHUDModeCustomView;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:1.5];
}

+ (void)show:(NSString *)text{
    [CLProgressHUD show:text view:nil];
}

@end
