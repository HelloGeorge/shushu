//
//  ZRUserInfoController.h
//  shushu
//
//  Created by Apple on 16/7/10.
//  Copyright © 2016年 zhangrui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZRUserInfoController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *userPhone;
@property (weak, nonatomic) IBOutlet UITextField *userMail;
@property (weak, nonatomic) IBOutlet UITextField *userNumber;
@property (weak, nonatomic) IBOutlet UIButton *college;
- (IBAction)chooseCollege:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *school;
- (IBAction)chooseSchool:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *major;

- (IBAction)chooseMajor:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *startdate;
- (IBAction)chooseStart:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *address;
@property (weak, nonatomic) IBOutlet UIPickerView *pickView;


@end
