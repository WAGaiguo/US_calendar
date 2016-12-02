//
//  CLSplashController.m
//  calendar
//
//  Created by wangaiguo on 16/12/2.
//  Copyright © 2016年 wangaiguo. All rights reserved.
//

#import "CLSplashController.h"

@interface CLSplashController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>{
    UICollectionView * _collectionView;
    NSInteger currentPage;
    UIPageControl *_pageControl;
}

@end

@implementation CLSplashController

- (void)viewDidLoad {
    [super viewDidLoad];
    currentPage = 0;
    
    [self configCollection];
    [self configPageControl];

}

- (void)configCollection{
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT - 60);
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;

    
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 60) collectionViewLayout:layout];
    _collectionView.backgroundColor = UIWhiteColor;
    [self.view addSubview:_collectionView];
    [_collectionView registerClass:[CLSplashCell class] forCellWithReuseIdentifier:@"splash"];
    _collectionView.delegate =self;
    _collectionView.dataSource = self;
    _collectionView.pagingEnabled = YES;
    _collectionView.showsHorizontalScrollIndicator = NO;
    
}

-(void)configPageControl{
    _pageControl = [UIPageControl instance];
    _pageControl.numberOfPages = 3;
    _pageControl.currentPage = 0;
    _pageControl.currentPageIndicatorTintColor = UIPinkRedColor;
    _pageControl.pageIndicatorTintColor = UIGrayColor;
    [self.view addSubview:_pageControl];
    [_pageControl setCenterY:40];
    [_pageControl setCenterX:SCREEN_WIDTH/2.0];
    
    UIButton *next = [UIButton buttonWithType:UIButtonTypeCustom];
    [next setTitle:@"Next" forState:UIControlStateNormal];
    next.backgroundColor = UIPinkRedColor;
    [next setTintColor:UICommonColor];
    [self.view addSubview:next];
    next.sd_layout
    .widthIs(SCREEN_WIDTH)
    .heightIs(60)
    .bottomSpaceToView(self.view, 0);
    [next addTarget:self action:@selector(next) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)next{
    ++currentPage;
    if (currentPage == 3) {
        [self.navigationController popViewControllerAnimated:YES];
    }
    NSIndexPath *path = [NSIndexPath indexPathForItem:currentPage inSection:0];
    [_collectionView scrollToItemAtIndexPath:path atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 3;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CLSplashCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"splash" forIndexPath:indexPath];
    return cell;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    currentPage = (scrollView.contentOffset.x + SCREEN_WIDTH/2.0)/SCREEN_WIDTH;
    _pageControl.currentPage = currentPage;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end


@implementation CLSplashCell

-(instancetype)init{
    self = [super init];
    if ( self) {
        [self afterView];
    }
    return self;
}
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame: frame];
    if (self) {
        [self afterView];
    }
    return self;
}


-(void)afterView{
    [self setHeight:SCREEN_HEIGHT - 60];
    [self setWidth:SCREEN_WIDTH];
    UIImageView *imageV = [UIImageView instance];
    [self.contentView addSubview:imageV];
    imageV.sd_layout
    .widthIs(150)
    .heightIs(150)
    .centerXIs(SCREEN_WIDTH/2.0)
    .centerYIs((SCREEN_HEIGHT-60)/2.0 - 50);
    imageV.image = [UIImage imageNamed:@"Calendar_Icon"];
    
    [self label:@"keep your work organized and"].sd_layout
    .topSpaceToView(imageV,100);
    [self label:@"quickly check your reminders with"].sd_layout
    .topSpaceToView(imageV,120);
    [self label:@"simple calendar."].sd_layout
    .topSpaceToView(imageV,140);
}

-(UILabel *)label:(NSString *)text{
    UILabel *label = [[UILabel alloc]init];
    label.text = text;
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:label];
    label.sd_layout
    .widthIs(SCREEN_WIDTH)
    .heightIs(40);
    return label;
}

@end
