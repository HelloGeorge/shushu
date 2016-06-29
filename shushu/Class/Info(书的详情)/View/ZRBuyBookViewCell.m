//
//  ZRBuyBookViewCell.m
//  shushu
//
//  Created by Apple on 16/6/29.
//  Copyright © 2016年 zhangrui. All rights reserved.
//

#import "ZRBuyBookViewCell.h"
#import "UIView+ZRExtension.h"

@interface ZRBuyBookViewCell ()<UIScrollViewDelegate>

@property (nonatomic,weak) UIPageControl *pageControl;

@end

@implementation ZRBuyBookViewCell

- (void)awakeFromNib {
    //在原价上划一横线
    [self linePriceLbl];
    
    //设置scrollview的滚动效果
    [self scrolImg];
    
    //设置pageControl
    [self pageCon];
    
}

//设置pageControl
- (void)pageCon{
    //设置UIPagecontrol
    UIPageControl *pageC = [[UIPageControl alloc] init];
    self.pageControl = pageC;
    pageC.centerX = self.width * 0.5;
    pageC.y = 260;
    //设置pageControl共有3个
    self.pageControl.numberOfPages = 3;
    //设置当前为0
    self.pageControl.currentPage = 0;
    self.pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    self.pageControl.pageIndicatorTintColor = [UIColor whiteColor];
    [self addSubview:self.pageControl];
}

//设置scrollview的滚动效果
- (void)scrolImg{
    //往scrollview中添加图片
    CGFloat imgW = 375;
    CGFloat imgH = 307;
    CGFloat imgY = 0;
    
    for (int i = 0; i < 3; i++) {
        UIImageView *img = [[UIImageView alloc] init];
        NSString *imgStr = [NSString stringWithFormat:@"book_%d",i];
        img.image = [UIImage imageNamed:imgStr];
        img.frame = CGRectMake(i * imgW, imgY, imgW, imgH);
        [self.scrollView addSubview:img];
    }
    //设置scrollview的contentsize属性
    self.scrollView.contentSize = CGSizeMake(imgW * 3, 0);
    //实现拖动的分页效果
    self.scrollView.pagingEnabled = YES;
    //隐藏水平滚动指示器
    self.scrollView.showsHorizontalScrollIndicator = NO;
    
    //设置scrollview的代理
    self.scrollView.delegate = self;
}

//在书的原价上划一条横线
- (void)linePriceLbl{
    NSMutableAttributedString *newPrice = [[NSMutableAttributedString alloc] initWithString:self.priceLbl.text];
    [newPrice addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlinePatternSolid | NSUnderlineStyleSingle) range:NSMakeRange(0, newPrice.length)];
    self.priceLbl.attributedText = newPrice;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

//增加书的数量
- (IBAction)plusCount:(id)sender {
}

//减少书的数量
- (IBAction)minusCount:(id)sender {
}

+ (instancetype)buyBookCell{
    return [[[NSBundle mainBundle] loadNibNamed:@"ZRBuyBookViewCell" owner:nil options:nil] lastObject];
}

#pragma mark - UIScrollView的代理方法

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //获得滚动了的偏移量
    CGFloat imgX = self.scrollView.contentOffset.x;
    imgX = imgX + 0.5 * self.scrollView.width;
    //计算滚动了的页数
    int page = imgX / self.scrollView.width;
    //将获得的页数显示到pageControl上
    self.pageControl.currentPage = page;
}

@end
