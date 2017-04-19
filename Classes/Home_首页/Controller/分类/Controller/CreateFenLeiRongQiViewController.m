//
//  CreateFenLeiRongQiViewController.m
//  Himalayas_FM
//
//  Created by Jimuta_NI on 16/11/17.
//  Copyright © 2016年 Jimuta_NI. All rights reserved.
//


#import "CreateFenLeiRongQiViewController.h"
#import "AFNetWorking_Request.h"




@interface CreateFenLeiRongQiViewController ()

@property (nonatomic,strong)NSMutableArray *topTitleArray;

@end

@implementation CreateFenLeiRongQiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self netWorkRequest];
    [self createRongQiVC];
    [self.view addSubview:self.selecterToolsScrollView];
    [self.view addSubview:self.selecterContentsScrollView];
}

#pragma mark -- 懒加载 --
//- (NSArray *)titleArray{
//    if (!_titleArray) {
//    }
//    return _titleArray;
//}
- (NSMutableArray *)vcArray{
    if (!_vcArray) {
        
        _vcArray = [NSMutableArray array];
        for (int i = 0; i < self.titleArray.count; i ++) {
            
            UIViewController *vc = [UIViewController new];
            vc.view.backgroundColor = ViewControllerBlackgroundColor;
            [self addChildViewController:vc];
            [_vcArray addObject:vc];
        }
    }
    return _vcArray;
}
- (void)createRongQiVC{
    _fenLeiRongQiVC = [NSMutableArray array];
    //fenLeiRongQiVC 装29个容器
    for (int i = 0; i < _rongQiCount; i++) {
        CreateFenLeiRongQiViewController *rongQiVC = [CreateFenLeiRongQiViewController new];
        rongQiVC.rongQiID = _ID;
        [_fenLeiRongQiVC addObject:rongQiVC];
    }
}
- (void)netWorkRequest{
    
    //http://mobile.ximalaya.com/mobile/discovery/v1/category/keywords?category #Id=3# &device=iPhone&statEvent=pageview%2Fcategory%40%E6%9C%89%E5%A3%B0%E4%B9%A6&statModule=%E6%9C%89%E5%A3%B0%E4%B9%A6&statPage=tab%40%E5%8F%91%E7%8E%B0_%E5%88%86%E7%B1%BB
    NSString *urlStringOne = @"http://mobile.ximalaya.com/mobile/discovery/v1/category/keywords?category";
    NSString *urlStringTow = @"&device=iPhone&statEvent=pageview%2Fcategory%40%E6%9C%89%E5%A3%B0%E4%B9%A6&statModule=%E6%9C%89%E5%A3%B0%E4%B9%A6&statPage=tab%40%E5%8F%91%E7%8E%B0_%E5%88%86%E7%B1%BB";
    NSString *urlString = [NSString stringWithFormat:@"%@Id=%ld%@",urlStringOne,_ID,urlStringTow];
//    [AFNetWorking_Request getRequestWithUrl:urlString result:^(id result) {
//        
//    }];
    [AFNetWorking_Request getRequestWithUrl:urlString Result:^(id result) {
        NSArray *array = result[@"keywords"];
        
        _topTitleArray = [NSMutableArray array];
        [_topTitleArray addObject:@"推荐"];
        for (int i = 0; i < array.count; i ++) {
            
            NSDictionary *dic = array[i];
            [_topTitleArray addObject:dic[@"keywordName"]];
        }
        _titleArray = [NSMutableArray arrayWithArray:_topTitleArray];
    }];
}



-(SelecterToolsScrollView *)selecterToolsScrollView{
    
    if (!_selecterToolsScrollView) {
        
        __weak typeof(self) weakSelf = self;
        //        _selecterToolsScrollView = [[SelecterToolsScrollView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth*3/5, 35) SelecterConditionTitleArray:self.titleArray andTypeStyle:homeStyle andBtnBlock:^(UIButton *btn) {
        //            [weakSelf upDateVCViewFromIndex:btn.tag-300];
        //        }];
//        _selecterToolsScrollView = [[SelecterToolsScrollView alloc] initWithFrame:CGRectMake(0, 64, Screen_Width, 40) SeleterConditionTitleArray:self.titleArray andTypeStyle:homeStyle andBtnBlock:^(UIButton *btn) {
//            [weakSelf upDateVCViewFromIndex:btn.tag-300];
//        }];
        
        _selecterToolsScrollView = [[SelecterToolsScrollView alloc] initWithFrame:CGRectMake(0, 64, Screen_Width, 40) SelecterConditionTitleArray:self.titleArray andTypeStyle:homeStyle andBtnBlock:^(UIButton *btn) {
            [weakSelf upDateVCViewFromIndex:btn.tag-300];
        }];
    }
    return _selecterToolsScrollView;
}
- (void)upDateVCViewFromIndex:(NSInteger)index{
    
    [_selecterContentsScrollView updateVCViewFromIndex:index];
}

-(SelecterContentsScrollView *)selecterContentsScrollView{
    
    if (!_selecterContentsScrollView) {
        
        __weak typeof(self) weakSelf = self;
//        _selecterContentsScrollView = [[SelecterContentsScrollView alloc] initWithFrame:CGRectMake(0, 64, Screen_Width, Screen_Height-44-49) SelecterConditionVCArray:self.vcArray andTypeStyle:homeStyle andBtnBlock:^(int num) {
//            
//            [weakSelf updateSeceterToolsIndex:num];
//        }];
        
        _selecterContentsScrollView = [[SelecterContentsScrollView alloc] initWithFrame:CGRectMake(0, 64, Screen_Width, Screen_Height - 44 - 49) SelecterConditionVCArray:self.vcArray AndStyle:homeStyle andBtnBlock:^(int num) {
            [weakSelf updateSeceterToolsIndex:num];
        }];
    }
    return _selecterContentsScrollView;
}
- (void)updateSeceterToolsIndex:(NSInteger)index{
    
    [_selecterToolsScrollView updateSeletedToolsIndex:index];
}
@end












