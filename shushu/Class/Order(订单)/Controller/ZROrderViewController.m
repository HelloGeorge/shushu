//
//  ZROrderViewController.m
//  shushu
//
//  Created by Apple on 16/6/29.
//  Copyright © 2016年 zhangrui. All rights reserved.
//

#import "ZROrderViewController.h"
#import "ZROrderViewCell.h"
#import "ZRGoods.h"
#import "AFNetworking.h"
#import "ZRGoodInfo.h"

@interface ZROrderViewController ()

//存放订单里面的数据模型
@property (nonatomic,strong) NSMutableArray *array;
@property (nonatomic,strong) NSDictionary *tip;
@property (nonatomic,strong) NSMutableArray *arrayM;
@end

@implementation ZROrderViewController

//- (NSArray *)arrayM{
//    if (_arrayM == nil) {
//        self.arrayM = [[NSMutableArray alloc] init];
//    }
//    return _arrayM;
//}

- (NSDictionary *)tip{
    if (_tip == nil) {
        self.tip = [[NSDictionary alloc] init];
    }
    return _tip;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"确认订单";
    [self.navigationController.view.subviews lastObject].hidden = YES;
    self.tableView.separatorStyle = NO;
    
    
    //取得文件路径
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *fileName = [path stringByAppendingString:@"/buyThings.plist"];
    self.array = [NSMutableArray arrayWithContentsOfFile:fileName];
//    请求数据
    [self upRecipe];
}

- (void)upRecipe{
    //1.请求的管理者
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    
    //2.拼接参数
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    NSMutableString *ids = [NSMutableString string];
    NSMutableDictionary *m = self.array[0];
    [ids appendString:m[@"ID"]];
    for (int i = 1; i < self.array.count; i++) {
        NSMutableDictionary *model = self.array[i];
        [ids appendString:[NSString stringWithFormat:@",%@",model[@"ID"]]];
    }
    param[@"ids"] = ids;
    
    NSMutableString *count = [NSMutableString string];
    [count appendString:m[@"productCount"]];
    for (int i = 1; i < self.array.count; i++) {
        NSMutableDictionary *model = self.array[i];
        [count appendString:[NSString stringWithFormat:@",%@",model[@"productCount"]]];
    }
    param[@"counts"] = count;
    
    param[@"shopId"] = m[@"shopId"];
//    NSLog(@"%@",m[@"shopId"]);
    param[@"site"] = @"东油";
    
    //3.发送请求
    [mgr POST:@"http://www.91shushu.com/app/product/getjsMsg" parameters:param success:^(AFHTTPRequestOperation *operation, NSDictionary *responseObject) {
        //请求成功来到这里
//        NSLog(@"%@",responseObject);
        self.arrayM = [NSMutableArray array];
        NSArray *arrayModel = responseObject[@"result"];
        for (NSDictionary *dic in arrayModel) {
            ZRGoodInfo *model = [ZRGoodInfo initWithDic:dic];
            [self.arrayM addObject:model];
        }

        self.tip = responseObject[@"tip"];
        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //请求失败来到这里
        NSLog(@"请求失败");
    }];
    
    
}


#pragma mark - Table view data source

//返回2组cell
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

//返回每一组的行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }else{
        return self.array.count;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        ZROrderViewCell *cell = [ZROrderViewCell addressViewCell];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else if(indexPath.section == 1){
        ZROrderViewCell *cell = [ZROrderViewCell orderViewCell];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.model = self.arrayM[indexPath.row];
//        ZRGoodInfo *model = self.arrayM[indexPath.row];
//        NSLog(@"%@",model.bookPhotoPath);
        return cell;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 80;
    }else{
        return 81;
    }
}



@end
