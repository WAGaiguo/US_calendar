//
//  NSObject+Instance.m
//  calendar
//
//  Created by wangaiguo on 16/12/1.
//  Copyright © 2016年 wangaiguo. All rights reserved.
//

#import "NSObject+Instance.h"

@implementation NSObject (Instance)
+(instancetype)instance{
    return [[[self class]alloc]init];
}
@end
