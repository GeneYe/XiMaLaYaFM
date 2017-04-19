//
//  JinRiZuiHuoViewController.m
//  XiMaLaYaFM
//
//  Created by Gene_Ye on 2016/11/20.
//  Copyright © 2016年 Gene. All rights reserved.
//

#import "JinRiZuiHuoViewController.h"
#import "AFNetWorking_Request.h"
#import "JinRiZuiHuoRootViewController.h"

@interface JinRiZuiHuoViewController ()


@end

@implementation JinRiZuiHuoViewController


- (NSMutableArray *)idArray{
    if (!_idArray) {
        _idArray = [NSMutableArray arrayWithObjects:@"3",@"2",@"4",@"12",@"6",@"1",@"10",@"9",@"5",@"13",@"14",@"15",@"16",@"8",@"18",@"7",@"20",@"22",@"21",@"24",@"23",@"31", nil];
    }
    return _idArray;
}


- (NSMutableArray *)titleArray{
    if (!_titleArray) {
        
        _titleArray = [NSMutableArray arrayWithObjects:@"有声书", @"音乐",@"娱乐",@"相声评书",@"儿童",@"资讯",@"情感生活",@"历史",@"外语",@"教育培训",@"百家讲坛",@"广播剧",@"戏曲",@"商业财经",@"IT科技",@"健康养生",@"校园",@"旅游",@"汽车",@"动漫游戏",@"电影",@"时尚生活",nil];
    }
    return _titleArray;
}

- (NSMutableArray *)vcArray{
    if (!_vcArray) {
        _vcArray = [NSMutableArray array];
        }
    return _vcArray;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    for (int i = 0; i<self.titleArray.count; i++) {
        JinRiZuiHuoRootViewController *VC = [JinRiZuiHuoRootViewController new];
        
        VC.categoryId = self.idArray[i];
        
        [self.vcArray addObject:VC];
        [self addChildViewController:VC];
    }
    [self.view addSubview:self.selecterContentScrollView];
    [self.view addSubview:self.selecterToolScrollView];

    


}

- (void)viewWillAppear:(BOOL)animated{
    self.navigationItem.title = @"今日最火";
    
    self.view.backgroundColor = ViewControllerBlackgroundColor;
    
    self.navigationItem.hidesBackButton = YES;
    
    [self setLeftNavigationItem];
    
}

- (SelecterToolsScrollView *)selecterToolScrollView{
    if (!_selecterToolScrollView) {
        
        __weak typeof(self) weakSelf = self;
        
        CGRect rect = CGRectMake(0, 64, Screen_Width, 35);
        
        
        _selecterToolScrollView = [[SelecterToolsScrollView alloc] initWithFrame:rect SelecterConditionTitleArray:self.titleArray andTypeStyle:notHomeStyle andBtnBlock:^(UIButton *btn) {
            
            [weakSelf upDateVCViewFrom:btn.tag - 300];
            
        }];
    }
    return _selecterToolScrollView;
}

//创建内容控制器
- (SelecterContentsScrollView *)selecterContentScrollView{
    if (!_selecterContentScrollView) {
        __weak typeof (self) weakSelf = self;
        
        CGRect rect = CGRectMake(0, 64, Screen_Width, Screen_Height - 64 - 49);
        
        _selecterContentScrollView = [[SelecterContentsScrollView alloc] initWithFrame:rect SelecterConditionVCArray:self.vcArray AndStyle:notHomeStyle andBtnBlock:^(int num) {
            
            _selecterToolScrollView.backgroundColor = GYBgColor;
            _selecterToolScrollView.showsVerticalScrollIndicator = NO;
            _selecterToolScrollView.showsHorizontalScrollIndicator = NO;
            [weakSelf upDateSelecterToolsIndex:num];
        }];
        
    }
    return _selecterContentScrollView;
}

- (void)upDateSelecterToolsIndex:(NSInteger)index{
    
    [_selecterToolScrollView updateSeletedToolsIndex:index];
    
}

- (void)upDateVCViewFrom:(NSInteger)index{
    
    [_selecterContentScrollView updateVCViewFromIndex:index];
}

- (void)setLeftNavigationItem{
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"btn_back_n"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(popAction:)];
    
    self.navigationItem.leftBarButtonItem = item;
    
}

- (void)popAction:(UINavigationItem *)sender{
    
    [self.navigationController popViewControllerAnimated:YES];
}

































- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
