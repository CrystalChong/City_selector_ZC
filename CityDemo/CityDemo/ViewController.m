//
//  ViewController.m
//  CityDemo
//
//  Created by Sunfairy on 2017/5/16.
//  Copyright © 2017年 Sunfairy. All rights reserved.
//

#import "ViewController.h"
#import "ZC_CityLabel.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet ZC_CityLabel *storyBord;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor grayColor];
    ZC_CityLabel *label1 = [[ZC_CityLabel alloc]initWithFrame:CGRectMake(10, 100, 100, 40)];
    
    label1.text = @"请选择省";//默认显示文字
    label1.userInteractionEnabled = YES;
    label1.groupName = @"sb";//设置组名,因为一个项目中可能会遇到多个城市选择
    label1.zc_cityType = ZC_CityLabelPro;//点击这个按钮,选择省
    label1.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:label1];
    
    ZC_CityLabel *label2 = [[ZC_CityLabel alloc]initWithFrame:CGRectMake(10, 205, 100, 40)];
    label2.text = @"请选择市";
    label2.userInteractionEnabled = YES;
    label2.groupName =@"sb";
    label2.zc_cityType = ZC_CityLabelCit;//点击这个按钮,选择市
    label2.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:label2];
    
    ZC_CityLabel *label = [[ZC_CityLabel alloc]initWithFrame:CGRectMake(10, 305, 100, 40)];
    label.text = @"请选择区";
    label.userInteractionEnabled = YES;
    label.groupName =@"sb";
    label.zc_cityType = ZC_CityLabelDis;
    label.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:label];
    
    
    self.storyBord.groupName = @"sbw";
    self.storyBord.userInteractionEnabled = YES;
    self.storyBord.zc_cityType = ZC_CityLabelCit;
    
}

- (void)_reViewBorderWIthView:(UIView *)view{
    
    view.layer.borderWidth = 1;
    view.layer.borderColor = [UIColor blackColor].CGColor;
    view.layer.cornerRadius = 3;
    view.layer.masksToBounds = YES;
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
