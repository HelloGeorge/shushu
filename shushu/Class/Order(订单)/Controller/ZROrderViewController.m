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
#import "ZRPayViewCell.h"
#import "UIView+ZRExtension.h"
#import "ZRUserTool.h"
#import "ZRUser.h"
#import "ZRAddressViewCell.h"
#import "ZRShowView.h"

@interface ZROrderViewController ()

//存放订单里面的数据模型
@property (nonatomic,strong) NSMutableArray *array;
@property (nonatomic,strong) NSMutableDictionary *tip;
@property (nonatomic,strong) NSMutableArray *arrayM;
@property (nonatomic,weak) UIView *bView;
//@property (nonatomic,strong) ZRUser *model;

@end

@implementation ZROrderViewController

//- (NSArray *)arrayM{
//    if (_arrayM == nil) {
//        self.arrayM = [[NSMutableArray alloc] init];
//    }
//    return _arrayM;
//}


- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.bView.hidden = YES;
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
    
//    //获取用户模型
//    ZRUser *model = [ZRUserTool user];
//    self.model = model;
}

//创建一个地步显示的view
- (void)bottomView{
    UIView *btView = [[UIView alloc] init];
    self.bView = btView;
    CGFloat viewH = [UIApplication sharedApplication].keyWindow.height;
    CGFloat viewW = [UIApplication sharedApplication].keyWindow.width;
    btView.frame = CGRectMake(0, viewH - 89 , viewW, 40);
    [self.navigationController.view addSubview:btView];
//    botView.backgroundColor = [UIColor redColor];
    //创建一个提交订单的按钮
    UIButton *handInBtn = [[UIButton alloc] init];
    handInBtn.backgroundColor = [UIColor redColor];
    [handInBtn setTitle:@"提交订单" forState:UIControlStateNormal];
    [handInBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    handInBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    handInBtn.width = 80;
    handInBtn.height = 40;
    handInBtn.y = 0;
    handInBtn.x = viewW - handInBtn.width;
    [btView addSubview:handInBtn];
    
    UILabel *pagLbl = [[UILabel alloc] init];
    pagLbl.text =[NSString stringWithFormat:@"共%d件商品，合计：¥%.1f",[self.tip[@"totalCount"] intValue],[self.tip[@"totalMoney"] floatValue]];
    pagLbl.width = 200;
    pagLbl.height = 30;
    pagLbl.x = viewW - 200 - 80;
    pagLbl.y = 5;
    [btView addSubview:pagLbl];
    pagLbl.textAlignment = NSTextAlignmentRight;
    pagLbl.font = [UIFont systemFontOfSize:14];
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
        self.tip = [NSMutableDictionary dictionary];
        NSArray *arrayModel = responseObject[@"result"];
        for (NSDictionary *dic in arrayModel) {
            ZRGoodInfo *model = [ZRGoodInfo initWithDic:dic];
            [self.arrayM addObject:model];
        }
        
        self.tip = responseObject[@"tip"];
        [self.tableView reloadData];
        ZRShowView *view = [ZRShowView showViewWithText:@"刷新成功"];
        [[UIApplication sharedApplication].keyWindow addSubview:view];
        view.alpha = 0;
        [UIView animateWithDuration:1.0 animations:^{
            view.alpha = 1;
        } completion:^(BOOL finished) {
            if (finished) {
                [UIView animateWithDuration:1.0 delay:1.09 options:UIViewAnimationOptionCurveLinear animations:^{
                    view.alpha = 0;
                } completion:^(BOOL finished) {
                    [view removeFromSuperview];
                }];
            }
        }];
        [self bottomView];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //请求失败来到这里
        NSLog(@"请求失败");
    }];
    
    
}


#pragma mark - Table view data source

//返回2组cell
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

//返回每一组的行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }else if(section == 1){
        return self.array.count;
    }else{
        return 1;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        ZRAddressViewCell *cell = [ZRAddressViewCell addressView];
        cell.model = [ZRUserTool user];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else if(indexPath.section == 1){
        ZROrderViewCell *cell = [ZROrderViewCell orderViewCell];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.model = self.arrayM[indexPath.row];
        return cell;
    }else{
        ZRPayViewCell *cell = [ZRPayViewCell payViewCell];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 80;
    }else if(indexPath.section == 1){
        return 93;
    }else{
        return 100;
    }
}



@end
