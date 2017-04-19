//
//  HomeRongQIViewController.m
//  XiMaLaYaFM
//
//  Created by Gene_Ye on 2016/11/16.
//  Copyright © 2016年 Gene. All rights reserved.
//

#import "HomeRongQIViewController.h"
#import "BangDanViewController.h"
#import "HomeFenLeiViewController.h"
#import "ReMenViewController.h"
#import "TuiJianViewController.h"
#import "ZhuBoViewController.h"
#import "ZhuBoAAAViewController.h"
#import "ZhuBoBBBViewController.h"

#import "HomeNavigationBarCenterItem.h"

@interface HomeRongQIViewController ()<UIScrollViewDelegate>

@end


//此乃容器，并不做事，只用于放子controllers

@implementation HomeRongQIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self.view addSubview:self.selecterContentScrollView];
    
    [self.view addSubview:self.selecterToolScrollView];
    
}

- (void)viewWillAppear:(BOOL)animated{
    
    [self setUpNavigationBarLeftItem];
    
    [self setUpNavigationBarRightItems];
    
    [self setUpNavigationTitleView];
    
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    
//    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
  
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, 64)];
    view.backgroundColor = ViewControllerBlackgroundColor;
    
    [self.view addSubview:view];
}
- (NSArray *)titleArray{
    if (!_titleArray) {
        _titleArray = @[@"分类",@"热门",@"主播"];
//          _titleArray = @[@"热门",@"分类",@"榜单",@"主播"];
    }
    return _titleArray;
}

- (NSMutableArray *)vcArray{
    if (!_vcArray) {
//        TuiJianViewController *tuiJianVC = [[TuiJianViewController alloc] init];
        HomeFenLeiViewController *fenLeiVC = [[HomeFenLeiViewController alloc] init];
        ReMenViewController *reMenVC = [[ReMenViewController alloc] init];
        
//        BangDanViewController *bangDanVC = [[BangDanViewController alloc] init];
        ZhuBoViewController *zhuBoVC = [[ZhuBoViewController alloc] init];
        
//        [self addChildViewController:tuiJianVC];
        [self addChildViewController:fenLeiVC];
        [self addChildViewController:reMenVC];
        
//        [self addChildViewController:bangDanVC];
        [self addChildViewController:zhuBoVC];
        
        _vcArray = [NSMutableArray arrayWithObjects:fenLeiVC,reMenVC,zhuBoVC, nil];
//        _vcArray = [NSMutableArray arrayWithObjects:reMenVC,fenLeiVC,bangDanVC,zhuBoVC, nil];
        
    }
    return _vcArray;
}
- (SelecterToolsScrollView *)selecterToolScrollView{
    if (!_selecterToolScrollView) {
        
        __weak typeof(self) weakSelf = self;
        
        CGRect rect = CGRectMake(0, 64, Screen_Width, 35);
        
        _selecterToolScrollView = [[SelecterToolsScrollView alloc] initWithFrame:rect SelecterConditionTitleArray:self.titleArray andTypeStyle:homeStyle andBtnBlock:^(UIButton *btn) {
            
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
        
        _selecterContentScrollView = [[SelecterContentsScrollView alloc] initWithFrame:rect SelecterConditionVCArray:self.vcArray AndStyle:homeStyle andBtnBlock:^(int num) {
            
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


- (void)setUpNavigationBarLeftItem{
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"top_logo"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:nil];
    
    self.navigationItem.leftBarButtonItem = item;
    
    
    
}

- (void)setUpNavigationTitleView{
    
    HomeNavigationBarCenterItem *item = [HomeNavigationBarCenterItem initCustomSearchButtonWithFrame:CGRectMake(0, 0, Screen_Width/2, 30)];
    [item addTarget:self action:@selector(pushToSeachView:) forControlEvents:UIControlEventTouchDown];
    
    self.navigationItem.titleView = item;
    
}



- (void)pushToSeachView:(UIButton *)sender{
    NSLog(@"11111");
}

- (void)setUpNavigationBarRightItems{
    
    UIBarButtonItem *recordsItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"top_history_n"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(pushToRecordsVC:)];
    
    recordsItem.imageInsets = UIEdgeInsetsMake(0, 0, 0, -18);
    
    UIBarButtonItem *downloadItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"top_download_n"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(pushToDownloadVC:)];
    
    
    self.navigationItem.rightBarButtonItems = @[downloadItem,recordsItem];
    
}

- (void)pushToRecordsVC:(UIBarButtonItem *)sender{
    NSLog(@"尼玛个大西瓜");
}

- (void)pushToDownloadVC:(UIBarButtonItem *)sender
{
    NSLog(@"丑逼别说话啊你麻痹");
}









- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
