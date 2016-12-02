//
//  CLAdapter.h
//  calendar
//
//  Created by wangaiguo on 16/12/1.
//  Copyright © 2016年 wangaiguo. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CLAdapter : NSObject<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,readonly)NSMutableArray *dataSource;
@property(nonatomic,copy)void (^didSelectedRow)(UITableView*tableView, NSIndexPath*indexPath);
@property (nonatomic,weak)UITableView *view;
@property (nonatomic,copy)void (^didScroll)(UITableView *tableV);
- (void)goTop:(BOOL)animated;

@end
