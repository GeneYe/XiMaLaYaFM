//
//  JinRiZuiHuoRootViewController.m
//  XiMaLaYaFM
//
//  Created by Gene_Ye on 2016/11/20.
//  Copyright © 2016年 Gene. All rights reserved.
//

#import "JinRiZuiHuoRootViewController.h"
#import "AFNetWorking_Request.h"
#import "ReMenFenXiangTableViewCell.h"

#import "GYAVPlayerViewController.h"

@interface JinRiZuiHuoRootViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)NSMutableArray *dataSource;

@property (nonatomic,strong)UITableView *tableView;

@end

@implementation JinRiZuiHuoRootViewController

- (NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 35, Screen_Width, Screen_Height - 64 - 51) style:UITableViewStylePlain];
        
        _tableView.dataSource = self;
        _tableView.delegate = self;
        
        
    }
    return _tableView;
}

- (void)viewDidLoad {
    
}

- (void)viewWillAppear:(BOOL)animated{
    [self netWorkRequest];
    self.view.backgroundColor = [UIColor whiteColor];
    
}

#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JinRIZuiHuoListModel *model = [[JinRIZuiHuoListModel alloc] initWithDictionary:self.dataSource[indexPath.row]];
    
    ReMenFenXiangTableViewCell *cell = [ReMenFenXiangTableViewCell initCustomCellWithtableView:tableView WithJinRiZuiHuoListModel:model Row:indexPath.row];
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    JinRIZuiHuoListModel *model = [[JinRIZuiHuoListModel alloc] initWithDictionary:self.dataSource[indexPath.row]];
    
    NSString *content = model.title;
    CGFloat contentH = [content boundingRectWithSize:CGSizeMake(294, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:17]} context:nil].size.height;
    
    return (50 + contentH);

    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    JinRIZuiHuoListModel *model = [[JinRIZuiHuoListModel alloc] initWithDictionary:self.dataSource[indexPath.row]];
    
    GYAVPlayerViewController *AVPlayViewController = [[GYAVPlayerViewController alloc] init];
    
    AVPlayViewController.data_Source = self.dataSource;
    AVPlayViewController.row = indexPath.row;
    
    AVPlayViewController.uid = [NSString stringWithFormat:@"%@",model.uid];
    
    AVPlayViewController.albumId = [NSString stringWithFormat:@"%@",model.albumId];
    AVPlayViewController.trackId = [NSString stringWithFormat:@"%@",model.trackId];
    
    UINavigationController *navVC = [[UINavigationController alloc] initWithRootViewController:AVPlayViewController];

    [self presentViewController:navVC animated:YES completion:nil];
}




- (void)netWorkRequest{
//    NSString *urlString = @"http://mobile.ximalaya.com/mobile/discovery/v3/rankingList/track?device=iPhone&pageId=1&pageSize=20&rankingListId=57&scale=3&subCategoryId=3&target=main&version=5.4.45";

    NSString *urlString = [NSString stringWithFormat:@"http://mobile.ximalaya.com/mobile/discovery/v3/rankingList/track?device=iPhone&pageId=1&pageSize=20&rankingListId=57&scale=3&subCategoryId=%@&target=main&version=5.4.45",_categoryId];
    [AFNetWorking_Request getRequestWithUrl:urlString Result:^(id result) {
        NSArray *array = [NSArray arrayWithArray:result[@"list"]];
        [self.dataSource addObjectsFromArray:array];
        [self.tableView reloadData];
        [self.view addSubview:self.tableView];
    }];
}












- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
