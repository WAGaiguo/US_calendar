//
//  CLBaseViewController.h
//  calendar
//
//  Created by wangaiguo on 16/12/5.
//  Copyright © 2016年 wangaiguo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CLBaseViewController : UIViewController

@property (nonatomic,strong)UIView *contentView;

-(void)setLeftImage:(NSString *)imageUrl;
-(void)setRightImage:(NSString *)imageUrl;

@end
