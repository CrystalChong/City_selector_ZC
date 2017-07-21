//
//  ZC_CityLabel.m
//  CityDemo
//
//  Created by Sunfairy on 2017/5/16.
//  Copyright © 2017年 Sunfairy. All rights reserved.
//

#import "ZC_CityLabel.h"
#import "ZC_TableViewCell.h"

#define KscreenWidth [UIScreen mainScreen].bounds.size.width
#define KscreenHeight [UIScreen mainScreen].bounds.size.height
@interface ZC_CityLabel()<UITableViewDataSource,UITableViewDelegate>


@property (nonatomic, strong)NSMutableDictionary *globleDic;
@property (nonatomic, strong)NSMutableArray *apprenceDic;
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)UIButton *btn;

@end

@implementation ZC_CityLabel
-(instancetype)initWithFrame:(CGRect)frame withView:(UIView *)view{

    self = [super initWithFrame:frame];
    if(self != nil){
        self.textAlignment = NSTextAlignmentCenter;
    }
    
    return self;
}

-(void)awakeFromNib{
    [super awakeFromNib];
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
    //如果这个label是provence
    if (self.zc_cityType==ZC_CityLabelPro) {
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(proVence)];
        
        tap.numberOfTapsRequired = 1;
        tap.numberOfTouchesRequired = 1;
        [self addGestureRecognizer:tap];
    }
    //如果这个label是city
    if (self.zc_cityType==ZC_CityLabelCit) {
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(cityAction)];
        tap.numberOfTapsRequired = 1;
        tap.numberOfTouchesRequired = 1;
        [self addGestureRecognizer:tap];
        
    }
    //如果这个label 是值得districtor
    if(self.zc_cityType == ZC_CityLabelDis){
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(districtAction)];
        tap.numberOfTapsRequired = 1;
        tap.numberOfTouchesRequired = 1;
        [self addGestureRecognizer:tap];
        
    }
    
}

- (void)districtAction{
    
    self.globleDic = [NSMutableDictionary dictionary];
    self.apprenceDic = [NSMutableArray array];
    
    NSString *path = [[NSBundle mainBundle]pathForResource:@"Address" ofType:@"plist"];
    self.globleDic  =(NSMutableDictionary *) [NSDictionary dictionaryWithContentsOfFile:path];
//    self.apprenceDic = (NSMutableArray *)[self.globleDic allKeys];
    
    if(self.groupName.length>0){
        
        NSString *key = [NSString stringWithFormat:@"%@_ZC_CityLabelCit",self.groupName];
        
//        [[NSUserDefaults standardUserDefaults]setValue:self.text forKey:key];
        NSString *city = [[NSUserDefaults standardUserDefaults]valueForKey:key];
        if (!city) {
            return;
        }
        NSString *key1 = [NSString stringWithFormat:@"%@_ZC_CityLabelPro",self.groupName];
        
        NSString *provence = [[NSUserDefaults standardUserDefaults]valueForKey:key1];
        if (!provence) {
            return;
        }
        
        NSArray *proArr = [self.globleDic valueForKey:provence];
        
        self.apprenceDic = [[proArr firstObject] valueForKey:city];
        [self creatSubVies];
    }
}

//城市
- (void)cityAction{
    self.globleDic = [NSMutableDictionary dictionary];
    self.apprenceDic = [NSMutableArray array];
    
    NSString *path = [[NSBundle mainBundle]pathForResource:@"Address" ofType:@"plist"];
    self.globleDic  =(NSMutableDictionary *) [NSDictionary dictionaryWithContentsOfFile:path];
    if(self.groupName.length>0){
        
        NSString *key = [NSString stringWithFormat:@"%@_ZC_CityLabelPro",self.groupName];
        
        NSString *provence = [[NSUserDefaults standardUserDefaults]valueForKey:key];
        if (!provence) {
            return;
        }
        
        NSArray *proArr = [self.globleDic valueForKey:provence];
        
        self.apprenceDic =(NSMutableArray *) [[proArr firstObject] allKeys];
        
        [self creatSubVies];
    }

    
}
//省
- (void)proVence{
    self.globleDic = [NSMutableDictionary dictionary];
    self.apprenceDic = [NSMutableArray array];
    
    NSString *path = [[NSBundle mainBundle]pathForResource:@"Address" ofType:@"plist"];
    self.globleDic  =(NSMutableDictionary *) [NSDictionary dictionaryWithContentsOfFile:path];
    self.apprenceDic = (NSMutableArray *)[self.globleDic allKeys];
    
    [self creatSubVies];
    
}
- (void)creatSubVies{
    
    if (self.tableView!= nil) {
        [self.tableView removeFromSuperview];
        self.tableView=nil;
    }
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, KscreenWidth*.8, KscreenHeight*.8) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.layer.borderColor = [UIColor grayColor].CGColor;
    self.tableView.layer.borderWidth = 5;
    self.tableView.layer.cornerRadius = 5;
//    self.tableView.layer.masksToBounds = YES;
    [self.tableView registerNib:[UINib nibWithNibName:@"ZC_TableViewCell" bundle:nil] forCellReuseIdentifier:@"zc_tableviewCELL"];
    UIWindow *window = [[UIApplication sharedApplication].windows lastObject];
    self.tableView.center  = window.center;
    [window addSubview:self.tableView];
    NSLog(@"%f",CGRectGetMaxX(self.tableView.frame));
    _btn  = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.tableView.frame)-10, CGRectGetMinY(self.tableView.frame)-20, 40, 40)];
//    btn.backgroundColor = [UIColor redColor];
    [_btn addTarget:self action:@selector(disMiss:) forControlEvents:UIControlEventTouchUpInside];
    [_btn setImage:[UIImage imageNamed:@"图层-0"] forState:UIControlStateNormal];
    [window addSubview:_btn];
    [self.tableView reloadData];
//    self.tableView.backgroundColor = [UIColor redColor];
    
}

- (void)disMiss:(UIButton *)btn{
    
    [self.tableView removeFromSuperview];
    self.tableView=nil;
    [btn removeFromSuperview];
    btn=nil;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.apprenceDic.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ZC_TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"zc_tableviewCELL" forIndexPath:indexPath];
    cell.str = self.apprenceDic[indexPath.row];
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    self.text = self.apprenceDic[indexPath.row];
    
//改变图片,,不过没多大用途
//    ZC_TableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
//    UIImageView *imagVie = [cell viewWithTag:302];
//    imagVie.image = [UIImage imageNamed:@"radio2"];
    
    [self.tableView removeFromSuperview];
    self.tableView=nil;
    if(self.btn != nil){
        [self.btn removeFromSuperview];
        self.btn = nil;
    }
    //根据 组名 设置 省
    if(self.groupName.length>0&&self.text.length>0&&self.zc_cityType==ZC_CityLabelPro){
        
        NSString *key = [NSString stringWithFormat:@"%@_ZC_CityLabelPro",self.groupName];
        
        [[NSUserDefaults standardUserDefaults]setValue:self.text forKey:key];
        
        
        NSString *strName = [NSString stringWithFormat:@"%@_ZC_CityLabelPro",self.groupName];
        [[NSNotificationCenter defaultCenter]postNotificationName:strName object:nil];
        
    }
    //根据 组名 设置 市
    if(self.groupName.length>0&&self.text.length>0&&self.zc_cityType==ZC_CityLabelCit){
        
        NSString *key = [NSString stringWithFormat:@"%@_ZC_CityLabelCit",self.groupName];
        
        [[NSUserDefaults standardUserDefaults]setValue:self.text forKey:key];
        
        
         NSString *strName = [NSString stringWithFormat:@"%@_ZC_CityLabelPro",self.groupName];
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(clearTextcity) name:strName object:nil];
        
        
        NSString *strCityName = [NSString stringWithFormat:@"%@_ZC_CityLabelCit",self.groupName];

        [[NSNotificationCenter defaultCenter]postNotificationName:strCityName object:nil];
        
    }
    if (self.groupName.length>0&&self.text.length>0&&self.zc_cityType==ZC_CityLabelDis) {
        
        NSString *strName = [NSString stringWithFormat:@"%@_ZC_CityLabelPro",self.groupName];
        NSString *strCityName = [NSString stringWithFormat:@"%@_ZC_CityLabelCit",self.groupName];
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(clearTextDis) name:strName object:nil];
          [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(clearTextDis) name:strCityName object:nil];
    }
}
- (void)clearTextDis{
    self.text = @"";
}

-(void)dealloc{
    [self removeObserver:self forKeyPath:@"provence"];
    [self removeObserver:self forKeyPath:@"ZC_CityLabelCit"];
    NSString *key = [NSString stringWithFormat:@"%@_ZC_CityLabelCit",self.groupName];
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:key];
    
    NSString *key1 = [NSString stringWithFormat:@"%@_ZC_CityLabelPro",self.groupName];
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:key1];
    
    
}


- (void)clearTextcity{
    self.text=@"";
    NSString *key = [NSString stringWithFormat:@"%@_ZC_CityLabelCit",self.groupName];
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:key];
}





@end
