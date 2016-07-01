//
//  ZRStoreViewController.m
//  shushu
//
//  Created by Apple on 16/7/1.
//  Copyright © 2016年 zhangrui. All rights reserved.
//

#import "ZRStoreViewController.h"
#import "ZRStoreViewCell.h"
#import "ZRUploadViewController.h"

@interface ZRStoreViewController ()<ZRStoreViewCellDelegate>

@end

@implementation ZRStoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"我的店铺";
    self.tableView.separatorStyle = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//cell的组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 2;
}

//每一组的个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 1;
}

//返回每一组的cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZRStoreViewCell *cell;
    if (indexPath.section == 0) {
        cell = [ZRStoreViewCell storeViewCell];
        cell.delegate = self;
        return cell;
    }else{
        cell = [ZRStoreViewCell bookStoreCell];
        return cell;
    }
}

//返回每一组的cell的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 140;
    }else{
        return 60;
    }
}

#pragma mark - ZRStoreViewCell的代理方法

- (void)upLoadBookClick:(ZRStoreViewCell *)cell{
    ZRUploadViewController  *uploadVc = [[ZRUploadViewController alloc] init];
    [self.navigationController pushViewController:uploadVc animated:YES];
}



@end
