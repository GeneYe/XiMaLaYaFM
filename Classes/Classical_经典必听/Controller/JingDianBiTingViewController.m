//
//  JingDianBiTingViewController.m
//  XiMaLaYaFM
//
//  Created by Gene_Ye on 2016/11/21.
//  Copyright © 2016年 Gene. All rights reserved.
//

#import "JingDianBiTingViewController.h"
#import "JingDianBiTingRootViewController.h"
#import "AFNetWorking_Request.h"
#import "CategoriesModel.h"

@interface JingDianBiTingViewController ()

@end

@implementation JingDianBiTingViewController

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
    
}

- (void)viewWillAppear:(BOOL)animated{
    
    self.navigationItem.title = @"经典必听";
    
    [self netWorkRequest];

}


- (void)netWorkRequest{
    
    NSString *urlString = @"http://mobile.ximalaya.com/mobile/discovery/v3/rankingList/album?device=iPhone&pageId=1&pageSize=20&rankingListId=21&scale=3&target=main&version=5.4.45";
    
    [AFNetWorking_Request getRequestWithUrl:urlString Result:^(id result) {
        NSArray *array = result[@"categories"];
        for (int i = 0; i < array.count; i++) {
            CategoriesModel *model = [[CategoriesModel alloc] initWithDictionary:array[i]];
            
            [self.titleArray addObject:model.name];
            JingDianBiTingRootViewController *VC = [JingDianBiTingRootViewController new];
            VC.categoriesId = model.Id;
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
