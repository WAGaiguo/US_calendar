//
//  CLHomeSliderView.m
//  calendar
//
//  Created by wangaiguo on 16/12/5.
//  Copyright © 2016年 wangaiguo. All rights reserved.
//

#import "CLHomeSliderView.h"

@interface CLHomeSliderView ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)UIImageView *imageBack;
@property (nonatomic,strong)UIView *leftBack;
@end

@implementation CLHomeSliderView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self afterViews];
        [self makeSliderData];
    }
    return self;
}

-(void)afterViews{
    if (_dataSource.count != 0) {
        
    }else{
        _dataSource = @[@"Home",@"Overview",@"Groups",@"Lists",@"Profile",@"TimeLine",@"Settting",@"Log Out"];
    }
    
}

-(void)makeSliderData{
    self.frame = SCREEN_BOUNDS;
    self.backgroundColor = UIClearColor;
    
    _imageBack = [[UIImageView alloc]initWithFrame:SCREEN_BOUNDS];
    _imageBack.backgroundColor = [UIColor blackColor];
    _imageBack.alpha = 0;
    [self addSubview:_imageBack];
    _imageBack.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(close)];
    [_imageBack addGestureRecognizer:tap];
   
    
    _leftBack = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, SCREEN_HEIGHT)];
    _leftBack.backgroundColor = UIWhiteColor;
    [self addSubview:_leftBack];
    
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 80, 0 , SCREEN_HEIGHT - 80) style:UITableViewStylePlain];
    _tableView.delegate =self;
    _tableView.dataSource = self;
    _tableView.showsVerticalScrollIndicator = NO;
    [_leftBack addSubview:_tableView];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    _closed = YES;
    self.hidden = YES;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [_leftBack addSubview:btn];
    btn.sd_layout
    .widthIs(20)
    .heightIs(20)
    .topSpaceToView(_leftBack,32)
    .leftSpaceToView(_leftBack,15);
    [btn setBackgroundImage:[UIImage imageNamed:@"icon_Check"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(close) forControlEvents:UIControlEventTouchUpInside];
    
    [_tableView reloadData];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataSource.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CLHomeSliderCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[CLHomeSliderCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.label.text = _dataSource[indexPath.row];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 64;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self close];
}

-(void)setClosed:(BOOL)closed{
    _closed = closed;
    if (closed) {
        [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            _imageBack.alpha = 0;
            _leftBack.width = 0;
            _tableView.width = 0;
        } completion:^(BOOL finished) {
            self.hidden = YES;
        }];
    }else{
        self.hidden = NO;
        [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            _imageBack.alpha = 0.5;
            _leftBack.width = _tableView.width = SCREEN_WIDTH - 75;
        } completion:^(BOOL finished) {
            
        }];
    }
    
}

-(void)close{
    [self setClosed:YES];
}

@end




@implementation CLHomeSliderCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self afterView];
    }
    return self;
}
-(void)afterView{
    [self setHeight:64];
    [self setWidth:SCREEN_WIDTH - 75];
    _label = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, 150, 64)];
    _label.font = [UIFont systemFontOfSize:18];
    _label.textColor = [UIColor blackColor];
    [self.contentView addSubview:_label];
    
    _bottomLine = [[UIView alloc]initWithFrame:CGRectMake(0, 64 - ONE_PIXEL, SCREEN_WIDTH - 75, ONE_PIXEL)];
    _bottomLine.backgroundColor = UIGrayColor;
    [self.contentView addSubview:_bottomLine];
}

@end



