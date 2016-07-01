//
//  ZRProfileViewController.m
//  shushu
//
//  Created by Apple on 16/6/24.
//  Copyright © 2016年 zhangrui. All rights reserved.
//

#import "ZRProfileViewController.h"
#import "ZRPersonalTableViewCell.h"
#import "ZRGroupHeaderView.h"
#import "ZRStoreViewController.h"

@interface ZRProfileViewController ()<ZRPersonalTableViewCellDelegate>

@end

@implementation ZRProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"个人中心";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"退出" style:UIBarButtonItemStyleDone target:self action:@selector(back)];
    
}

- (void)back{
    NSLog(@"退出登录");
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section == 0) {
        return 1;
    }else if(section == 1){
        return 1;
    }else if(section == 2){
        return 8;
    }else{
        return 1;
    }
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZRPersonalTableViewCell *cell = [[ZRPersonalTableViewCell alloc] init];
    if (indexPath.section == 0) {
        //加载xib
        cell = [ZRPersonalTableViewCell personalInfo];
        cell.delegate = self;
        //加载plist文件
        
        //1.获取plist文件的路径，放入path的变量中
        NSString *path = [[NSBundle mainBundle] pathForResource:@"person.plist" ofType:nil];
        cell.person = [NSArray arrayWithContentsOfFile:path];
    }else if (indexPath.section == 1){
        cell.textLabel.text = @"我的订单";
    }else if(indexPath.section == 2){
        if(indexPath.row == 0){
            cell.textLabel.text = @"用户信息";
        }else if(indexPath.row == 1){
            cell.textLabel.text = @"我的书单";
        }else if(indexPath.row == 2){
            cell.textLabel.text = @"我的收藏";
        }else if(indexPath.row == 3){
            cell.textLabel.text = @"我的评价";
        }else if(indexPath.row == 4){
            cell.textLabel.text = @"与我相关";
        }else if(indexPath.row == 5){
            cell.textLabel.text = @"我的好友";
        }else if(indexPath.row == 6){
            cell.textLabel.text = @"我的书币交易";
        }else if(indexPath.row == 7){
            cell.textLabel.text = @"意见反馈";
        }
    }else{
        cell.textLabel.text = @"修改密码";
    }
    return cell;
}

//实现UITableView的设置分组标题的方法
//下面这个方法只能显示每一组的组标题
//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
//    if (section == 1) {
//        return @"我的订单";
//    }else if(section == 2){
//        return @"会员中心";
//    }else if(section == 3){
//        return @"安全中心";
//    }else{
//        return nil;
//    }
//}

//可以自定义设置每一组的headerView
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    ZRGroupHeaderView *view;
    if (section == 1) {
        view = [ZRGroupHeaderView groupHeader:tableView image:@"u_icon_1" text:@"我的订单"];
    }else if(section == 2){
        view = [ZRGroupHeaderView groupHeader:tableView image:@"u_icon_2" text:@"会员中心"];
    }else if(section == 3){
        view = [ZRGroupHeaderView groupHeader:tableView image:@"u_icon_3" text:@"安全中心"];
    }else if(section == 0){
        UIView *v = [[UIView alloc] initWithFrame:CGRectZero];
        return v;
    }
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 200;
    }else{
        return 40;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0;
    }else{
        return 60;
    }
}

#pragma mark - ZRPersonalTableViewCell的代理方法

- (void)goStoreClick:(ZRPersonalTableViewCell *)cell{
    ZRStoreViewController *storeVc = [[ZRStoreViewController alloc] init];
    [self.navigationController pushViewController:storeVc animated:YES];
}



@end
