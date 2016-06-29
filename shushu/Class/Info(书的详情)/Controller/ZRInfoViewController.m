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

@interface ZRInfoViewController ()

@end

@implementation ZRInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"书籍详情";
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
        return cell;
    }else if(indexPath.section == 1){
        ZRBookIntroViewCell *cell = [ZRBookIntroViewCell bookIntroCell];
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




@end
