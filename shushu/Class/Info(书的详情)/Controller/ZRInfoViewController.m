//
//  ZRInfoViewController.m
//  shushu
//
//  Created by Apple on 16/6/29.
//  Copyright © 2016年 zhangrui. All rights reserved.
//

#import "ZRInfoViewController.h"
#import "ZRBuyBookViewCell.h"
#import "ZRBookIntroViewCell.h"
#import "ZRJudgeViewCell.h"
#import "ZRBookInfo.h"
#import "ZRBookTip.h"
#import "AFNetworking.h"
#import "ZRBookAllInfo.h"
#import "MJExtension.h"
#import "ZRLoginView.h"
#import "ZRShowView.h"

@interface ZRInfoViewController ()<ZRBuyBookViewCellDelegate>

@property (nonatomic,strong) ZRBookAllInfo *data1;
@property (nonatomic,strong) ZRBookTip *data2;

@end

@implementation ZRInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"书籍详情";
    
    //加载书籍的详细信息
    [self loadBookAllInfo];
    
    
    
}

//加载书籍的详细信息
- (void)loadBookAllInfo{
    
    //1.请求管理者
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    
    //2.拼接参数
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    param[@"productId"] = [NSString stringWithFormat:@"%d",self.model.productId];
    param[@"site"] = @"东油";
    
    //3.发送post请求
    [mgr POST:@"http://www.91shushu.com/app/product/productDetails" parameters:param success:^(AFHTTPRequestOperation *operation, NSDictionary *responseObject) {
        //请求成功来到这里
        ZRBookAllInfo *info1 = [ZRBookAllInfo initWithDic:responseObject[@"result"]];
        ZRBookTip *info2 = [ZRBookTip initWithDic:responseObject[@"tip"]];
        self.data1 = info1;
        self.data2 = info2;
        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //请求失败来到这里
        NSLog(@"请求失败");
    }];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        ZRBuyBookViewCell *cell = [ZRBuyBookViewCell buyBookCell];
        cell.model1 = self.data1;
        cell.model2 = self.data2;
        cell.bookId = self.model.productId;
        cell.delegate = self;
        return cell;
    }else if(indexPath.section == 1){
        ZRBookIntroViewCell *cell = [ZRBookIntroViewCell bookIntroCell];
        cell.model = self.data1;
        return cell;
    }else{
        ZRJudgeViewCell *cell = [ZRJudgeViewCell judgeViewCell];
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 700;
    }else if(indexPath.section == 1){
        return 600;
    }else{
        return 140;
    }
}

#pragma mark - ZRBuyBookViewCellDelegate的代理方法
- (void)plusBuyBtnClick:(ZRBuyBookViewCell *)cell{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:@"请登录后再加入购物车" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //点击ok按钮后执行的方法
        ZRLoginView *view = [[ZRLoginView alloc] init];
        [self presentViewController:view animated:YES completion:nil];
    }];
    
    [alertController addAction:cancelAction];
    [alertController addAction:okAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

//提示
- (void)showView{
    ZRShowView *view = [ZRShowView showViewWithText:@"成功加入购物车"];
    [[UIApplication sharedApplication].keyWindow addSubview:view];
    view.alpha = 0;
    [UIView animateWithDuration:1.0 animations:^{
        view.alpha = 1.0;
    } completion:^(BOOL finished) {
        if (finished) {
            [UIView animateWithDuration:1.0 delay:1.0 options:UIViewAnimationOptionCurveLinear animations:^{
                view.alpha = 0;
            } completion:^(BOOL finished) {
                [view removeFromSuperview];
            }];
        }
    }];
}








@end
