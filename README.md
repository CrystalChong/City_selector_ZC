# City_selector_ZC
城市选择,不强制选择到某个市,某个区.三级不联动,

使用方法很简单,导入头文件

#import "ZC_CityLabel.h"

然后使用这个类创建label  (ZC_CityLabel.h)继承与lable 


    ZC_CityLabel *label1 = [[ZC_CityLabel alloc]initWithFrame:CGRectMake(10, 100, 100, 40)];

    label1.text = @"请选择省";//默认显示文字
    label1.userInteractionEnabled = YES;  //防止事件阻断
    label1.groupName = @"sb";//设置组名,因为一个项目中可能会遇到多个城市选择
    label1.zc_cityType = ZC_CityLabelPro;//点击这个按钮,选择省
    label1.backgroundColor = [UIColor redColor];
    [self.view addSubview:label1];//这个label立刻就显示在屏幕上了,当你点击的时候就可以选择 省了,那如何选择市以及区呢,很简单  设置 
    
    
        * label2.zc_cityType = ZC_CityLabelCit;//点击这个按钮,选择市
        * label.zc_cityType = ZC_CityLabelDis;//点击这个按钮,选择区


注意所有的label 必须设置组名  label1.groupName = @"sb";这样才能省市区联动.
