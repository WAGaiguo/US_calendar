//
//  UITableView+adapter.m
//  calendar
//
//  Created by wangaiguo on 16/12/1.
//  Copyright © 2016年 wangaiguo. All rights reserved.
//

#import "UITableView+adapter.h"


@implementation UITableView (adapter)
-(void)setAdapter:(CLAdapter *)adapter{
    self.delegate = adapter;
    self.dataSource = adapter;
    adapter.view = self;
    
}
@end
