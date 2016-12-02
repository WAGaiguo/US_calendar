//
//  UIView+Instance.m
//  calendar
//
//  Created by wangaiguo on 16/12/1.
//  Copyright © 2016年 wangaiguo. All rights reserved.
//

#import "UIView+Instance.h"

@implementation UIView (Instance)
+(instancetype)instance:(CGRect)frame{
    return [[[self class]alloc]initWithFrame:frame];
}
@end
