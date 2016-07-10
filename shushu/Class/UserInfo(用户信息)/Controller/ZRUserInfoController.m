//
//  ZRUserInfoController.m
//  shushu
//
//  Created by Apple on 16/7/10.
//  Copyright © 2016年 zhangrui. All rights reserved.
//

#import "ZRUserInfoController.h"
#import "ZRUser.h"
#import "ZRUserTool.h"

@interface ZRUserInfoController ()<UIPickerViewDelegate,UIPickerViewDataSource>

@property (nonatomic,strong) NSMutableArray *info;
@property (nonatomic,weak) UIButton *btn;

@end

@implementation ZRUserInfoController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //隐藏pickerView
    self.pickView.hidden = YES;
    
    self.navigationItem.title = @"账户信息";
    ZRUser *model = [ZRUserTool user];
//    self.model = model;
    
    self.userName.text = model.name;
    self.userPhone.text = model.phoneNumber;
    self.userMail.text = model.email;
    self.userNumber.text = [NSString stringWithFormat:@"%d",model.studentID];
    [self.college setTitle:model.school forState:UIControlStateNormal];
    [self.school setTitle:model.college forState:UIControlStateNormal];
    [self.major setTitle:model.major forState:UIControlStateNormal];
//    [self.startdate setTitle:model. forState:<#(UIControlState)#>]
    self.address.text = model.detailAddress;
    self.pickView.delegate = self;
}



//选择学院
- (IBAction)chooseSchool:(id)sender {
    self.pickView.hidden = NO;
    //加载plist文件
    NSString *path = [[NSBundle mainBundle] pathForResource:@"UserInfo.plist" ofType:nil];
    NSMutableDictionary *m = [NSMutableDictionary dictionaryWithContentsOfFile:path];
    NSDictionary *y = m[@"root"];
    self.info = y[self.college.titleLabel.text];
    [self.pickView reloadComponent:0];
    self.btn = sender;
}

//选择学校
- (IBAction)chooseCollege:(id)sender {
    self.pickView.hidden = NO;
    //加载plist文件
    NSString *path = [[NSBundle mainBundle] pathForResource:@"UserInfo.plist" ofType:nil];
    NSMutableDictionary *m = [NSMutableDictionary dictionaryWithContentsOfFile:path];
    NSDictionary *d = m[@"root"];
    self.info = d[@"school"];
    [self.pickView reloadComponent:0];
    self.btn = sender;
}

//选择专业
- (IBAction)chooseMajor:(id)sender {
    self.pickView.hidden = NO;
    //加载plist文件
    NSString *path = [[NSBundle mainBundle] pathForResource:@"UserInfo.plist" ofType:nil];
    NSMutableDictionary *m = [NSMutableDictionary dictionaryWithContentsOfFile:path];
    NSDictionary *y = m[@"root"];
    self.info = y[self.school.titleLabel.text];
    [self.pickView reloadComponent:0];
    self.btn = sender;
}

//选择入学日期
- (IBAction)chooseStart:(id)sender {
    self.pickView.hidden = NO;
    //加载plist文件
    NSString *path = [[NSBundle mainBundle] pathForResource:@"UserInfo.plist" ofType:nil];
    NSMutableDictionary *m = [NSMutableDictionary dictionaryWithContentsOfFile:path];
    NSDictionary *y = m[@"root"];
    self.info = y[@"startdate"];
    [self.pickView reloadComponent:0];
    self.btn = sender;
}

#pragma mark - UIPickerViewDelegate的代理方法
//返回多少列
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

//返回多少行
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return self.info.count;
}

//返回每一行的数据
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return self.info[row];
}

//返回每一行的数据
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(30, 0, 160, 30)];
    label.text = self.info[row];
    return label;
}

//选择了某一个数
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    UILabel *l = (UILabel *)[pickerView viewForRow:row forComponent:0];
    [self.btn setTitle:l.text forState:UIControlStateNormal];
    self.pickView.hidden = YES;
}










@end
