//
//  ZC_TableViewCell.m
//  CityDemo
//
//  Created by Sunfairy on 2017/5/16.
//  Copyright © 2017年 Sunfairy. All rights reserved.
//

#import "ZC_TableViewCell.h"

@implementation ZC_TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)layoutSubviews{
    [super layoutSubviews];
    UILabel *label = [self viewWithTag:301];
    label.text = self.str;
    
}
@end
