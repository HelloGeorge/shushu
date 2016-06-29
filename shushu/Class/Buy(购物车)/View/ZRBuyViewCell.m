//
//  ZRBuyViewCell.m
//  shushu
//
//  Created by Apple on 16/6/26.
//  Copyright © 2016年 zhangrui. All rights reserved.
//

#import "ZRBuyViewCell.h"
#import "ZRBuyViewController.h"


@interface ZRBuyViewCell ()



@end

@implementation ZRBuyViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setGoods:(ZRGoods *)goods{
    _goods = goods;
    //取得字典
//    NSDictionary *g = _goods[0];
//    [_store setTitle:[NSString stringWithFormat:@"%@→",g[@"store"]] forState:UIControlStateNormal];
    _goodsImg.image = [UIImage imageNamed:_goods.goodsImg];
    _goodsDesc.text = _goods.goodsDesc;
    _goodsKind.text = [NSString stringWithFormat:@"颜色分类:%@",_goods.goodsKind];
    _goodsPrice.text = [NSString stringWithFormat:@"%.1f",_goods.goodsPrice];
    _goodsCount.text = [NSString stringWithFormat:@"×%d",_goods.goodsCount];
    
}


//选择商品
- (IBAction)chooseBtn:(id)sender {
    //按钮状态取反
    _choose.selected = !_choose.isSelected;
    //商品的选择状态取反
    _goods.isSel = !_goods.isSel;
    //只有当代理实现了这个方法才会去执行
    if ([self.delegate respondsToSelector:@selector(chooseBtnClick:)]) {
        [self.delegate chooseBtnClick:self];
    }
}

////编辑商品
//- (IBAction)editBtn:(id)sender {
//    
//    //控件优先级高，只要修改控件，就不会执行修改frame的方法
//    if (self.isSel == false) {
////        _goodsView.frame = CGRectMake(-40, 40, 415, 100);
//        _goodsView.x = -40;
//        self.isSel = true;
//        self.edit.hidden = YES;
//        self.finish.hidden = NO;
//    }else{
////        _goodsView.frame = CGRectMake(0, 40, 415, 100);
//        _goodsView.x = 0;
//        self.isSel = false;
//        self.edit.hidden = NO;
//        self.finish.hidden = YES;
//    }
//}


+ (instancetype)buyViewCell{
    return [[[NSBundle mainBundle] loadNibNamed:@"ZRBuyViewCell" owner:nil options:nil] lastObject];
}

//删除商品的按钮
- (IBAction)deleteBtn:(id)sender {
    if ([self.delegate respondsToSelector:@selector(deleteBtnClick:)]) {
        [self.delegate deleteBtnClick:self];
    }
}













@end
