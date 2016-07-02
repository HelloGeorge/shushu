//
//  ZRBookIntroViewCell.m
//  shushu
//
//  Created by Apple on 16/6/29.
//  Copyright © 2016年 zhangrui. All rights reserved.
//

#import "ZRBookIntroViewCell.h"
#import "ZRBookAllInfo.h"

@implementation ZRBookIntroViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (instancetype)bookIntroCell{
    return [[[NSBundle mainBundle] loadNibNamed:@"ZRBookIntroViewCell" owner:nil options:nil] lastObject];
}

- (void)setModel:(ZRBookAllInfo *)model{
    _model = model;
    _isbnLbl.text = _model.ISBN;
    _author.text = _model.author;
    _press.text = _model.press;
    _publicationDate.text = _model.publicationDate;
    _bookGena.text = _model.summary;
}

@end
