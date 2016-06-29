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
#import "ZRGoods.h"
#import "UIView+ZRExtension.h"
#import "ZROrderViewController.h"

@interface ZRBuyViewController ()<ZRBuyViewCellDelegate>
//存放商品信息模型的可变数组
@property (nonatomic,strong) NSMutableArray *arrayModel;
//显示总价值的标签
@property (nonatomic,weak) UILabel *botLbl;
//结算按钮
@property (nonatomic,weak) UIButton *pBtn;
//全选按钮
@property (nonatomic,weak) UIButton *aBtn;



@end

@implementation ZRBuyViewController

//存放购物车中选中商品的总价值
static float allPrice = 0;

//懒加载
- (NSArray *)arrayModel{
    if (_arrayModel == nil) {
        //加载plist文件
        //获取文件的地址
        NSString *path = [[NSBundle mainBundle] pathForResource:@"goods.plist" ofType:nil];
        NSMutableArray *array = [NSMutableArray array];
        _arrayModel = [NSMutableArray arrayWithContentsOfFile:path];
        for (NSDictionary *dic in _arrayModel) {
            //将字典转换成模型对象
            ZRGoods *model = [ZRGoods goodsWithDic:dic];
            [array addObject:model];
        }
        _arrayModel = array;
    }
    return _arrayModel;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStyleDone target:self action:@selector(selectThing)];
    
    self.tableView.rowHeight = 100;
    self.tableView.separatorStyle = NO;
    self.tableView.sectionHeaderHeight = 40;
    //设置tableView的背景色为灰色
//    self.tableView.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0];
    
    //创建一个底部的显示总价格的view
    [self createBotView];
}

//创建一个底部的显示总价格的view
- (void)createBotView{
    UIView *view = [[UIView alloc] init];
    view.x = 0;
    view.y = [[UIApplication sharedApplication] keyWindow].height - 89;
    view.width = [[UIApplication sharedApplication] keyWindow].width;
    view.height = 40;
    //设置view的背景色
    view.backgroundColor = [UIColor whiteColor];
//    [[[UIApplication sharedApplication] keyWindow] addSubview:view];
//    [self.tableView addSubview:view];
//    [self.tableView bringSubviewToFront:view];
//    [[[UIApplication sharedApplication].windows lastObject] addSubview:view];
    //将视图添加到导航栏中
    [self.navigationController.view addSubview:view];
    //添加底部view中的子控件
    //添加全选按钮
    UIButton *allBtn = [[UIButton alloc] init];
    self.aBtn = allBtn;
    [allBtn setImage:[UIImage imageNamed:@"new_feature_share_false"] forState:UIControlStateNormal];
    [allBtn setImage:[UIImage imageNamed:@"new_feature_share_true"] forState:UIControlStateSelected];
    [allBtn setTitle:@"全选" forState:UIControlStateNormal];
    [allBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [allBtn setTitle:@"全不选" forState:UIControlStateSelected];
    [allBtn setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    allBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    allBtn.frame = CGRectMake(10, 10, 80, 20);
    [view addSubview:allBtn];
    //给全选按钮添加事件
    [allBtn addTarget:self action:@selector(allPage) forControlEvents:UIControlEventTouchUpInside];
    
    //添加结算按钮
    UIButton *pageBtn = [[UIButton alloc] init];
    self.pBtn = pageBtn;
    [pageBtn setTitle:@"结算" forState:UIControlStateNormal];
    [pageBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    pageBtn.backgroundColor = [UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1.0];
    pageBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    pageBtn.frame = CGRectMake(self.view.width - 60, 0, 60, 40);
    [view addSubview:pageBtn];
    //结算按钮添加事件
    [pageBtn addTarget:self action:@selector(page) forControlEvents:UIControlEventTouchUpInside];
    
    //添加总计label
    UILabel *allLbl = [[UILabel alloc] init];
    self.botLbl = allLbl;
    allLbl.font = [UIFont systemFontOfSize:12];
    allLbl.text = @"总计:";
    allLbl.frame = CGRectMake(self.view.width - 80 - 60, 10, 80, 20);
    [view addSubview:allLbl];
}

//全选
- (void)allPage{
    if (!self.aBtn.selected) {  //按钮没有被选择了
        self.aBtn.selected = !self.aBtn.isSelected;
        for (int i = 0; i < self.arrayModel.count; i++) {
            ZRBuyViewCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:i]];
            if (!cell.goods.isSel) {  //当前商品没有选择了
                [cell chooseBtn:nil];
            }
        }
    }else{   //按钮被选择了
        self.aBtn.selected = !self.aBtn.isSelected;
        for (int i = 0; i < self.arrayModel.count; i++) {
            ZRBuyViewCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:i]];
            if (cell.goods.isSel) {  //当前商品没有选择了
                [cell chooseBtn:nil];
            }
        }
    }
    
}

//结算
- (void)page{
    if (allPrice != 0) {   //如果选择了商品
        ZROrderViewController *orderVc = [[ZROrderViewController alloc] init];
        [self.navigationController pushViewController:orderVc animated:YES];
    }
}

- (void)selectThing{
    NSLog(@"选择商品");
}

#pragma mark - Table view data source

//返回组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [self.arrayModel count];
}

//返回行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 1;
}

//返回每一行的cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZRBuyViewCell *cell = [ZRBuyViewCell buyViewCell];
    cell.goods = self.arrayModel[indexPath.section];
    cell.delegate = self;
    return cell;
}

//实现删除购物车里面的商品
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    //删除一组tableviewcell要用deleteSections方法
    //删除一个cell要用deleterowatindexpath
    [self.tableView beginUpdates];
    [self.arrayModel removeObjectAtIndex:indexPath.section];
    [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:indexPath.section] withRowAnimation:UITableViewRowAnimationLeft];
    [self.tableView endUpdates];
//    [self.arrayModel removeObjectAtIndex:indexPath.section];
//    [self.tableView reloadData];
}

//返回自定义的每一行的headerView
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    ZRGoods *good = self.arrayModel[section];
    return [ZRBuyHeaderView buyHeader:tableView storeText:good.store section:section];
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"  ";
}

#pragma mark - ZRBuyViewCell的代理方法

//删除一组cell
- (void)deleteBtnClick:(ZRBuyViewCell *)cell{
    [self.arrayModel removeObjectAtIndex:cell.section];
    [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:cell.section] withRowAnimation:UITableViewRowAnimationLeft];
}

//实现选择商品后设置底部view的方法
- (void)chooseBtnClick:(ZRBuyViewCell *)cell{
    if (cell.goods.isSel) {   //说明选中当前商品，总价值增加
        allPrice += cell.goods.goodsPrice;
        self.botLbl.text = [NSString stringWithFormat:@"总计:%.1f",allPrice];
    }else{   //说明当前商品没有被选中
        allPrice -= cell.goods.goodsPrice;
        self.botLbl.text = [NSString stringWithFormat:@"总计:%.1f",allPrice];
    }
    if (allPrice != 0) {  //总价值不为0
        self.pBtn.backgroundColor = [UIColor redColor];
    }else{    //总价值为0
        self.pBtn.backgroundColor = [UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1.0];
    }
}


@end
