//
//  XinQIFaXianRootViewController.m
//  XiMaLaYaFM
//
//  Created by Gene_Ye on 2016/11/21.
//  Copyright © 2016年 Gene. All rights reserved.
//

#import "XinQIFaXianRootViewController.h"

@interface XinQIFaXianRootViewController ()

@end

@implementation XinQIFaXianRootViewController

- (SelecterToolsScrollView *)selecterToolScrollView{
    if (!_selecterToolScrollView) {

    }
    return _selecterToolScrollView;
}
//创建内容控制器
- (SelecterContentsScrollView *)selecterContentScrollView{
    if (!_selecterContentScrollView) {

    }
    return _selecterContentScrollView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setLeftNavigationItem];
    
    self.navigationItem.hidesBackButton = YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


- (void)setUpSelecterToolScrollViewWithTitleArray:(NSArray *)array{
    
    CGRect rect = CGRectMake(0, 64, Screen_Width, 35);
    
    __weak typeof(self) weakSelf = self;
    
    self.selecterToolScrollView = [[SelecterToolsScrollView alloc] initWithFrame:rect SelecterConditionTitleArray:array andTypeStyle:notHomeStyle andBtnBlock:^(UIButton *btn) {
        
        [weakSelf upDateVCViewFrom:btn.tag - 300];
        
    }];
}

- (void)setUpSelecterContenntsScrollViewWithVCArray:(NSMutableArray *)array{
    __weak typeof (self) weakSelf = self;
    
    CGRect rect = CGRectMake(0, 64, Screen_Width, Screen_Height - 64 - 49);
    
    self.selecterContentScrollView = [[SelecterContentsScrollView alloc] initWithFrame:rect SelecterConditionVCArray:array AndStyle:notHomeStyle andBtnBlock:^(int num) {
        
        self.selecterContentScrollView.backgroundColor = GYBgColor;
        self.selecterContentScrollView.showsVerticalScrollIndicator = NO;
        self.selecterContentScrollView.showsHorizontalScrollIndicator = NO;
        [weakSelf upDateSelecterToolsIndex:num];
    }];
    
    [self.view addSubview:self.selecterContentScrollView];
    [self.view addSubview:self.selecterToolScrollView];
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


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
