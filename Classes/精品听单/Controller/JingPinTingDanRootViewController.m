//
//  JingPinTingDanRootViewController.m
//  XiMaLaYaFM
//
//  Created by Gene_Ye on 2016/11/21.
//  Copyright © 2016年 Gene. All rights reserved.
//

#import "JingPinTingDanRootViewController.h"
#import "JingPinTingDanTableViewCell.h"
#import "AFNetWorking_Request.h"
#import "JingPinTingDanModel.h"

#import "GYAVPlayerViewController.h"

@interface JingPinTingDanRootViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong)NSMutableArray *dataSource;

@property (nonatomic,strong)UITableView *tableView;

@end

@implementation JingPinTingDanRootViewController

- (NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, Screen_Width, Screen_Height - 39 - 49) style:UITableViewStylePlain];
        
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self netWorkRequest];
}

- (void)viewWillAppear:(BOOL)animated{
    self.navigationItem.title = @"精品听单";
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    JingPinTingDanModel *model = [[JingPinTingDanModel alloc] initWithDictionary:self.dataSource[indexPath.row]];
    
    JingPinTingDanTableViewCell *cell = [JingPinTingDanTableViewCell initCustomCellWithTableView:tableView model:model];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (void)netWorkRequest{
    
    NSString *urlString = @"http://mobile.ximalaya.com/m/subject_list?device=iPhone&page=1&per_page=20&scale=3";

    [AFNetWorking_Request getRequestWithUrl:urlString Result:^(id result) {
        
        self.dataSource = result[@"list"];
        
        [self.tableView reloadData];
        
        [self.view addSubview:self.tableView];
    }];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
    
}

@end
