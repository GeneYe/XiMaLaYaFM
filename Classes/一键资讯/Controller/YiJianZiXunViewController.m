//
//  YiJianZiXunViewController.m
//  XiMaLaYaFM
//
//  Created by Gene_Ye on 2016/11/21.
//  Copyright © 2016年 Gene. All rights reserved.
//

#import "YiJianZiXunViewController.h"
#import "AFNetWorking_Request.h"
#import "YiJianZiXunRootViewController.h"

@interface YiJianZiXunViewController ()

@end

@implementation YiJianZiXunViewController

- (NSMutableArray *)titleArray{
    if (!_titleArray) {
        _titleArray = [NSMutableArray array];
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
    self.navigationItem.title = @"一键资讯";
    [self netWorkRequest];
}
- (void)viewWillAppear:(BOOL)animated{
    
}

- (void)netWorkRequest{
    
    NSString *urlString = @"http://mobile.ximalaya.com/mobile/discovery/v1/news/tab?device=iPhone&version=5.4.45";
    
    [AFNetWorking_Request getRequestWithUrl:urlString Result:^(id result) {
        NSArray *array = [NSArray arrayWithArray:result[@"list"]];
        for (int i = 0; i < array.count; i++) {
            
            NSDictionary *dic = [NSDictionary dictionaryWithDictionary:array[i]];
            
            [self.titleArray addObject:dic[@"title"]];
            YiJianZiXunRootViewController *VC = [YiJianZiXunRootViewController new];
            VC.albumId = dic[@"albumId"];
            [self.vcArray addObject:VC];
        }
        
        [self setUpSelecterToolScrollViewWithTitleArray:self.titleArray];
        [self setUpSelecterContenntsScrollViewWithVCArray:self.vcArray];

    }];
    
    
    
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
