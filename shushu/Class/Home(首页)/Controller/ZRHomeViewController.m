//
//  ZRHomeViewController.m
//  shushu
//
//  Created by Apple on 16/6/24.
//  Copyright © 2016年 zhangrui. All rights reserved.
//

#import "ZRHomeViewController.h"
#import "UIView+ZRExtension.h"
#import "ZRSearchBar.h"
#import "ZRTableViewCell.h"
#define ZRBanCount 3

@interface ZRHomeViewController ()<UIScrollViewDelegate>
@property (nonatomic,weak) UIPageControl *pageControl;
@property (nonatomic,strong) NSTimer *timer;
@property (nonatomic,weak) UIScrollView *scrollView;


@end

@implementation ZRHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //使用系统自带的searchBar有很多不方便的地方
//    UISearchBar *searchBar = [[UISearchBar alloc] init];
//    searchBar.scopeBarBackgroundImage = [UIImage imageNamed:@"searchbar_textfield_background"];
//    self.navigationItem.titleView = searchBar;
    ZRSearchBar *searchBar = [ZRSearchBar searchBar];
    searchBar.width = 260;
    searchBar.height = 30;
    self.navigationItem.titleView = searchBar;
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"书书网" style:UIBarButtonItemStyleDone target:nil action:nil];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"东油" style:UIBarButtonItemStyleDone target:self action:@selector(choose)];
    
    //创建一个图片轮播器
    //1.创建一个scrollView
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.size = CGSizeMake(self.view.width, 160);
    scrollView.backgroundColor = [UIColor redColor];
    
    //2.创建imageview
    //抽取出来scrollView的高度和宽度，不需要调用很多次获取scrollviewsize属性的get方法
    CGFloat scrollW = scrollView.width;
    CGFloat scrollH = scrollView.height;
    for (int i = 0; i < ZRBanCount; i++) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.width = scrollW;
        imageView.height = scrollH;
        imageView.y = 0;
        imageView.x = i * scrollW;
        ++i;
        NSString *name = [NSString stringWithFormat:@"ban%d",i];
        --i;
        imageView.image = [UIImage imageNamed:name];
        [scrollView addSubview:imageView];
    }
    
    //设置scrollView的其他属性
    //设置scrollView的滚动范围
    scrollView.contentSize = CGSizeMake(ZRBanCount * scrollW, 0);
    //去掉scrollview的弹簧效果
    scrollView.bounces = NO;
    //去掉scrollview的水平指示器
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.pagingEnabled = YES;
    
    //添加一个UIPageControll
    UIPageControl *pageControl = [[UIPageControl alloc] init];
    pageControl.numberOfPages = ZRBanCount;
    //不设置宽高，那么UIPageControll就不会有点击事件
//    pageControl.height = 50;
//    pageControl.width = 100;
    pageControl.centerX = self.view.width * 0.5;
    pageControl.y = scrollH - 15;
    pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    pageControl.pageIndicatorTintColor = [UIColor colorWithRed:183/255.0 green:183/255.0 blue:183/255.0 alpha:1.0];
    self.pageControl = pageControl;
    scrollView.delegate = self;
    
    self.tableView.tableHeaderView = scrollView;
    [self.view addSubview:pageControl];
    self.scrollView = scrollView;
    //创建一个NSTimer控件
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(scrollTimer) userInfo:nil repeats:YES];
    //改变NSTimer的优先级，让它的优先级和控件一样
    //创建一个消息循环对象，获得当前的循环消息
    NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
    [runLoop addTimer:self.timer forMode:NSRunLoopCommonModes];
    
    //去掉tableView之间的分组线
    self.tableView.separatorStyle = NO;
}

- (void)choose{
    NSLog(@"选择地点");
}

//每隔2.0秒执行一次这个发布方法
- (void)scrollTimer{
    //1.获取当前图片的页码，并判断是否是最后一页，如果是最后一页，跳转到第一页
    int page = self.pageControl.currentPage;
    if (page == ZRBanCount - 1) {
        [self.scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
    }else{
        //2.当前页码+1
        page = page + 1;
        //3.+1之后的页码再乘以scrollview的宽度
        CGFloat offsetW = page * self.scrollView.width;
        //4.设置scrollview的contentOffset属性
        [self.scrollView setContentOffset:CGPointMake(offsetW, 0) animated:YES];
    }
}

#pragma mark - UIScrollViewDelegate的代理方法
//正在拖拽scrollview时会执行的方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat a = scrollView.contentOffset.x + scrollView.width * 0.5;
    NSInteger page = (NSInteger) 1.0 * a / scrollView.width;
    self.pageControl.currentPage =  page;
}

//实现图片即将拖拽的方法
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    //停止计时器，这时计时器就相当于一个指向废了的对象，想要重新计时就需要重新创建一个计时器对象
    [self.timer invalidate];
}

//实现图片拖拽之后的方法
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    //重新创建一个计时器对象
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(scrollTimer) userInfo:nil repeats:YES];
}
#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 12;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZRTableViewCell *cell = [[ZRTableViewCell alloc] init];
    if (indexPath.row == 0) {
        cell = [ZRTableViewCell functionButton];
    }else if(indexPath.row == 1){
        cell = [ZRTableViewCell newOut];
    }else{
        
    }
    return cell;
    
}

//设置每一行cell的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 140;
    }else if(indexPath.row == 1){
        return 60;
    }else{
        return 100;
    }
}



@end
