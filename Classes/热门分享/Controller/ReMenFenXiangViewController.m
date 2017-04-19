//
//  ReMenFenXiangViewController.m
//  XiMaLaYaFM
//
//  Created by Gene_Ye on 2016/11/19.
//  Copyright © 2016年 Gene. All rights reserved.
//

#import "ReMenFenXiangViewController.h"
#import "AFNetWorking_Request.h"
#import "ReMenFenXiangTableViewCell.h"

#import "GYAVPlayerViewController.h"

@interface ReMenFenXiangViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *tableView;

@property (nonatomic,strong)NSMutableArray *dataSource;

@end

@implementation ReMenFenXiangViewController

- (NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, Screen_Width, Screen_Height - 64) style:UITableViewStylePlain];
        
        _tableView.dataSource = self;
        _tableView.delegate = self;
        
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self netWorkRequest];
    
    
    
}

- (void)viewWillAppear:(BOOL)animated{
    
    self.navigationItem.title = @"热门分享";
    
    self.navigationItem.hidesBackButton = YES;
    
    [self setLeftNavigationItem];

}

#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ReMenFenXiangModel *model = [[ReMenFenXiangModel alloc] initWithDictionary:self.dataSource[indexPath.row]];
    
    ReMenFenXiangTableViewCell *cell = [ReMenFenXiangTableViewCell initCustomCellWithtableView:tableView WithReMenFenXiangModel:model Row:indexPath.row];
 
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ReMenFenXiangModel *model = [[ReMenFenXiangModel alloc] initWithDictionary:self.dataSource[indexPath.row]];
    
    NSString *content = model.title;
    
    
    CGFloat contentH = [content boundingRectWithSize:CGSizeMake(294, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:17]} context:nil].size.height;
    
    
    
    return 60 + contentH;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ReMenFenXiangModel *model = [[ReMenFenXiangModel alloc] initWithDictionary:self.dataSource[indexPath.row]];

    
    GYAVPlayerViewController *AVPlayViewController = [GYAVPlayerViewController shareInstance];
    
    AVPlayViewController.data_Source = self.dataSource;
    
    AVPlayViewController.row = indexPath.row;
    
    AVPlayViewController.uid = [NSString stringWithFormat:@"%@",model.uid];
    
    AVPlayViewController.albumId = [NSString stringWithFormat:@"%@",model.albumId];
    AVPlayViewController.trackId = [NSString stringWithFormat:@"%@",model.trackId];
    
    UINavigationController *navVC = [[UINavigationController alloc] initWithRootViewController:AVPlayViewController];
    
    
    [self presentViewController:navVC animated:YES completion:nil];
    
}


- (void)setLeftNavigationItem{
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"btn_back_n"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(popAction:)];
    
    self.navigationItem.leftBarButtonItem = item;
    
}

- (void)popAction:(UINavigationItem *)sender{
    
    [self.navigationController popViewControllerAnimated:YES];
}



- (void)netWorkRequest{
    
    NSString *urlStr = @"http://mobile.ximalaya.com/mobile/discovery/v3/rankingList/track?device=iPhone&pageId=1&pageSize=20&rankingListId=54&scale=3&target=main&version=5.4.45";
    
    [AFNetWorking_Request getRequestWithUrl:urlStr Result:^(id result) {
        
        [self.dataSource addObjectsFromArray:result[@"list"]];
        
        [self.view addSubview:self.tableView];
        
        [self.tableView reloadData];
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
