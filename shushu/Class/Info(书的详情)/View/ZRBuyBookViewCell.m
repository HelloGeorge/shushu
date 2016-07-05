//
//  ZRBuyBookViewCell.m
//  shushu
//
//  Created by Apple on 16/6/29.
//  Copyright © 2016年 zhangrui. All rights reserved.
//

#import "ZRBuyBookViewCell.h"
#import "UIView+ZRExtension.h"
#import "ZRBookAllInfo.h"
#import "ZRBookTip.h"
#import "UIImageView+WebCache.h"
#import "AFNetworking.h"
#import "ZRUserTool.h"
#import "ZRUser.h"

@interface ZRBuyBookViewCell ()



@end

@implementation ZRBuyBookViewCell

- (void)awakeFromNib {
    
    
    
}


//在书的原价上划一条横线
- (void)linePriceLbl{
    NSMutableAttributedString *newPrice = [[NSMutableAttributedString alloc] initWithString:self.priceLbl.text];
    [newPrice addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlinePatternSolid | NSUnderlineStyleSingle) range:NSMakeRange(0, newPrice.length)];
    self.priceLbl.attributedText = newPrice;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

//增加书的数量
- (IBAction)plusCount:(id)sender {
    int count = [self.countLbl.text intValue];
    count++;
    self.countLbl.text = [NSString stringWithFormat:@"%d",count];
}

//减少书的数量
- (IBAction)minusCount:(id)sender {
    int count = [self.countLbl.text intValue];
    if (count > 1) {
        count--;
    }
    self.countLbl.text = [NSString stringWithFormat:@"%d",count];
}

//将书籍加入到购物车中
- (IBAction)buyThing:(id)sender {
//    //取得沙盒的路径
//    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
//    NSString *fileName = [path stringByAppendingString:@"/buyThings.plist"];
////    NSMutableArray *dic = [[NSMutableArray alloc] init];
////    [dic setValue:@"123" forKey:@"book"];
////    [dic writeToFile:fileName atomically:YES];
//    NSFileManager *fileM = [NSFileManager defaultManager];
//    if ([fileM fileExistsAtPath:fileName] == YES) {
//        //说明沙盒中已经存在这个文件，只需要将数组取出来
//        NSLog(@"YES");
//        NSMutableArray *array = [[NSMutableArray alloc] initWithContentsOfFile:fileName];
//        NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
//        [dic setValue:[NSString stringWithFormat:@"%d",self.bookId] forKey:@"book"];
//        [dic setValue:self.countLbl.text forKey:@"count"];
//        [array addObject:dic];
//        [array writeToFile:fileName atomically:YES];
//    }else{
//        NSLog(@"NO");
//        NSMutableArray *array = [[NSMutableArray alloc] init];
//        NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
//        [dic setValue:[NSString stringWithFormat:@"%d",self.bookId] forKey:@"book"];
//        [dic setValue:self.countLbl.text forKey:@"count"];
//        [array addObject:dic];
//        [array writeToFile:fileName atomically:YES];
//    }
    
    //将要购买的书籍信息发送到服务器端的购物车
    //1.请求的管理者
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    
    
    //获取用户的信息
    ZRUser *model = [ZRUserTool user];
    //2.拼接参数
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    param[@"productId"] = [NSString stringWithFormat:@"%d",self.bookId];
    param[@"userId"] = [NSString stringWithFormat:@"%d",model.ID];
    param[@"productCount"] = self.countLbl.text;
    
    //3.请求
    [mgr POST:@"http://www.91shushu.com/app/product/joinCart" parameters:param success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //请求成功返回这里
        NSLog(@"成功加入购物车");
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //请求失败返回这里
        NSLog(@"请求失败");
    }];
    
}

+ (instancetype)buyBookCell{
    return [[[NSBundle mainBundle] loadNibNamed:@"ZRBuyBookViewCell" owner:nil options:nil] lastObject];
}

- (void)setModel1:(ZRBookAllInfo *)model1{
    _model1 = model1;
    [_bookImg sd_setImageWithURL:[NSURL URLWithString:_model1.bookPhotoPath] placeholderImage:[UIImage imageNamed:@"timeline_image_placeholder"]];
    _bookName.text = _model1.title;
    _priceLbl.text = [NSString stringWithFormat:@"¥%@",_model1.price];
    //在原价上划一横线
    [self linePriceLbl];
    
}

- (void)setModel2:(ZRBookTip *)model2{
    _model2 = model2;
    _sellingPrice.text = [NSString stringWithFormat:@"¥%@",_model2.sellingPrice];
    _sellerName.text = _model2.shopName;
    _area.text = _model2.area;
    _sendType.text = _model2.sendType;
    _fee.text = _model2.fee;
    _isYue.text = _model2.isCanMeet;
    _cageCount.text = [NSString stringWithFormat:@"%d",_model2.count];
}




















@end
