//
//  JingDianBiTingRootViewController.m
//  XiMaLaYaFM
//
//  Created by Gene_Ye on 2016/11/21.
//  Copyright © 2016年 Gene. All rights reserved.
//

#import "JingDianBiTingRootViewController.h"
#import "JingDianBiTingModel.h"
#import "JingDianBiTingTableViewCell.h"
#import "AFNetWorking_Request.h"

@interface JingDianBiTingRootViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *tableView;

@property (nonatomic,strong)NSMutableArray *dataSource;

@end



@implementation JingDianBiTingRootViewController

- (NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 39, Screen_Width, Screen_Height -49 - 64) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)viewWillAppear:(BOOL)animated{
    
    [self netWorkRequest];
    
}


#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    JingDianBiTingModel *model = [[JingDianBiTingModel alloc] initWithDictionary:self.dataSource[indexPath.row]];
    
    JingDianBiTingTableViewCell *cell = [JingDianBiTingTableViewCell initCustomCellWith:tableView Model:model row:indexPath.row+1];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}


- (void)netWorkRequest{
    
//    NSString *urlString = @"http://mobile.ximalaya.com/mobile/discovery/v3/rankingList/album?device=iPhone&pageId=1&pageSize=20&rankingListId=21&scale=3&subCategoryId=3&target=main&version=5.4.45";
    
    NSString *urlString = [NSString stringWithFormat:@"http://mobile.ximalaya.com/mobile/discovery/v3/rankingList/album?device=iPhone&pageId=1&pageSize=20&rankingListId=21&scale=3&subCategoryId=%@&target=main&version=5.4.45",_categoriesId];
    
    [AFNetWorking_Request getRequestWithUrl:urlString Result:^(id result) {
        self.dataSource = result[@"list"];
        
        [self.tableView reloadData];
        [self.view addSubview:self.tableView];
        
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
