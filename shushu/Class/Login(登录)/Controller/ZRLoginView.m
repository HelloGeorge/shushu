//
//  ZRLoginView.m
//  shushu
//
//  Created by Apple on 16/7/2.
//  Copyright © 2016年 zhangrui. All rights reserved.
//

#import "ZRLoginView.h"
#import "AFNetworking.h"
#import "MJExtension.h"

@interface ZRLoginView ()
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *userPwd;
- (IBAction)loginBtn:(id)sender;

@end

@implementation ZRLoginView

- (void)viewDidLoad {
    [super viewDidLoad];
    
}



//登录
- (IBAction)loginBtn:(id)sender {
    //1.请求管理者
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    
    //2.拼接参数
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    param[@"password"] = self.userPwd.text;
    param[@"account"] = self.userName.text;
    
    //3.发送请求
    [mgr POST:@"http://www.91shushu.com/app/user/login" parameters:param success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //请求成功来到这里
        
        NSLog(@"%@",responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //请求失败来到这里
         NSLog(@"请求失败");
    }];
}
@end
