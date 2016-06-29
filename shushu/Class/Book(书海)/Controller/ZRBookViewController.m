//
//  ZRBookViewController.m
//  shushu
//
//  Created by Apple on 16/6/24.
//  Copyright © 2016年 zhangrui. All rights reserved.
//

#import "ZRBookViewController.h"

@interface ZRBookViewController ()

@end

@implementation ZRBookViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"书籍分类";
    self.tableView.rowHeight = 60;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 5;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *ID = @"CELL";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == Nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    if (indexPath.row == 0) {
        cell.textLabel.text = @"教材";
        cell.detailTextLabel.text = @"研究生 本科 公共课 专业课";
    }else if(indexPath.row == 1){
        cell.textLabel.text = @"外语及考试";
        cell.detailTextLabel.text = @"四六级 考研 考证 各类考试";
    }else if(indexPath.row == 2){
        cell.textLabel.text = @"小说";
        cell.detailTextLabel.text = @"当代 现代 名著 外国";
    }else if(indexPath.row == 3){
        cell.textLabel.text = @"人文社科";
        cell.detailTextLabel.text = @"青春 经管 励志 历史";
    }else{
        cell.textLabel.text = @"其它";
    }
    return cell;
}



@end
