//
//  ZC_CityLabel.h
//  CityDemo
//
//  Created by Sunfairy on 2017/5/16.
//  Copyright © 2017年 Sunfairy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZC_CityLabel : UILabel

typedef NS_ENUM(NSInteger, ZC_CityLabelType) {
    ZC_CityLabelPro=2,
    ZC_CityLabelCit=3,
    ZC_CityLabelDis=4,
};

@property(nonatomic, assign)ZC_CityLabelType zc_cityType;
@property (nonatomic, copy)NSString *groupName;
@end
