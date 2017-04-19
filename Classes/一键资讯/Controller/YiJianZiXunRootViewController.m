//
//  YiJianZiXunRootViewController.m
//  XiMaLaYaFM
//
//  Created by Gene_Ye on 2016/11/21.
//  Copyright © 2016年 Gene. All rights reserved.
//

#import "YiJianZiXunRootViewController.h"
#import "AFNetWorking_Request.h"
#import "YiJianZiXunListTableViewCellTableViewCell.h"
#import "YiJianZiXunListModel.h"

#import "GYAVPlayerViewController.h"

@interface YiJianZiXunRootViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)NSMutableArray *dataSource;

@property (nonatomic,strong)UITableView *tableView;

@end

@implementation YiJianZiXunRootViewController

- (NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}
- (UITableView *)tableView{
    if (!_tableView ) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 39, Screen_Width, Screen_Height- 39 - 64) style:UITableViewStylePlain];
        
        _tableView.delegate = self;
        _tableView.dataSource =self;
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
    
    YiJianZiXunListModel *model = [[YiJianZiXunListModel alloc] initWithDictionary:self.dataSource[indexPath.row]];
    
    YiJianZiXunListTableViewCellTableViewCell *cell = [YiJianZiXunListTableViewCellTableViewCell initCustomWithTableView:tableView Model:model];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 110;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    YiJianZiXunListModel *model = [[YiJianZiXunListModel alloc] initWithDictionary:self.dataSource[indexPath.row]];
    
    GYAVPlayerViewController *AVPlayViewController = [[GYAVPlayerViewController alloc] init];
    
    AVPlayViewController.data_Source = self.dataSource;
    AVPlayViewController.row = indexPath.row;
    
    AVPlayViewController.uid = [NSString stringWithFormat:@"%@",model.uid];
    
    AVPlayViewController.albumId = [NSString stringWithFormat:@"%@",model.albumId];
    AVPlayViewController.trackId = [NSString stringWithFormat:@"%@",model.trackId];
    
    UINavigationController *navVC = [[UINavigationController alloc] initWithRootViewController:AVPlayViewController];
    
    
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:navVC animated:YES completion:nil];

    
}



- (void)netWorkRequest{
    
//    NSString *urlString = @"http://mobile.ximalaya.com/mobile/v1/album?albumId=3968330&device=iPhone&pageSize=20&source=0";
    
    NSString *urlString = [NSString stringWithFormat:@"http://mobile.ximalaya.com/mobile/v1/album?albumId=%@&device=iPhone&pageSize=20&source=0",_albumId];
    
    [AFNetWorking_Request getRequestWithUrl:urlString Result:^(id result) {
        
        NSDictionary *dataDic = [NSDictionary dictionaryWithDictionary:result[@"data"]];
        
        NSDictionary *tracksDic = [NSDictionary dictionaryWithDictionary:dataDic[@"tracks"]];
        
        self.dataSource = tracksDic[@"list"];
        
        [self.tableView reloadData];
        
        [self.view addSubview:self.tableView];
    }];
}











- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
