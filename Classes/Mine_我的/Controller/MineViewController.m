//
//  MineViewController.m
//  XiMaLaYaFM
//
//  Created by Gene_Ye on 2016/11/15.
//  Copyright © 2016年 Gene. All rights reserved.
//

#import "MineViewController.h"
#import "MineTableViewCell.h"
#import "MineTopView.h"

#define TableViewCellIdentifier @"TableViewCellIdentifier"
@interface MineViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)NSMutableArray *titleImageArray;
@property (nonatomic,strong)NSMutableArray *titleArray;

@property (nonatomic,strong)UITableView *tableView;

@property (nonatomic,strong)MineTopView *topView;

@end

@implementation MineViewController

- (NSMutableArray *)titleImageArray{
    if (!_titleImageArray) {
        _titleImageArray = [[NSMutableArray alloc] initWithObjects:@"me_setting_boughttracks",@"me_setting_account", @"me_setting_device",@"me_setting_more",@"me_setting_feedback",@"me_setting_setting",nil];
    }
    return _titleImageArray;
}

- (NSMutableArray *)titleArray{
    if (!_titleArray) {
        _titleArray = [[NSMutableArray alloc] initWithObjects:@"已购声音",@"我的钱包",@"智能硬件设备",@"更多",@"意见反馈",@"设置", nil];
    }
    return _titleArray;
}

- (MineTopView *)topView{
    if (!_topView) {
        _topView = [[[NSBundle mainBundle] loadNibNamed:@"MineTopView" owner:nil options:nil] objectAtIndex:0];
        _topView.frame = CGRectMake(0, 0, Screen_Width, 250);
    }
    return _topView;
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, Screen_Height) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, 215)];
        _tableView.tableHeaderView = view;
       
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = ViewControllerBlackgroundColor;
    
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.topView];
    [self setNavigation];
}

- (void)setNavigation{
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    self.automaticallyAdjustsScrollViewInsets = NO;

}

#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 2;
    }
    else if (section == 1){
        return 1;
    }
    else{
        return 3;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MineTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TableViewCellIdentifier];

    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MineTableViewCell" owner:nil options:nil] objectAtIndex:0];
        
        if (indexPath.section == 0) {
            cell.titleImageView.image = [UIImage imageNamed:self.titleImageArray[indexPath.row]];
            cell.mineTitle.text = self.titleArray[indexPath.row];
        }
        else if (indexPath.section == 1){
            cell.titleImageView.image = [UIImage imageNamed:self.titleImageArray[indexPath.row + 2]];
            cell.mineTitle.text = self.titleArray[indexPath.row + 2];
        }
        else{
            cell.titleImageView.image = [UIImage imageNamed:self.titleImageArray[indexPath.row + 3]];
            cell.mineTitle.text = self.titleArray[indexPath.row + 3];
        }
    }
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    
//    NSLog(@"%f",scrollView.contentOffset.y);
//
//    if (scrollView.contentOffset.y < 1) {
//        self.topView.RL_y = 0;
//            self.topView.RL_Height = self.topView.RL_Height - scrollView.contentOffset.y* 0.3;
//    }
//
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
