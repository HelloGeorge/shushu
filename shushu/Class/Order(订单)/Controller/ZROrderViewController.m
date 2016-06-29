//
//  ZROrderViewController.m
//  shushu
//
//  Created by Apple on 16/6/29.
//  Copyright © 2016年 zhangrui. All rights reserved.
//

#import "ZROrderViewController.h"
#import "ZROrderViewCell.h"

@interface ZROrderViewController ()

@end

@implementation ZROrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"确认订单";
    [self.navigationController.view.subviews lastObject].hidden = YES;
    self.tableView.separatorStyle = NO;
}


#pragma mark - Table view data source

//返回2组cell
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

//返回每一组的行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    if (section == 0) {
//        return 1;
//    }else if(section == 1){
//        return 4;
//    }
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        ZROrderViewCell *cell = [ZROrderViewCell addressViewCell];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else{
        ZROrderViewCell *cell = [ZROrderViewCell orderViewCell];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 80;
    }else{
        return 200;
    }
}



@end
