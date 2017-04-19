//
//  DiscoveryViewController.m
//  XiMaLaYaFM
//
//  Created by Gene_Ye on 2016/11/15.
//  Copyright © 2016年 Gene. All rights reserved.
//

#import "DiscoveryViewController.h"
#import "DiscoveryTableViewCell.h"
#import "AFNetWorking_Request.h"
#import "DiscoveryListModel.h"

@interface DiscoveryViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *tableView;

@property (nonatomic,strong)NSMutableArray *dataSource;

@end

@implementation DiscoveryViewController

- (NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, Screen_Width, Screen_Height - 64) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = ViewControllerBlackgroundColor;
    
    
    
    [self netWorkRequest];
    
    self.navigationItem.title = @"发现";
}
    
#pragma mark UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataSource.count;
}
    
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSDictionary *dic = [NSDictionary dictionaryWithDictionary:self.dataSource[section]];
    
    NSMutableArray *list = [NSMutableArray arrayWithArray:dic[@"list"]];
    
    return list.count;
}
    
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSDictionary *dic = [NSDictionary dictionaryWithDictionary:self.dataSource[indexPath.section]];
    
    NSMutableArray *list = [NSMutableArray arrayWithArray:dic[@"list"]];
    DiscoveryListModel *listModel = [[DiscoveryListModel alloc] initWithDictionary:list[indexPath.row]];
    
    DiscoveryTableViewCell *cell = [DiscoveryTableViewCell initCustomCellWithTableView:tableView Model:listModel];
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{

    
    return 10;
}
    
    
- (void)netWorkRequest{
    
    NSString *urlString = @"http://180.153.255.5/mobile/discovery/v1/square/list?cityCode=43_440000_4401&device=iPhone&version=5.4.45";
    
    [AFNetWorking_Request getRequestWithUrl:urlString Result:^(id result) {
        [self.dataSource addObjectsFromArray:result[@"list"]];
        [self.tableView reloadData];
        
        [self.view addSubview:self.tableView];
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
