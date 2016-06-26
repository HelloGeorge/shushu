//
//  ZRBuyViewController.m
//  shushu
//
//  Created by Apple on 16/6/24.
//  Copyright © 2016年 zhangrui. All rights reserved.
//

#import "ZRBuyViewController.h"
#import "ZRBuyViewCell.h"
#import "ZRBuyHeaderView.h"

@interface ZRBuyViewController ()
@property (nonatomic,strong) NSArray *array;

@end

@implementation ZRBuyViewController

//懒加载
- (NSArray *)array{
    if (_array == nil) {
        //加载plist文件
        //获取文件的地址
        NSString *path = [[NSBundle mainBundle] pathForResource:@"goods.plist" ofType:nil];
        self.array = [NSArray arrayWithContentsOfFile:path];
    }
    return _array;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStyleDone target:self action:@selector(selectThing)];
    
    self.tableView.rowHeight = 100;
    self.tableView.separatorStyle = NO;
    self.tableView.sectionHeaderHeight = 40;
    
}

- (void)selectThing{
    NSLog(@"选择商品");
}

#pragma mark - Table view data source

//返回行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 1;
}

//返回每一行的cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZRBuyViewCell *cell = [ZRBuyViewCell buyViewCell];
    cell.goods = self.array;
    return cell;
}

//实现删除购物车里面的商品
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

//返回自定义的每一行的headerView
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    NSDictionary *d = self.array[section];
    return [ZRBuyHeaderView buyHeader:tableView storeText:d[@"store"] section:section];
}

@end
