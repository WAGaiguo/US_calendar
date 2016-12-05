//
//  CLHomeSliderView.h
//  calendar
//
//  Created by wangaiguo on 16/12/5.
//  Copyright © 2016年 wangaiguo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CLHomeSliderView : UIView

@property (nonatomic,strong) NSArray *dataSource;
@property (nonatomic,assign) BOOL closed;
@property (nonatomic,copy)void (^selectRowBlock)(NSInteger);

@end

@interface CLHomeSliderCell : UITableViewCell

@property (nonatomic,strong)UILabel *label;
@property (nonatomic,strong)UIView *bottomLine;
@property (nonatomic,strong)UILabel *rightTips;

@end
