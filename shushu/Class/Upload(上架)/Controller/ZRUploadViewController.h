//
//  ZRUploadViewController.h
//  shushu
//
//  Created by Apple on 16/7/1.
//  Copyright © 2016年 zhangrui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZRUploadViewController : UIViewController
//书籍的名称
@property (weak, nonatomic) IBOutlet UITextField *bookName;
//书籍的ISBN
@property (weak, nonatomic) IBOutlet UITextField *isbnLbl;
//书籍的原价
@property (weak, nonatomic) IBOutlet UITextField *oriPrice;
//书籍的现价
@property (weak, nonatomic) IBOutlet UITextField *nowPrice;
//书籍的作者
@property (weak, nonatomic) IBOutlet UITextField *writerLbl;
//书籍的种类
@property (weak, nonatomic) IBOutlet UIButton *kingB;
//显示书籍的种类
@property (weak, nonatomic) IBOutlet UIPickerView *kind;
//选择书籍的种类
- (IBAction)bookKind:(id)sender;
//显示传回来的照片
@property (weak, nonatomic) IBOutlet UIImageView *imgBook;
//显示书籍的数量
@property (weak, nonatomic) IBOutlet UITextField *bookCount;
//上传信息
- (IBAction)upBook:(id)sender;

@end
